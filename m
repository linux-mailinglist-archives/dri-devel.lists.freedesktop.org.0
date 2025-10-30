Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB0CC22432
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0248610EA54;
	Thu, 30 Oct 2025 20:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KiU3j2Yz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D1D10EA49;
 Thu, 30 Oct 2025 20:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856383; x=1793392383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OW6/RNnHKq6LUlNpG7OcEKWok841CtblQ9uDqZvWRS0=;
 b=KiU3j2YzMDeGnNzZrMSiCaxyr47vqqfL/GXIQBqH1XPBMQcYuBGsM/4v
 0aLHhmA3xx+6LJlY60FavlEaTospV3psTDtk9OPtiQ/1yOaZ7COZSQd4z
 5qlp32CArwr0VMBC3lzOGQd2xbSkRhJo2M9fYshs24SlXFH4VuNh6IvIs
 r+MQzW6/1FJZB8v5aq0Z9vYJmhFWZOijbNKEeEqzs7xQWwW702V1xbx6p
 sriHktBzaz/8cX0thmBXukijZRZXIl3tPW6ntYsNs0u6PKtakGRwDgRDC
 TFcsCKZHBq5PbcxBSsdNrM7riXZqh0szx9k3Zq0UD1itEu8MSVQhD1lrb Q==;
X-CSE-ConnectionGUID: nC35XYqkS4+RHgA1J07GFw==
X-CSE-MsgGUID: dO3bCBByRy61hvBmUv4wcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64052367"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64052367"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:02 -0700
X-CSE-ConnectionGUID: lbf5rrgBSpauJ9pdyCNfBg==
X-CSE-MsgGUID: N7nvfaotTB6twDjfyVi0aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="223284317"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:33:01 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFfIkGw9poGbRA2nutsoJz7oBzDoWV3zx/L+0IcoR1Dm5YPdPHVCL7/PX3KcDnw4KSnZyiUK79K5NLXLLGttsboL8HhYXYucbLkLduILa/np2RJ2/ngEEwQI6SxVQd04N5uB+Qqb2A7YTMDMVdwNndDtm6kAL+VouuLKAmTUuiJlguEiTV9idLX2KVzieR6ytonPil5c9vewwHzKqV6zmvqG/fq93fD1Cl5p7HjLk/DDwygkkSplXlM7jlJZPTECu68m/ivREsSoMbHqfXptfOVkkQVuQF3uMX2ZDrfsJEOvSru6PLA1rLNpJVPUY6AQd6nn8J5ZHr5CfTEXpF8UHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45Tw0oZIIPtnI/gtAwkViQ2FpfSlz/mrnWmy/Hpgizc=;
 b=WxyC/JQ2Fcuy6/0mA+GwOhZzxJFCUaoEbBj31YnRW9beEqPTogRDXE05Z4DcX4cGv9RA3/q3eg0LF16ANYQKIpMIaJNFknyqEmdZtzjI6GxpSyoz27RiU7FZygP6eVqHWbtariE2AsccFgxDHlvqAPHqnCNn/cvQ3DAvZO9KwEyqHosNra/jSHR1F6EmkLV3F1Fah2fVtgvLpbz9HY/m6/pVEpQ0GV9bHYTXIRrZNtIY0yHlII+ADBCbWlSGhnvD9dR0RgZZHMB/ICDnRT2lJTu+ts+8SdY8PFQIz/C5h6BZPl7E8t4DGXefCSAhXIK3Q9Qb5RvyPOQYEQGN1cZTAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:32:57 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:32:57 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v3 12/28] drm/xe/pf: Increase PF GuC Buffer Cache size and use
 it for VF migration
