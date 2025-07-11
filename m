Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C16B02280
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 19:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC48510E3B3;
	Fri, 11 Jul 2025 17:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BDkiDnZ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF84D10E3B3;
 Fri, 11 Jul 2025 17:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752254550; x=1783790550;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=28aKzhSUIL+z1Phf7reE/AxP642whrmqIRLOjfVNPg0=;
 b=BDkiDnZ67cYXSgjTY9dxRFp+jSLuRBZXRqqF2NrJ4qHyaDcQq/nMn9HH
 UIc5ugvUb3pg8m86lAgX92WmUjiqAnRk+wZb3FwxpUMmcGVfXjeRY5Lr3
 6RKVxUB5fWKxOktFbnAh0xtgks7I2H5aCQj0dNfgw7OI7VN76Vqxzip3S
 Ns51wDWfT5ZAw19OtyP2Je5HP/xggG64mOnIEA0ewcUYAfdW3zFamHSgM
 Xyf4V1VtqkJnQvVlSKJTkbVEogJo/XnvTlZ6HNLLsk5/P82mwgtwbm7ea
 NFEsEGo5P+vfVUOm6+U8RlSGbaiBgSQ7n8ooY4IdM7W2UOtb4m0E5E5fo w==;
X-CSE-ConnectionGUID: mcXu2G7eRU2SiD9OqCYSQg==
X-CSE-MsgGUID: 9USLGHJJS+W+DfAOPYVJjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65908029"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="65908029"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 10:22:29 -0700
X-CSE-ConnectionGUID: 1lM6mmg8RdOlLheYWjxAbw==
X-CSE-MsgGUID: q4g82iEUTeWpm2hnRn9hWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="162098481"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 10:22:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 10:22:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 10:22:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.85) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 10:22:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtYO7lTEcVvl7+MSqWFWNlGWTSt7neHIyhNIkTJUw5Fgf/HLmIwQKeNORFJ6I6S8kMv/yFwFdo8w61lZX188IiTa8YJ+VeNuMTBVAIbKbd7j9t+z/qqFwGYwf7d/B9sQUBqLphY242hdee0lQNZdyXJAngHIuuJglqysv0rnFqTTmQvG8wVH4aQyrcgoii0OOBNyZBFjqghvCvawC6VUiGhUVYO7b79fqKmfOkZLUGjU8r6Dor+Rl5I1nYivn8DU0q3PRVlQsmUH6MgdTQa/rijrk+59hA+M29uVna6XbBugcbAeeuGmymkL82c7ZACU7Y6bq7UH9vL6JwGzdwUJTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOewA54cRzBvR3JMMtk8dyO3+r2MPcb+T32dZBT2+JY=;
 b=FkESVE7bFCR8SyelpErKT3buvDr6yERgIF0/P2pNQ/4iy5vDEPDpzqXqvZfeFb8/y3IENAfQeRoRO1L6sXLHSFGisbYeEW9u08URKXoyKc/kr2iu1lMO/r/iyWSZCxYz3grTEm7LgbfM/neBAaNOIwfO5oIeQWjxWlIKNS/J/mSo78e24v2XQJjZRyB+CcYDFlz4t5Db54U0zTXdwsuqE+oKUhBaG+uelHCwiOdQUn/RVugKVia48MtJUDLbDsSSbkScYhCzwOSaObC6+oXc8GT5PaJYRckyDYwd3Uy3happWeNgEPgy8I4muPFU9q3I0Dlk3NbmD/ocIHlXdrEmQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7203.namprd11.prod.outlook.com (2603:10b6:610:148::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Fri, 11 Jul
 2025 17:22:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 17:22:09 +0000
Date: Fri, 11 Jul 2025 10:23:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <phasta@kernel.org>, =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Danilo Krummrich <dakr@kernel.org>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>, David Airlie
 <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, <kernel-dev@igalia.com>,
 <dri-devel@lists.freedesktop.org>, <etnaviv@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/8] drm/sched: Allow drivers to skip the reset and
 keep on running
