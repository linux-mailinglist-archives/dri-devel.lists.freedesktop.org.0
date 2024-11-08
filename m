Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1D79C2790
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 23:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F7A10E299;
	Fri,  8 Nov 2024 22:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSWSnN36";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F3E10E299
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 22:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731104967; x=1762640967;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MhpyXbpBjK+JtgsvqqHp0P0pT4kXGmkxdXOx/Vo26qg=;
 b=QSWSnN36ozy9GwiAtP9EId7xJ4BSp+IByn2NvQP6L83ioMOKuzcFDq4b
 8gd93kXARcDP586d3Lv1Qz/fobEfEgrxRbR/CRy6yERtrag6LmnlrpRKP
 ygvmMJx8/pZ5ixZH8qg09pAcljMKgXgrcZPnDKCKuBrFOsTjDzYLgfIGH
 9dttIPjHxNmqzP4nXlg1lA7e/lpON6DTPnh4j7UMC4lbMA1VZdga8+MA9
 am4CTzqrV0ZdmZGT+qsmTQCahFbOEriqVOYLGHh7YQ6Q9HW2fzogWZaol
 EZaq/6oDXvgQcl6Dq01kzkC3EoBwjRueI6QYlV/+sQJbGvddm6OhNkiLN g==;
X-CSE-ConnectionGUID: TObWexrBS9OxrHsvAcRywQ==
X-CSE-MsgGUID: vsKq7uHiRzi9Azp4RpnCkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48457516"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="48457516"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 14:27:05 -0800
X-CSE-ConnectionGUID: QRJ2Rs1tRKmfyI+u9mFP/w==
X-CSE-MsgGUID: MXwf6HJZQRalgHgVkx2M3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="90600667"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 14:27:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 14:27:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 14:27:04 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 14:27:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbb/5xxzwcfNiMJzS5q8BV0TPA4LAPfZmbvVDxyKdJHTQpZzs9KBHMR/3QkqCnk9ptBQCE389d05PylmUdoLOJiewSRoXmpr6VrzXQX2xm72LLnghsDEPA2WBvU4on2+2FgHlEK95c2Aem76wwuB1Uiltz+3uZF4CQMI7Pcur3U+Rhh0GgLAECPf5bVuVaTtqq5HQZReuPKOr+omiGLOqL9E36QZTIBN3UjLXQqUjL5MsJzUiCUOiNudoPgLM1kYXR2WiixZv0onG9ViPOq6uZlQyQgf2SxFSkw4MQ7BP8r8rKUnGH1x0CrZ5TNm+SIH0PPMUKMWrXH1W8bpdbWCwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpdUkiwIrD5LBsz6jYFBZ68u9pZh09iMyPNG2O2u4NE=;
 b=lPOIz1ltbg8fIwlECohCxACy/8tEskfA/+Op3g9rAwYGR1VuaA4ElQCtVwV8jq3dAe3QGRK9eTjS6r0LSN2nBMiyec6b5/Qkkhl+/R7AuJGvOA8DDOlT42GXG37SoDJN+9rulLvYlvcci+zMBLe/pNGntM0it79DupFIBOCAKSSPYqpBUIRsQYJbwcVF/OC2SxBUlY83EtkO5JRbFQmnIl8AF8Gcf0839UrM2MqEEiBa4hNiQ+fZXIK9ilqAMrL/pGM195AtItk60y7e+L+PAUnSA7pvWs1Poei1x0ncV6vCuU5IhQcPGzx0Lu+WPyjZFSUDJVd7SpqIY+xxUxeaWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7941.namprd11.prod.outlook.com (2603:10b6:208:3ff::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Fri, 8 Nov
 2024 22:27:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Fri, 8 Nov 2024
 22:27:00 +0000
Date: Fri, 8 Nov 2024 14:27:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Mihail Atanassov <mihail.atanassov@arm.com>,
 <linux-kernel@vger.kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 <dri-devel@lists.freedesktop.org>, David Airlie <airlied@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Alex Deucher
 <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, Shashank Sharma
 <shashank.sharma@amd.com>, Ketil Johnsen <ketil.johnsen@arm.com>, Akash Goel
 <akash.goel@arm.com>
Subject: Re: [RFC PATCH 00/10] drm/panthor: Add user submission
Message-ID: <Zy6QVH9FpAI32hMz@lstrano-desk.jf.intel.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
 <c64be651-2f40-4535-a537-b8304e6556ce@amd.com>
 <a3e78bf7-931e-4e49-8933-c3df9a503ffd@arm.com>
 <96ef7ae3-4df1-4859-8672-453055bbfe96@amd.com>
 <Ztd7g4Q8V9lFZ53R@phenom.ffwll.local>
 <090ae980-a944-4c00-a26e-d95434414417@amd.com>
 <80ffea9b-63a6-4ae2-8a32-2db051bd7f28@arm.com>
 <20240904132308.7664902e@collabora.com>
 <a5a53492-9651-403e-b613-91ef0b9e80b6@amd.com>
 <ZvKGzSeA7OT-hZQS@phenom.ffwll.local>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZvKGzSeA7OT-hZQS@phenom.ffwll.local>
X-ClientProxiedBy: MW4P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc730eb-808f-4661-1e4a-08dd00447672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3pndlNkVGFRN2RzZTl6VzZyZW1mbFI3UERxNXNPVTR5R0hLNHJEMVVaNlhi?=
 =?utf-8?B?RXJFZlJ1VnZvNE92L1ZMUUo2UHg3aGZzNEMzM09TWHd6bEFkRVZqSXpsVHFM?=
 =?utf-8?B?T0dkSEtZSFJ6eHhPNWp2K2tubHhBamM3YUl3NitHME4vWTNqTVBFNm9pMHB1?=
 =?utf-8?B?WDIrMXc0OVgwY0dYUTY3K3o5NWRPMHhRdW5mekprQy9sbDMzTFNWb2xpeW56?=
 =?utf-8?B?dU5mNjZ2QzNqK0VZOTdUT24xdURSTkdDT0VQdngvT054ZFpFSGc5d2VTL0Fi?=
 =?utf-8?B?Q1htTHBDc0dDRWV3UmtteDhySHc3d1RzdjU3aTBjUXNwRzQ1d1RQM3RuYW9J?=
 =?utf-8?B?N2N5Mi9hNCtVeGhNbGhuWHJIb1RMRHFHM3k1RUprS3JIN3FDdklST1lST2Uv?=
 =?utf-8?B?QlpwTkwwVENmL0JIYVVoWStNclJDdi82MDh5NkJUKzdEbEJOaW1sZFNMVE5l?=
 =?utf-8?B?a3ZCSW13ZVVRbmxSWWRZWjRydFMyQkNsOFJTcXdINWRZczJiQy84clRMUWky?=
 =?utf-8?B?OFFUbk40RVdMZFcrSGttOGJFdmhvSnlJWVJEWlVMV1pQVEpmTkxPdkFmMmZi?=
 =?utf-8?B?MDNTYnN1WDBLQmphRDE1OGlkZkpGd2FEajdpaWpUNm9hcW9tcjU4bHZJT3J4?=
 =?utf-8?B?ODV5UGNmSlVreW9UUlNQU3FIVDNDL0huenBncmFvVVN6a1Q0QllncWI0c294?=
 =?utf-8?B?dFU3ZVEvcjY5eExQaE00TlNLc0RNeUl2NzU4SnppaEgrM1FhbUNPSnNiOW10?=
 =?utf-8?B?NUdUTkFNSG5OZ0x6dy8zeUpFeVBkaUl0U2pRcHBaektJcjBkNHIzcU1QQ2Jj?=
 =?utf-8?B?aDdNOEZEWENyKzU5MUZudmRIeE1KbUFpTlpqaW5pekh0NUFtU3ZSWTdHWGhm?=
 =?utf-8?B?Z2ZIN2tXZlRjMk5nTUhRZkdPNXJkazc0c0FwN0NRT0tJeUYrbEhCRUhLdmtz?=
 =?utf-8?B?anMwT2Q0QVV0U21QeEFrV0xPb0Y3eWxuRmJSditnd2NJdzFUUGU0QkZvQnM3?=
 =?utf-8?B?cXFyNzM0TUxneVNGQmM1WjZQbGIxRVl2UlNwelg4c2NwTll2NERVVDdIL1ZM?=
 =?utf-8?B?Z3h2TkJuQ1JVRHdDK2ZHc3JFZFJ1QlRnUHU4d1FwLzhBbnlIcUNRcXZZMXl2?=
 =?utf-8?B?S0VYTU4xTG1ObExRaFJLYzNWQ3NyN2NtclprOUdaWTU1UlgxTDMreUdEY0Ja?=
 =?utf-8?B?VENsODNjWEZPR0kxMWNhWVZqTW1pYktKclNHbHZNNVhQdzM0NjNoYmVpWHRy?=
 =?utf-8?B?eHNaenYvUklEQjJDdHhxWlJ6Q1lkV1gzdWxrOElBMk4zN01uUkVGSXpZdVhC?=
 =?utf-8?B?SEtSSldTV2I4TXpmcFlhSFgwRWdBNmtNUU1tRS9KR0x3ODBHQjNFYjVJL0dT?=
 =?utf-8?B?eGJ4Mkpkalo5UVVacWwwaXRkVGJtMFZRVUFpem54TmpXOWxTUm5jT3U3eHN3?=
 =?utf-8?B?SkxDQ2tqTEJ6U1N6MXNidWRJZjBYWGZ4WndJY1Q2aC9Ddk8yMS9xY29GUStZ?=
 =?utf-8?B?VFE4NEhEWFFlU21FNVhGTTAxelAvRXFESVh2M0xJbmQ3dHpzS3R4eit6YXU2?=
 =?utf-8?B?QXdwNXlneXhLMTRTbCthSnBSajlXVVNHUldNRU9KUlM2T3BKdG9yRkFmM2x5?=
 =?utf-8?B?NVIwWnczblBpbDMrZGVtWGwrVnUyZzZZakVkZGFnRU5JWVV3N1NoMlFpakwx?=
 =?utf-8?Q?LORzKwbiXZ3HJkL+nogf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUxZOHJFcGYzYjd2ejBOVThpdkFGL0lkNGIxMWRham5HODVlaE54ZDU0WGh5?=
 =?utf-8?B?YmZLMm1zZzEvblprclBNRUFNd1N1dUFoeTI1U0gzNmthRHZCOXpCc0xKalhs?=
 =?utf-8?B?SmpnQmVaQkprTmh6R3F4aDJ1TkZwZmxHcWpNYWIvTDJzUVJxYTRSUE5vRGg5?=
 =?utf-8?B?a3pBT1hPVk5kVzhGbjBwQ2FXaVU3SnR0dXc3dy9EeFdETThsVklGcm9DVHdG?=
 =?utf-8?B?dVh4RXpLTG1PTEd3WmhSTkV3YWUrejlrZ3R0c3dkZG1CcHg1bTBFTlpFVk9w?=
 =?utf-8?B?UXkyTTN6dVZOVGs0NldJdGRwN0grWjNPV0gwYXo2YWRwdnVZckQxckZoVFhQ?=
 =?utf-8?B?Qis3UzJhbjRMbkRLa24zSWp3Y2RLUWFFQ0JvdU9PQWlrQ2NqODRFMzU4SUJn?=
 =?utf-8?B?aTcrSDBuZzhSWW5rcm1kS3hTc1VJT05vazc4M1BBQ3lJSG9ORTZWSFZMZEVD?=
 =?utf-8?B?bzQreHBTTDloUkhvSzZnandNMzhsR2dJYXp6cGxzVmJ5bVZLVEtCeXdiZWJ4?=
 =?utf-8?B?Mi9taUF0dmthWEtseFQ3RHEwd1BtT3NRRnI0VENWczFFdkFPTkRDZ05IV0dm?=
 =?utf-8?B?U0FqeDNrZjlMQTN2UzExTEpSYnZOT2trb3A1VlVNaUN6TVlxUFZ6UjF4NkJ6?=
 =?utf-8?B?Q0l1NWczbFFRM2huV25xdWt2eWtGd1VRRzVLeTNkdTJWaFdpcDRVUzlTVW4v?=
 =?utf-8?B?WlNDTjdrUm1lMGRLMFJjUWhOelZiMGU5dmRCZ2xzMGtoaVNGTjdZUFZkVml6?=
 =?utf-8?B?a3RPMzFtUmdKUkFvNE1ZMHZlaEVwRmM2M25vSjgrSzRVQVdGeDRkQm40cU9a?=
 =?utf-8?B?bllnTUZ3ekxRY3M1WDVadVNaUEhoeFI5a040S2tSay9qNE1MK25FUE4zR2Vz?=
 =?utf-8?B?SVVPeHpqWVNZeWROWUd0Q3RacTlwR3psdGFhaDdMMFRyRmJIVkNWYk50NmFl?=
 =?utf-8?B?aytnYUlpNnRaUFFlbUJiN0xiYU1XMHFPay95NStrejRDV2Y0M3l6RlViRk1N?=
 =?utf-8?B?YkN5WUZtTEtILzU3QnpVczFyZXBPUXVKREpsWExpaEVOa0tsRnZsbWZaNSsz?=
 =?utf-8?B?L0ZxMFFteTMrOHdUL0ttbXpOZDlxeHN5ZlpDVGxZSTJNRXRiZjJ6UGZUb2dN?=
 =?utf-8?B?T2pMR0VzaEs0YjBINEwzVUwwam9wV3MwcXdkVkJkRUl3ZERFWmpzRWppTWJs?=
 =?utf-8?B?SUYvc3FkN21QNVN6SStySjU0QkFIU1NGejZyRk5kcFRMZFhGNXk0MFJ1MnJh?=
 =?utf-8?B?NWsrODQ3S2l3aXJXcjBxNjdTMHBGTUxQb2pqVjBhNDZPYXQxeXhHRFU0T21a?=
 =?utf-8?B?SUIzVlFsS0NJM3V2TktsY1hFOHQzeTIxaldpcTlvdjFMc3FIVitHV3oyb0NE?=
 =?utf-8?B?eW1JU3RGeFkzNVVqNGpYNE1qYUhBWWtMamtSQjVUMnZ0WVl5bTlpYTNFUXBx?=
 =?utf-8?B?enJvQVRhUmlRNHNjNW5pT0RRQWN0dlUrVi9NWHlIc0xJb0RWcEZjTFZRWFo3?=
 =?utf-8?B?cjZRbHJOTGJObXh4L0lPZmxnd1JvT09XSGo3K0V0c2xlUGQwSFNzNTc1MzN1?=
 =?utf-8?B?NVljWlYvbE5zNThTbDlnNTJTb1p5aUpqVnBuS2MvcjJUaEJBbFdoMzFsS01a?=
 =?utf-8?B?NkpDMFA2N29xbVpKaTlveG41Q3lTZDN1VHc3Uzg1bVNVbCs5bno4RjJXaEZ2?=
 =?utf-8?B?VDUrYTBvQzZDa2YzcnBlZDI2V0J4VGFVblk5V2RjTXJBQ1pGOE5ZaHVZTjBY?=
 =?utf-8?B?bldOS0EyVTFIT0lsQVk1YzMxVW1DR1pxREhJRWpFSENwQ3Q0OGEzQ3dNWFVI?=
 =?utf-8?B?anVKTjBFd0gzV05HQW9Za21GYnp6WGw2cGhXRFJtNHRNVzg0czBuU2FoeHRl?=
 =?utf-8?B?eW90clJHUlNJeHhORE1rczNSQ0NiSjFYeHRRS2hrMk5uYmVZakpHYmVHbDBN?=
 =?utf-8?B?SVJVc04rUVFXSWY2MUdQNmd5WWh6VUN0YXRLanZIcXltRXpuYm0zaTludFor?=
 =?utf-8?B?VVBZanVGTENybER0L2NnY0Z3amROV25rSFY3TWJSd0xZM3F2NXlnV3BwajE1?=
 =?utf-8?B?Tmd0UWdFaWRqUHFBQlVoTytEU1BXUFAyTWZUUFZvMzNZeWVWY01RcVFYYjVV?=
 =?utf-8?B?WnRlTTF6UDZ4MzlVV25uaHVCNXhtc0s2OTVSL00xLzVBb1A1S3l5MG9KUGEr?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc730eb-808f-4661-1e4a-08dd00447672
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 22:27:00.2848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFojaXDR2BqUjovf9ddhu+nXf/XmlYQoep5Vf+ZHonWu5Q5HwvSE/ssp6njzml7ZrFTJB+kXl0C5ZsO9tE9gQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7941
X-OriginatorOrg: intel.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 24, 2024 at 11:30:53AM +0200, Simona Vetter wrote:
> Apologies for the late reply ...
> 

Also late reply, just read this.

> On Wed, Sep 04, 2024 at 01:34:18PM +0200, Christian König wrote:
> > Hi Boris,
> > 
> > Am 04.09.24 um 13:23 schrieb Boris Brezillon:
> > > > > > > Please read up here on why that stuff isn't allowed:
> > > > > > > https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences
> > > > > > panthor doesn't yet have a shrinker, so all memory is pinned, which means
> > > > > > memory management easy mode.
> > > > > Ok, that at least makes things work for the moment.
> > > > Ah, perhaps this should have been spelt out more clearly ;)
> > > > 
> > > > The VM_BIND mechanism that's already in place jumps through some hoops
> > > > to ensure that memory is preallocated when the memory operations are
> > > > enqueued. So any memory required should have been allocated before any
> > > > sync object is returned. We're aware of the issue with memory
> > > > allocations on the signalling path and trying to ensure that we don't
> > > > have that.
> > > > 
> > > > I'm hoping that we don't need a shrinker which deals with (active) GPU
> > > > memory with our design.
> > > That's actually what we were planning to do: the panthor shrinker was
> > > about to rely on fences attached to GEM objects to know if it can
> > > reclaim the memory. This design relies on each job attaching its fence
> > > to the GEM mapped to the VM at the time the job is submitted, such that
> > > memory that's in-use or about-to-be-used doesn't vanish before the GPU
> > > is done.
> > 
> > Yeah and exactly that doesn't work any more when you are using user queues,
> > because the kernel has no opportunity to attach a fence for each submission.
> > 
> > > > Memory which user space thinks the GPU might
> > > > need should be pinned before the GPU work is submitted. APIs which
> > > > require any form of 'paging in' of data would need to be implemented by
> > > > the GPU work completing and being resubmitted by user space after the
> > > > memory changes (i.e. there could be a DMA fence pending on the GPU work).
> > > Hard pinning memory could work (ioctl() around gem_pin/unpin()), but
> > > that means we can't really transparently swap out GPU memory, or we
> > > have to constantly pin/unpin around each job, which means even more
> > > ioctl()s than we have now. Another option would be to add the XGS fence
> > > to the BOs attached to the VM, assuming it's created before the job
> > > submission itself, but you're no longer reducing the number of user <->
> > > kernel round trips if you do that, because you now have to create an
> > > XSG job for each submission, so you basically get back to one ioctl()
> > > per submission.
> > 
> > For AMDGPU we are currently working on the following solution with memory
> > management and user queues:
> > 
> > 1. User queues are created through an kernel IOCTL, submissions work by
> > writing into a ring buffer and ringing a doorbell.
> > 
> > 2. Each queue can request the kernel to create fences for the currently
> > pushed work for a queues which can then be attached to BOs, syncobjs,
> > syncfiles etc...
> > 
> > 3. Additional to that we have and eviction/preemption fence attached to all
> > BOs, page tables, whatever resources we need.
> > 
> > 4. When this eviction fences are requested to signal they first wait for all
> > submission fences and then suspend the user queues and block creating new
> > submission fences until the queues are restarted again.
> 
> Yup this works, at least when I play it out in my head.
> 