Date: Thu, 30 Oct 2025 21:31:19 +0100
Message-ID: <20251030203135.337696-13-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4817:EE_
X-MS-Office365-Filtering-Correlation-Id: f5ac9b14-dbef-41f7-faf2-08de17f3830d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0dnME5XdVVORzJJY2hjQnpZVjZzZTdGdHAxS0ZHUHc3M0ZpdTNKOUdocEVV?=
 =?utf-8?B?UFQ0YWhDU2NFYXFCdHV2emhYY1F6eVlTc3JXNG9mZHc4YjlabkNrRk1xWmpN?=
 =?utf-8?B?OElOblQ0VEhWMWhyei94YnlrcFgwSGx6WXhkVXZwSFQ3cEcxU2J2Vi9GN2xB?=
 =?utf-8?B?R01HSUIxYiswanE4a00xOU90NXZiN1dJbCt4K0c0a0l1R2hVRlNsMEV2WCtM?=
 =?utf-8?B?RmQ2OXIwazJLSTVseFRmZW5SZzlJeEhDSUpwaVBHVHJQR2RTdGlrUVl5ZXJx?=
 =?utf-8?B?UXJ5Rk5kK1pCT3ZiN00vazlyUW91c0lkdzY3NjI1dy8vMDlBRDMyL0RBN0Zm?=
 =?utf-8?B?eWMyMkFsaUp3ZFZvcG84ZVhVTmZSSUl5TU1Ub1RackJsQkNkYkRGc3pUQjFm?=
 =?utf-8?B?NmFvc0o3R2RySituUVZ6K2NlS3pVOUNzMU9ZQVJYYUxPUDdwbnBWQjFhQ3NU?=
 =?utf-8?B?eTlNN3c2NGJ5MlNqeWRDWFB5QmN5YXJJeTFtaTlEZDY5STZORHMzNm1LekxQ?=
 =?utf-8?B?YXJ3VUhGM0JHbjB4S2xRNWlYaDhObUlQanFhclAybEw4S1dncFFYa2RRWjMy?=
 =?utf-8?B?c2srbEtZeWlKUEVYWWtzSnp5NjBoSjlXWW9LaEkzNGErMkZxZ3VSL2kwM2V4?=
 =?utf-8?B?b0RjbFVHRzlyVEk2SHFKc1NkTGVwU0VHVElWMmhFWGJuUmppc2FLT2w3UnQ2?=
 =?utf-8?B?K1ZQeVJYTS9jQ1YxajBrbnBFWjFvOHFZdjBGOHhTVFZlNWdTQ2dYY3BvY0J0?=
 =?utf-8?B?aVBBNnpYUmdEdGU2MURycXpzYlBMc2l0dTV1YXRQTWJHU0Y1bEJYR3RFbW1K?=
 =?utf-8?B?WFF0a21XV0pOZGI3NG5xTVRpakdLaUpDUzlzbXlDWGQ0VExKeVdZekZ4cmNu?=
 =?utf-8?B?R0h6UGI1SmZNN1NTUXgxamRSQUZTMFA0UTBDUmtFZUZsNGZqc1F4ZFJWaFFG?=
 =?utf-8?B?RWFkSklRYk5ZZTFjR3FONVN3NVFaVFdJdEhPSnUrYWQrYVpWYWVmeThTYXl5?=
 =?utf-8?B?TzlJSU9IQkdHK1V6SnFSTThTOEVkNHQyODRsajRoUk1jQ1JnK2JHbk1PTEhp?=
 =?utf-8?B?ditTQnlkWlJXOTQ3ZExRc2dlNnd3YURReXE5WjV2eGNDd0MrR1V3VXpHQXUx?=
 =?utf-8?B?NjVMNUNXVVJNTURXaHZnWlhpeVc3VTBxY2xJeElCOG9qZ0FHOVhock5HbmhM?=
 =?utf-8?B?THJrL0U2Vm14MXdzYSt5QU5ybmxUSEVUUFVrekhIb1JYaVk5OXJrd2xhTHFD?=
 =?utf-8?B?Qi9RQzlyaFJWRm42SDRvZ0FOeEJMR2lZUDdOWWk3a1ZwY09heXlxVHo5em1n?=
 =?utf-8?B?YlhUNERXYWtZNmRlOXpTYXc1S04rTzRVMVAreFRaN2E3YWo3WHpRQWQrME5M?=
 =?utf-8?B?K1EzTE0vaEZ0Zk5nTGhGajZJZHhPT3FOQ2xDUllZc3ptdDVyVTlzZW9jK3Ra?=
 =?utf-8?B?TTFFOVNwaFVuMjZpZFZLaG5IaWJQNXBkYnBSMFR2OGFMdVg1d0dQOURiRlc0?=
 =?utf-8?B?c2g4T3VheEtCaWdnb2YveExoY25ScllXeHFrbnpKODVFK29VSmhhS254eldl?=
 =?utf-8?B?aWxvY1lwcjlqQWxvOXRzU3J2cERqZDh0bWp3OGRUK2ErQ0lnb1hnaVBMMFFZ?=
 =?utf-8?B?emgwL3U5aFczOUk4MURKc3lCUWhEUk1qR0FJM0JpZ2UzbGdHWnFJWHNqbnhN?=
 =?utf-8?B?akF6R253Qmxxa1lRS1p0OXVYR3NISERaOGlla0pDcEtNTklRazA0cjVBb0h1?=
 =?utf-8?B?UlI5aVFYNWZXMjRmUGhpUlFZSktaa2RvRjBuSHdKOVFRMWlSRVZYeWFUOEtV?=
 =?utf-8?B?SWZuanFmb1p2aHlKZHIrVHJkMjRoeE9NR0RadG94aUdLeG8yQjNNeXdXVWFP?=
 =?utf-8?B?MnpNNndWSlh4bHBHVmltVitKdm9IWEJ5RzIwWFZlRXFIMVVLYmJuZWVPMEhK?=
 =?utf-8?B?bCt3dnNqTVVsdEwyMEpYY1RUckg2b3Nhck9SWFo1UHo2aUphaFNBRnUyeTl0?=
 =?utf-8?Q?uT7Rgn3TmgipISqZx9nEw0Rdpf9NVo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REtsNVdmRW1MVTNsejY1NEpvam1Sd2pBQnM3dkFTRmEwMnpBQ2ZRUVppaW0y?=
 =?utf-8?B?ME8xZDJKMEt5UHhvZWtDZFFOM1JUakN1N1JZVG4zZ0lnSlEyK0FxWlFoUm5G?=
 =?utf-8?B?Sk9JQ0U4VnR0STBjcnF0Zkp6WnB0bCtUdXNnaG40Ly81MTZMaWFnYkx6cEhI?=
 =?utf-8?B?alo1ajYvaHpqYkNrdVhseGtHeHAxY0ovNGNxK1hrVUwzMjVCRmt5bHBQam4w?=
 =?utf-8?B?MjhubmsxbkhWUWlJVmd2MWs0bDF3SXAzQUJuNlVIdFBrSGxlNDl3MWp5TGxI?=
 =?utf-8?B?dTlGeHBSR2l5alk5WVJGdTlNS0tNNXFBdG9DRi9kMHF3OFhFeWVhOXpVUHlw?=
 =?utf-8?B?dGM4VHBLbUFSSlpBUUZoa05BNXVGYzFBVEc1YjhZb2x6RllldUdGSzYxU2hR?=
 =?utf-8?B?NzRCanF6QmptRU04OTA2N0I5Y0N6VEErWU00Q0p2a045QVBSY0xYRitrdE16?=
 =?utf-8?B?R1ltOUc2RlJxVnJEa0I3RVRPUEx5UEU4dTlSa0FORmc1RVhrQjFuT1hvNXBY?=
 =?utf-8?B?WHhvZ2pLT3BxTWs0SmxmRC9HSTdXMkpVR01ZTkp4Tm9zaXMzUFF1bk5VWWQz?=
 =?utf-8?B?T2lwZklVaWRCZUdmcXp0djBqdElGZFBSdnBMdkRISmtaY3htekg5K3NIY29t?=
 =?utf-8?B?YWdwblVDcU1FTkdBY20yNmVPS1RYVGU0V0prdDcraHVGaitZS1laQmZseElz?=
 =?utf-8?B?WEZRcHZ2a0tqV0tVTllpYVhNTlpPZTVJcDU1MW9NOUNMaGw5OHg2Q3BpYjlr?=
 =?utf-8?B?SmZMTHVJcGJiU3NYNGpiNlBMc3pjMWZPazE4NHQxTnBBWVpaRWVjSUJqRjJa?=
 =?utf-8?B?M1VlVFZGbDhZWXVtWkh0WE1ac0IyeHBYOWxCSXlPS2pVZUlveEVKL09PU3lP?=
 =?utf-8?B?dnJTVUZQcVpBVmFaZGMyVmc0bUxtSitsU2lhYVFialA0VDgzdGkzOUJkUzl6?=
 =?utf-8?B?Z1g5SVczQlhzUkFobTZWWjVqTnA3eklZMnI5bHpDUnhvRWJHdGY2aS9VKzJ3?=
 =?utf-8?B?MERTc1BBNHpydTBMaVM2WnlORGREQVpuVFpCd3Nsdy94ZlBtMGZ3RE1zeW1j?=
 =?utf-8?B?aHkrRUoyOURUQUtVZHpoN25EbU1Cc0h5UG1JMTRQSzkxb2RHaFJiWEl3ZjQz?=
 =?utf-8?B?NSsvaWhQSkVjaHNtNVN6WUlEdjFmak1xKzFJSkZHU2NQQVNJWnQ0UFozOXh6?=
 =?utf-8?B?WHhTN0VhYmpDRHc3Q0h4SnJKbnBMaTROWk9TSU1JanI5cmFUcWZvdUNaWEd6?=
 =?utf-8?B?emhTclk5VVJWK213TEdXZG1ITVQ2VnBtVzBNSDlHV2RwaHJlMW40VDRyM0xY?=
 =?utf-8?B?MDRzNklaUHN4d3RxcHJLOC9YaVBOVEp4U01YZUZrTG9kS25YZGhiUjVyMmg4?=
 =?utf-8?B?YkljT3c0RVZqWmdTS2dYNWQxcDR6bXlMcW5pRFJCcktvZEdtNGEvczJNUHU4?=
 =?utf-8?B?TG93VTFqYzJuVWU3QVR6ZnZiRXFONVduL2tVOFB0M29HcXFtNERmZFB6Mjkx?=
 =?utf-8?B?RFgzdUF5M0lPYjZzTzlOYUZWRm5WR0dUTTRpVmU1ZDdJeWRGd1F2WC9hQnpo?=
 =?utf-8?B?TFNWcWpwMHk2NzBxTkQyRlo4enhkRUlpRnJXdEpQVGJMUDFtbktlbytUMjRU?=
 =?utf-8?B?QjZhZ3dNdC9PSWJNUDlFemxMRmJEbnd6TUpuOHAvNTU4MGs0M3VBTVFQQndN?=
 =?utf-8?B?cGoramloTTBsdWZXeHNHSlRqMGlMUHppVCtIQlBjL1lpaGozS0hxWTdXbGNx?=
 =?utf-8?B?QmpHTmRTRWxNU0VzQ2RxNUJMbDFobGJ3b21lVE8yV2ZpdVprcHp2SFdvSk1L?=
 =?utf-8?B?cXpEU0RsR0RjdWkyci9iaWRyNVIrUmlrOWsxeWxGUTNjL1NmZFpzTzk0VzdZ?=
 =?utf-8?B?cEU4SEFKeWszSlVhdE9tamZkM3FaMmVOQXVBY0JkNHdRTllvbWprWGlwbUdY?=
 =?utf-8?B?SVhyM2lWWEM2S0Iybk84MlN4U1Y2YjFlZnlHVGVGbTV5dWphYlVheHA4U1JP?=
 =?utf-8?B?ZE1VVVNvbkk5RHFjZUFJNndVdG4vQWlqQndLYTc2U0E4ZXE3VnRMQXNIemhX?=
 =?utf-8?B?NUFld005cXhkMFl1TjNOU3hTVithRVpEVWIvcWx3UHZlWXZvaDE4UXI1NFZ6?=
 =?utf-8?B?VFUxaEgwaXpvR3RRRkpOaUNYSVpEb1o3Y1hzQ2NybTc3K1c2dmFDcVZQM1Mr?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ac9b14-dbef-41f7-faf2-08de17f3830d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:32:57.8444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCP8xo0y2T/yqsTCViimOxiTxm5O1MAyzpwKqqAsjzJ0xfzDX8PiNLJ98xaytZYyoq2Ic/swxm6idYhDj+9b97VbwGt2o36oUP/4IK75GO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
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