Message-ID: <aHFIph/XCWMSlFAV@lstrano-desk.jf.intel.com>
References: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
 <20250708-sched-skip-reset-v5-2-2612b601f01a@igalia.com>
 <20499b2a-0695-430a-9280-035a7e04d328@amd.com>
 <335c9bc57d19f17a3ba0da311f287dfdc3d580c7.camel@mailbox.org>
 <176e7f13-52e8-42d6-a9db-0bb237790aef@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <176e7f13-52e8-42d6-a9db-0bb237790aef@amd.com>
X-ClientProxiedBy: BL1P221CA0030.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7203:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b36584-0082-4a99-2cbb-08ddc09f77a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzZzdm12c1Z4dTA2eXc1TUlSS1IwcXR2L3lESWRGM1hkOWZleGh3N0N6bHJV?=
 =?utf-8?B?MTdmNko1Wm5hY3pyS2xLVHl6TjNyTG1iT1IvWllSOWJtR2U3eFh5S0NNNXlZ?=
 =?utf-8?B?MCtRUS9kLy9hVkQzSnVmZS9RMVNJYzk2S05BWDlFdHpSSm90bU1KSlJsT0hZ?=
 =?utf-8?B?cTF2N2hmaDZuajJQMHFIb3FHbk5QUE5pUnhJUTErS0wzbFlzdTN6NDNZY0VT?=
 =?utf-8?B?TTJnaFBjQXU3TVJhT29JUmlUWll5a3Q5WnhzdjBYSTJYVzlwZkYvQ0w2akU5?=
 =?utf-8?B?WVRkNzdKdm5LbEw3OGxhcVJ0d0tZbGlUQUdZVmhqQWZ3RWQzZHRmQnk1aVY4?=
 =?utf-8?B?S3Q0dFMxaTJrNXVCeXYvTjFOVTdtV2hjZDIwTXIrMGtjNjFoY0RCNU41SjBB?=
 =?utf-8?B?RXc3dm1jM2ZWTlZsL2dUMUtKVXdBcTNtMHgxQUtqcnJrTW9sM1NTOUxIbGFB?=
 =?utf-8?B?OXczY1pMTmxWTDlYSUpOaDExTmo0d3ZuTnQ0VXgyZ1RNQ2hmWGd2NXBGL2p2?=
 =?utf-8?B?cHNWNHJpaHQzbFFxWG00akMrUVBHV3NZVUJVRVVDanRwTU9lWVN3cFpJVzRQ?=
 =?utf-8?B?cGkxbzh4a0xpN2xpTzRMeC9HNnQ1Q3VPNU54U1hiSEw0SXZtdDd6dFNtVG5H?=
 =?utf-8?B?amVVNi9PSmFJOVZBWm55bmlDaXJ3MlNWaEZpSXd0a0NZL0w1OXVYUW5xQlhh?=
 =?utf-8?B?c1l3Z3krWWZ4a0k3cm9vQlJXRTNicDUyYldSOFdrcGs1YTBWeGxpaEI3aUY4?=
 =?utf-8?B?MklhRzR0ZThsTWZnZkR1Wmx1eWtzMU5KM1R5b1NxajlIVTFjRE1uL2RaM0t3?=
 =?utf-8?B?RG9Od3A5bk13czVOVDJSYVZwUkpWd0tybWdlYy9YcWJxTVJ6NURFaW5aL1JW?=
 =?utf-8?B?cDI1SXY1b3JQY29HNUEzRnlIU2wvVytWUzRaZkRzWGNDd0xOQ2pDYXB6UGo3?=
 =?utf-8?B?MkVBYmpOV0hreDRvdzROaGIyRUxFWi9ianVTYURDMCtnaFloLzU1TXZVN3Jo?=
 =?utf-8?B?NXE3MWVZMStoUFBiOVcrbHhpOERnL3BMUkZxcjlmdFZIR2g3YklpbmhGaHBa?=
 =?utf-8?B?aVNzWkxBbndQbkd3Ymc5Q2hTQk0rcHY2aDlhTG5lV2NrUWRTWHJzNmdKM3o2?=
 =?utf-8?B?bk1ZY2R0ZU82SzFHK1R4ems5WUg4UitSdllIR2RTWEpmeXNWQ0hyMDZwWWNj?=
 =?utf-8?B?MGhPVlBBZXJPNGw0RlpJUlloYVNuZ3EzUkk0SFd4NFZCUi9PY1lveWFUQ0pT?=
 =?utf-8?B?bWdxaXc0dDhVWk1CNjBHUlRhUllWTWRLVE16bjc2dkI2Z0hyN3NpV25FL2FS?=
 =?utf-8?B?REpXeUdHSlZVWlpHNWR6UVdza2daMENiblhIblNuQjZvdkhkeDNYZWlXY2tD?=
 =?utf-8?B?Z1lzeG54N2RuVUlmMUhGREErNFIwSS9xclRwWDVEVDE1UDZ0ZktBeHNDc3Vo?=
 =?utf-8?B?K2JRMWdJVEZCMHJoeVRQWEdkL3lTS2h1Y3JjS3dWVCswa1NFbGwzR2VKTEhx?=
 =?utf-8?B?NDRJNit4Zktyd2JkTzVIVVZFem5leE1KWWFBTE02L0sxVHk3T0hUMGVGTGZN?=
 =?utf-8?B?a0gxN3pNbkhKMnlaUUpUdG9kWE5yazVIYnZwT2R4K1FEQVpWVlVoaENYZmdj?=
 =?utf-8?B?Um96TUFza3cxZVRGNkJBMkt1SURHSlQvSVJkUkNjZWh4UFE1cFd1NmtuQXZt?=
 =?utf-8?B?RGxtL1BKQitrTFlGTGg1aFJ5R2RJZ3ZhS1Z4ckZsSjIrOWhROHB3elZKSXNi?=
 =?utf-8?B?NkpkS0VYMkIvUnM4YWZwMHM0aGFQOWJOSWJrV1JuUlhDM0V6Q1BxQ3ZBaHlX?=
 =?utf-8?B?WE1MVVIzOHVUc2JQTmlmdUhEVUUvUHNGaXNFajBBd01MRXJJTTRwVEVleFVL?=
 =?utf-8?B?R3huNFhmb2F6RzZnOWFwZXg3bmVOMEhFM1VPVmhUSVJON2JMdEpNVHFzSDBl?=
 =?utf-8?Q?3Hrs9lk5AuY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW80YmRvenJLUmlST2pXaGlsNXcrWU5CWVp6K0crVUdMRU5VSUhpZEpGMVd5?=
 =?utf-8?B?Yi9nRVpIdUI2ZWREVlRJN2xTNElWdEdSZUsxVUNCWnlka2c2emNNM3FwQWlQ?=
 =?utf-8?B?MVdrOW53T2ZuVzYvWEg0Zm9UNEt4UEFXL05DUzgxQ1ExS2dVdzBxZmlFOUIw?=
 =?utf-8?B?ZGpiVjhLbzdwdVRuT3gyVU5GbHQrL0pRVzVDWUk2SUoxcXlpSlJkdUpTekZy?=
 =?utf-8?B?b0x2UVhMWXBNWXpCUERHcXFoSmVId241ZGI2YWR3TGxTRzhwbjZ1WG93Mk5O?=
 =?utf-8?B?QkhZOEg4WGpueEtiV2JpQjdvQ0lQRkF5SjBHWFpzcnZZWXFkVCtRckY4aENp?=
 =?utf-8?B?VUpmL2pKeThEUXUyTGVXeVpnYjFXcXdpQ05rMGFkemx4YVVndU1xSGdtbHJi?=
 =?utf-8?B?RFd1VmphenVpU21Uc201ZDByL0lOamJrcTNSNEswNVdLZXRqVmFhSkYvTW9t?=
 =?utf-8?B?aTVYYTBBU0JNMk93Yk1NMkVKQTZRK1lnUDRHNzU5YThaWFhJMEJIL2FHUUVB?=
 =?utf-8?B?bi83THZlTDhpWERWNDVOdk9kTXZSZ1RLd3hNTk9aOHpQQ1JPWERrLy9mdU43?=
 =?utf-8?B?QVN3bU1RdGdBU3ZXcVk5RHZxUnBQVG5DNXRRc1laTVVCK1IxVWl2SVZpemZa?=
 =?utf-8?B?MG8wcmhQNTk0SkxNVXF6OUtHbi9UdlVINE1kTHBHY3hlZmtRRDY1S3ROdnlx?=
 =?utf-8?B?SWp3dnJqbDc4WktLUC9Mb0tmTEVocGUyVzQ1NGFwSEZLbjlVSGJiQlVMTlFh?=
 =?utf-8?B?RFBUazZwZGNUanlkeTZHOHF4K3RZYVI2VVdHTGFPelIvVHpJWFhlejVMU005?=
 =?utf-8?B?MHE3Z09iNXpHRVVvNjVEanJQekw4dVp2cGpuSHRuOTFnWXB1RCtUeXJRSkUr?=
 =?utf-8?B?RVpwYXRWd1d2a1NjUXJmSDMyN0Z2Q3BuWVhYRlhJUTdBU1pNVnZIRTkxei8w?=
 =?utf-8?B?UVEyREhoRmdrczdydXV6Rjg2RW1KT2RGUTYzSHdPNEovQ0hRNlZYS21RRUx2?=
 =?utf-8?B?MzEzSzBUTUxwdXFheVJ4U2FCaTF3anp0MDVDclMydVJ3MklNTkwzcG9vOXRD?=
 =?utf-8?B?c21zL29UdU9xcUdPeEpRY0hSaENHN2lsTUhtYmxhazZiYkovbVd4RFkrSTJx?=
 =?utf-8?B?WHZRY2xBY2JrUSttOEVJY2kwRkx6VmJlZytRWFI3Qm4xcklDcnR1ZHZDdzZw?=
 =?utf-8?B?QWF0VHoyd2hHTUxVTitwSnJ6cDlyS05rbDhGakRLa1RBSGl2ODU3REdFMisy?=
 =?utf-8?B?UXp5MWZUT3lyNW4xU3d5YkV4cW5LNWs1VGk3MUVXQkNIdHQzSHh0ejVBeVlY?=
 =?utf-8?B?Rlg3UTlPTjV5YjM1UXhCWHEzZ09aeWxtQi9jeUVCdGY0bE81eXoyb0cycGp6?=
 =?utf-8?B?MmpWVS94b2hrNlAxeXFLZnBSUTBZL0N3dGpJM0ZjaktCZ242UTRabzBLYVpP?=
 =?utf-8?B?bk9OQkV3K2F1SzU4WW5JQTFndTlBYTM2cU1DQVoyN1NIdVNiNDNZdU9KTGxy?=
 =?utf-8?B?TlJVbk00bXZrZTU5eDhuME5xNzJ5Q2JQUTRrclRpd1hOYUp0bkxNeWZrTEZm?=
 =?utf-8?B?SW5jRUp6bUgrUGwxdVhudy9iVGI5TStUNnZRd1BUaVhjazFtM2pYVzFoYitO?=
 =?utf-8?B?Q2J1d1JsdXpaaUlReE85UStMVjJpeUVSSUN0WFkvUGFyNUZkUVNXTFczNWp2?=
 =?utf-8?B?U1lQc3JRT2tqLy9PMUtseVN1L09sNDMxK2R6RHRyMkFTU1l5QlZBYUpOcnhQ?=
 =?utf-8?B?cmo2NXZ1UUxQUE1KTjBzTmJrUS9CUVNCT09WL2xMQW4rU1JqOGhxQ0p3d1ND?=
 =?utf-8?B?VitkZ2c2dFA4YlJXZjNKemg3eldVN3ZBTDNpUTNQRE82S2lZVEl4Z1diU0g0?=
 =?utf-8?B?NGQ1bHd2VXVaeWVLMFdSNThPUVNjbnk2aTU5bXM3cHE3ek5NcnVBc0hqbnc0?=
 =?utf-8?B?ZEFWZ3BZNUZ2Y0h6dERnK0JMT1NMK2dUbkFvUGZ4d1Y4VDI0NE9IcHZFcTBW?=
 =?utf-8?B?aTVwcUY4bmRoUTFmM1N3VkdlWm12NVp0bG1SRm9TNkgzY1BLMnE5R3FHNkR1?=
 =?utf-8?B?M1AwL2FMR1RJVFZDSzdJa0wyOHluS0tVamxuQXduemkyaW9ta1Jvb21zMnFP?=
 =?utf-8?B?dlRQTkU3TEVoaUhkMFdsRzlaVjRWZzIxelNxVGU4ZDhGMEVGZDR1dnRRczZ5?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b36584-0082-4a99-2cbb-08ddc09f77a4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 17:22:09.7904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUyU5qUlehExrfg/JO0slytzvLeSi3qzZAqKEtxeepk4njEIrXPiU7a8cbSvdJtQBCq6aioBPpy63wW8ATmdWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7203
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