I just started experimenting with user submission in Xe last week and
ended up landing on a different PoC, blissfully unaware future fences /
Mesa submit thread. However, after Sima filled me in, I’ve essentially
landed on exactly what Christian is describing in Xe. I haven’t coded it
yet, but have the design in my head.

I also generally agree with Sima’s comments about having a somewhat
generic preempt fence (Christian refers to this as an eviction fence)
as well.

Additionally, I’m thinking it might be beneficial for us to add a new
'preempt' dma-resv slot to track these, which would make it easier to
enforce the ordering of submission fence signaling before preempt
fences.

Depending on bandwidth, I may post an RFC to the list soon. I’ll also
gauge the interest and bandwidth from our Mesa team to begin UMD work.

Matt

> Note that the completion fence is only deadlock free if userspace is
> really, really careful. Which in practice means you need the very
> carefully constructed rules for e.g. vulkan winsys fences, otherwise you
> do indeed deadlock.
> 
> But if you keep that promise in mind, then it works, and step 2 is
> entirely option, which means we can start userspace in a pure long-running
> compute mode where there's only eviction/preemption fences. And then if
> userspace needs a vulkan winsys fence, we can create that with step 2 as
> needed.
> 
> But the important part is that you need really strict rules on userspace
> for when step 2 is ok and won't result in deadlocks. And those rules are
> uapi, which is why I think doing this in panthor without the shrinker and
> eviction fences (i.e. steps 3&4 above) is a very bad mistake.
> 
> > This way you can still do your memory management inside the kernel (e.g.
> > move BOs from local to system memory) or even completely suspend and resume
> > applications without their interaction, but as Sima said it is just horrible
> > complicated to get right.
> > 
> > We have been working on this for like two years now and it still could be
> > that we missed something since it is not in production testing yet.
> 
> Ack.
> -Sima
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