Contiguous PF GGTT VMAs can be scarce after creating VFs.
Increase the GuC buffer cache size to 8M for PF so that we can fit GuC
migration data (which currently maxes out at just under 4M) and use the
cache instead of allocating fresh BOs.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 46 ++++++-------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  3 ++
 drivers/gpu/drm/xe/xe_guc.c                   | 12 ++++-
 3 files changed, 28 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 30f0e51da49ae..a2db127982638 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -11,7 +11,7 @@
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_gt_sriov_printk.h"
-#include "xe_guc.h"
+#include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
 #include "xe_sriov_migration_data.h"
@@ -57,73 +57,55 @@ static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
 
 /* Return: number of state dwords saved or a negative error code on failure */
 static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
-				     void *buff, size_t size)
+				     void *dst, size_t size)
 {
 	const int ndwords = size / sizeof(u32);
-	struct xe_tile *tile = gt_to_tile(gt);
-	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_guc *guc = &gt->uc.guc;
-	struct xe_bo *bo;
+	CLASS(xe_guc_buf, buf)(&guc->buf, ndwords);
 	int ret;
 
 	xe_gt_assert(gt, size % sizeof(u32) == 0);
 	xe_gt_assert(gt, size == ndwords * sizeof(u32));
 
-	bo = xe_bo_create_pin_map_novm(xe, tile,
-				       ALIGN(size, PAGE_SIZE),
-				       ttm_bo_type_kernel,
-				       XE_BO_FLAG_SYSTEM |
-				       XE_BO_FLAG_GGTT |
-				       XE_BO_FLAG_GGTT_INVALIDATE, false);
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
+	if (!xe_guc_buf_is_valid(buf))
+		return -ENOBUFS;
+
+	memset(xe_guc_buf_cpu_ptr(buf), 0, size);
 
 	ret = guc_action_vf_save_restore(guc, vfid, GUC_PF_OPCODE_VF_SAVE,
-					 xe_bo_ggtt_addr(bo), ndwords);
+					 xe_guc_buf_flush(buf), ndwords);
 	if (!ret)
 		ret = -ENODATA;
 	else if (ret > ndwords)
 		ret = -EPROTO;
 	else if (ret > 0)