On Fri, Jul 11, 2025 at 05:20:49PM +0200, Christian König wrote:
> On 11.07.25 15:37, Philipp Stanner wrote:
> > On Fri, 2025-07-11 at 15:22 +0200, Christian König wrote:
> >>
> >>
> >> On 08.07.25 15:25, Maíra Canal wrote:
> >>> When the DRM scheduler times out, it's possible that the GPU isn't hung;
> >>> instead, a job just took unusually long (longer than the timeout) but is
> >>> still running, and there is, thus, no reason to reset the hardware. This
> >>> can occur in two scenarios:
> >>>
> >>>   1. The job is taking longer than the timeout, but the driver determined
> >>>      through a GPU-specific mechanism that the hardware is still making
> >>>      progress. Hence, the driver would like the scheduler to skip the
> >>>      timeout and treat the job as still pending from then onward. This
> >>>      happens in v3d, Etnaviv, and Xe.
> >>>   2. Timeout has fired before the free-job worker. Consequently, the
> >>>      scheduler calls `sched->ops->timedout_job()` for a job that isn't
> >>>      timed out.
> >>>
> >>> These two scenarios are problematic because the job was removed from the
> >>> `sched->pending_list` before calling `sched->ops->timedout_job()`, which
> >>> means that when the job finishes, it won't be freed by the scheduler
> >>> though `sched->ops->free_job()` - leading to a memory leak.
> >>
> >> Yeah, that is unfortunately intentional.
> >>
> >>> To solve these problems, create a new `drm_gpu_sched_stat`, called
> >>> DRM_GPU_SCHED_STAT_NO_HANG, which allows a driver to skip the reset. The
> >>> new status will indicate that the job must be reinserted into
> >>> `sched->pending_list`, and the hardware / driver will still complete that
> >>> job.
> >>
> >> Well long story short we have already tried this and the whole approach doesn't work correctly in all cases. See the git history around how we used to destroy the jobs.
> >>
> >> The basic problem is that you can always race between timing out and Signaling/destroying the job. This is the long lasting job lifetime issue we already discussed more than once.
> > 
> > The scheduler destroys the job, through free_job().
> > I think we have agreed that for now the scheduler is the party
> > responsible for the job lifetime.
> 
> That's what I strongly disagree on. The job is just a state bag between the submission and scheduling state of a submission.
>

See below. free_job is called after the fence signals, and drivers have
now built assumptions around this, which would be hard to untangle.
Sure, the scheduler could have been designed to free the job immediately
after calling run_job(), but it wasn’t. Honestly, I kind of agree with
freeing the job immediately after running it—but that’s not the world we
live in, and we don’t have a time machine to fix it. I’d rather document
the current rules around job lifetime and look for ways to improve it.

Changing the job lifetime rules would require broad community buy-in,
which I doubt everyone would agree to.
 
> For the scheduler the control starts when it is pushed into the entity and ends when run_job is called.
> 
> The real representation of the submission is the scheduler fence and that object has a perfectly defined lifetime, state and error handling.
> 
> >>
> >> If you want to fix this I think the correct approach is to completely drop tracking jobs in the scheduler at all.
> > 
> > I don't see how this series introduces a problem?
> > 
> > The fact is that drivers are abusing the API by just firing jobs back
> > into the scheduler's job list. This series legalizes the abuse by
> > providing scheduler functionality for that.
> > 
> > IOW, the series improves the situation but does not add a *new*
> > problem. Even less so as driver's aren't forced to use the new status
> > code, but can continue having job completion race with timeout
> > handlers.
> 
> Maybe yes, but I'm really not sure about it.
> 
> Take a look at the git history or job destruction, we already had exactly that approach, removed it and said that leaking memory is at least better than an use after free issue.
> 
> >>
> >> Instead we should track the HW fences (or maybe the scheduler fences which point to the HW fence) the scheduler waits for.
> >>
> >> This HW fence is then given as a parameter to the driver when we run into a timeout.
> >>
> >> This has the clear advantage that dma_fence objects have a well defined livetime and necessary state transition. E.g. you can check at all times if the fence is signaled or not.
> > 
> > I'd say that centralizing job handling in the scheduler is a
> > prerequisite of what you suggest. You can't clean up anything while
> > certain drivers (sometimes without even locking!) just willy-nilly re-
> > add jobs to the pending_list.
> 
> The point is we should get completely rid of the pending list.
> 
> Then the whole question of removing or re-adding anything to the pending list doesn't appear in the first place.
> 
> The issue with that is that we need to change the timeout callback to take the fence and not the job. And that is a rather big change affecting all drivers using the scheduler.
> 