-		xe_map_memcpy_from(xe, buff, &bo->vmap, 0, ret * sizeof(u32));
+		memcpy(dst, xe_guc_buf_sync_read(buf), ret * sizeof(u32));
 
-	xe_bo_unpin_map_no_vm(bo);
 	return ret;
 }
 
 /* Return: number of state dwords restored or a negative error code on failure */
 static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
-					const void *buff, size_t size)
+					const void *src, size_t size)
 {
 	const int ndwords = size / sizeof(u32);
-	struct xe_tile *tile = gt_to_tile(gt);
-	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_guc *guc = &gt->uc.guc;
-	struct xe_bo *bo;
+	CLASS(xe_guc_buf_from_data, buf)(&guc->buf, src, size);
 	int ret;
 
 	xe_gt_assert(gt, size % sizeof(u32) == 0);
 	xe_gt_assert(gt, size == ndwords * sizeof(u32));
 
-	bo = xe_bo_create_pin_map_novm(xe, tile,
-				       ALIGN(size, PAGE_SIZE),
-				       ttm_bo_type_kernel,
-				       XE_BO_FLAG_SYSTEM |
-				       XE_BO_FLAG_GGTT |
-				       XE_BO_FLAG_GGTT_INVALIDATE, false);
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
-
-	xe_map_memcpy_to(xe, &bo->vmap, 0, buff, size);
+	if (!xe_guc_buf_is_valid(buf))
+		return -ENOBUFS;
 
 	ret = guc_action_vf_save_restore(guc, vfid, GUC_PF_OPCODE_VF_RESTORE,
-					 xe_bo_ggtt_addr(bo), ndwords);
+					 xe_guc_buf_flush(buf), ndwords);
 	if (!ret)
 		ret = -ENODATA;
 	else if (ret > ndwords)
 		ret = -EPROTO;
 