I agree with the idea that the pending list should generally be a list
of pending fences, but once you start considering the implications, I'm
not really sure it works—or at least, not easily.

Most drivers these days decouple the fence and the job (i.e., the fence
isn't embedded in the job), so there's no inherent way to go from a
fence → job. In Xe, the job’s fence can be one of a variety of different
fences, depending on the submission type. To handle fence timeouts, we
don’t necessarily need the job itself, but we do need the driver-side
software queue. In Xe, this would be the scheduler, given the 1:1
relationship—so we could likely make it work. For drivers without a 1:1
relationship, it's unclear how this would be resolved, though perhaps
the hardware queue would be sufficient in that case.

It also follows that the job would be freed immediately after run_job()
if we don’t maintain a pending list of jobs, right? That opens a huge
can of worms, especially considering how Xe depends on the job being
freed only after the fence signals. Our job reference counts tie into
power management, hold a reference to the software queue, which in turn
reference-counts the VM, etc. I suspect other drivers do similar things.
It seems far simpler to just keep the job around until its fence
signals.

TL;DR: This seems like quite a lot of trouble.

Matt

> Regards,
> Christian. 
> 
> > 
> > 
> > P.
> > 
> >>
> >> Regards,
> >> Christian.
> >>
> >>>  
> >>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> >>> ---
> >>>  drivers/gpu/drm/scheduler/sched_main.c | 46 ++++++++++++++++++++++++++++++++--
> >>>  include/drm/gpu_scheduler.h            |  3 +++
> >>>  2 files changed, 47 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> >>> index 0f32e2cb43d6af294408968a970990f9f5c47bee..657846d56dacd4f26fffc954fc3d025c1e6bfc9f 100644
> >>> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >>> @@ -374,11 +374,16 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
> >>>  {
> >>>  	struct drm_sched_job *job;
> >>>  
> >>> -	spin_lock(&sched->job_list_lock);
> >>>  	job = list_first_entry_or_null(&sched->pending_list,
> >>>  				       struct drm_sched_job, list);
> >>>  	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> >>>  		__drm_sched_run_free_queue(sched);
> >>> +}
> >>> +
> >>> +static void drm_sched_run_free_queue_unlocked(struct drm_gpu_scheduler *sched)
> >>> +{
> >>> +	spin_lock(&sched->job_list_lock);
> >>> +	drm_sched_run_free_queue(sched);
> >>>  	spin_unlock(&sched->job_list_lock);
> >>>  }
> >>>  
> >>> @@ -531,6 +536,32 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
> >>>  	spin_unlock(&sched->job_list_lock);
> >>>  }
> >>>  
> >>> +/**
> >>> + * drm_sched_job_reinsert_on_false_timeout - reinsert the job on a false timeout
> >>> + * @sched: scheduler instance
> >>> + * @job: job to be reinserted on the pending list
> >>> + *
> >>> + * In the case of a "false timeout" - when a timeout occurs but the GPU isn't
> >>> + * hung and is making progress, the scheduler must reinsert the job back into
> >>> + * @sched->pending_list. Otherwise, the job and its resources won't be freed
> >>> + * through the &struct drm_sched_backend_ops.free_job callback.
> >>> + *
> >>> + * This function must be used in "false timeout" cases only.
> >>> + */
> >>> +static void drm_sched_job_reinsert_on_false_timeout(struct drm_gpu_scheduler *sched,
> >>> +						    struct drm_sched_job *job)
> >>> +{
> >>> +	spin_lock(&sched->job_list_lock);
> >>> +	list_add(&job->list, &sched->pending_list);
> >>> +
> >>> +	/* After reinserting the job, the scheduler enqueues the free-job work
> >>> +	 * again if ready. Otherwise, a signaled job could be added to the
> >>> +	 * pending list, but never freed.
> >>> +	 */
> >>> +	drm_sched_run_free_queue(sched);
> >>> +	spin_unlock(&sched->job_list_lock);
> >>> +}
> >>> +
> >>>  static void drm_sched_job_timedout(struct work_struct *work)
> >>>  {
> >>>  	struct drm_gpu_scheduler *sched;
> >>> @@ -564,6 +595,9 @@ static void drm_sched_job_timedout(struct work_struct *work)
> >>>  			job->sched->ops->free_job(job);
> >>>  			sched->free_guilty = false;
> >>>  		}
> >>> +
> >>> +		if (status == DRM_GPU_SCHED_STAT_NO_HANG)
> >>> +			drm_sched_job_reinsert_on_false_timeout(sched, job);
> >>>  	} else {
> >>>  		spin_unlock(&sched->job_list_lock);
> >>>  	}
> >>> @@ -586,6 +620,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
> >>>   * This function is typically used for reset recovery (see the docu of
> >>>   * drm_sched_backend_ops.timedout_job() for details). Do not call it for
> >>>   * scheduler teardown, i.e., before calling drm_sched_fini().
> >>> + *
> >>> + * As it's only used for reset recovery, drivers must not call this function
> >>> + * in their &struct drm_sched_backend_ops.timedout_job callback when they
> >>> + * skip a reset using &enum drm_gpu_sched_stat.DRM_GPU_SCHED_STAT_NO_HANG.
> >>>   */
> >>>  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> >>>  {
> >>> @@ -671,6 +709,10 @@ EXPORT_SYMBOL(drm_sched_stop);
> >>>   * drm_sched_backend_ops.timedout_job() for details). Do not call it for
> >>>   * scheduler startup. The scheduler itself is fully operational after
> >>>   * drm_sched_init() succeeded.
> >>> + *
> >>> + * As it's only used for reset recovery, drivers must not call this function
> >>> + * in their &struct drm_sched_backend_ops.timedout_job callback when they
> >>> + * skip a reset using &enum drm_gpu_sched_stat.DRM_GPU_SCHED_STAT_NO_HANG.
> >>>   */
> >>>  void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
> >>>  {
> >>> @@ -1192,7 +1234,7 @@ static void drm_sched_free_job_work(struct work_struct *w)
> >>>  	if (job)
> >>>  		sched->ops->free_job(job);
> >>>  
> >>> -	drm_sched_run_free_queue(sched);
> >>> +	drm_sched_run_free_queue_unlocked(sched);
> >>>  	drm_sched_run_job_queue(sched);
> >>>  }
> >>>  
> >>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> >>> index 83e5c00d8dd9a83ab20547a93d6fc572de97616e..257d21d8d1d2c4f035d6d4882e159de59b263c76 100644
> >>> --- a/include/drm/gpu_scheduler.h
> >>> +++ b/include/drm/gpu_scheduler.h
> >>> @@ -393,11 +393,14 @@ struct drm_sched_job {
> >>>   * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
> >>>   * @DRM_GPU_SCHED_STAT_RESET: The GPU hung and successfully reset.
> >>>   * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available anymore.
> >>> + * @DRM_GPU_SCHED_STAT_NO_HANG: Contrary to scheduler's assumption, the GPU
> >>> + * did not hang and is still running.
> >>>   */
> >>>  enum drm_gpu_sched_stat {
> >>>  	DRM_GPU_SCHED_STAT_NONE,
> >>>  	DRM_GPU_SCHED_STAT_RESET,
> >>>  	DRM_GPU_SCHED_STAT_ENODEV,
> >>> +	DRM_GPU_SCHED_STAT_NO_HANG,
> >>>  };
> >>>  
> >>>  /**
> >>>
> >>
> > 
> 