-	xe_bo_unpin_map_no_vm(bo);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index e2d41750f863c..4f2f2783339c3 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -11,6 +11,9 @@
 struct xe_gt;
 struct xe_sriov_migration_data;
 
+/* TODO: get this information by querying GuC in the future */
+#define XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE SZ_8M
+
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
 int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index ecc3e091b89e6..badae9a26220e 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -24,6 +24,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_gt_throttle.h"
+#include "xe_gt_sriov_pf_migration.h"
 #include "xe_guc_ads.h"
 #include "xe_guc_buf.h"
 #include "xe_guc_capture.h"
@@ -40,6 +41,7 @@
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf_migration.h"
 #include "xe_uc.h"
 #include "xe_uc_fw.h"
 #include "xe_wa.h"
@@ -821,6 +823,14 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
 	return 0;
 }
 
+static u32 guc_additional_cache_size(struct xe_device *xe)
+{
+	if (IS_SRIOV_PF(xe) && xe_sriov_pf_migration_supported(xe))
+		return XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE;
+	else
+		return 0; /* Fallback to default size */
+}
+
 /**
  * xe_guc_init_post_hwconfig - initialize GuC post hwconfig load
  * @guc: The GuC object
@@ -860,7 +870,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	ret = xe_guc_buf_cache_init(&guc->buf);
+	ret = xe_guc_buf_cache_init_with_size(&guc->buf, guc_additional_cache_size(guc_to_xe(guc)));
 	if (ret)
 		return ret;
 
-- 
2.50.1

