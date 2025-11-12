Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 543A7C5272B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C9A10E72A;
	Wed, 12 Nov 2025 13:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l4DuIoo2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F3E10E726;
 Wed, 12 Nov 2025 13:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953812; x=1794489812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=A0VbFBJ/ggqiwEiq6XfgQD64KootGSTYRHKIWud+Ea4=;
 b=l4DuIoo2T5XNrY4znHf6W969kXQ1b2iPSCIQNYrmOXG/QZvLaf0ZgKid
 Yknn3mrdmmb43xSc6Zx2mS0ZGq4nPD/jQI6JyjVSkjNo9tTVitqaizOFv
 y0nz9Nfikd6HiESGqck+4e0a3aLHAwchVIxh9E/nTTgKIsMn26J7riaQG
 124FRu+SApfGXxBqTbCmXKPRU0zLjIZrYD/dlJnPkNWw/pNpnQVE+ww0x
 V3uIAGXvgUWf0Tz5h+hvLjVyUzx39ERdmWVNTHbbSJhrdmMHw3NXc2sRI
 T+NtYRO5xT06KvnSkk8OsXem32/gyvuaaSBqKHZiRwMCDIWnYYIbf/eZf w==;
X-CSE-ConnectionGUID: KUMcdj5tTnupDHSqamw/qw==
X-CSE-MsgGUID: w+dh4pKOQCm3xz2CmcZRwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="82646438"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="82646438"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:32 -0800
X-CSE-ConnectionGUID: x+IroXZsTTOZwT9y1yql9Q==
X-CSE-MsgGUID: ouBk0nx9TuOPBPiN3oyrDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188475853"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:32 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:31 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:23:31 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1xNgnfMJ0EwTllh0q+RzeqReXY6D46sHPgvMK79+RNc7jrUXn5HQgYWkinDn+AZToiCn5DRsdPCqtCqbX9RkOQMLlPFZpLIFEl8xiuO7TlAIEU46x/tjaAulqDDvsjc07VmOFtdjqdSRbgaAYrmXj+pln3hYE1QjbErRqDb2rE086yCsTFAJNHAngtqjrIZAO9Lqr+uFWLyevDSAQNmgEHVN8HEJgsXt9FWbFAghlzYfHyzRm2WD8+2zlOhVpHGzXBkpAADN5M9aUaQbej5PEp+WwiCLEGDJ6/DOHPQXDF9PyA0FqicwvCCXLNwzrxHesdVaefSlyosra7H0wzQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuqicpi8r7Ssj7yjx7GWufZWA3RATNCkD5yIz6z7ABQ=;
 b=dcSciivbGfiYkIAYfYo8MoNEBfPCf/YEskw4YuPBenHdlEafb6rkXAUqto3w6YhVWryiAzyiekIvj+zkd26zLziBZwXXf/65Ycqdw/T/fYNQ5hOFtI1pyFHkVO521aLmSATcWfvRYefTnl+zfW7gzTgqPaGTATXiP15XOgdC7sUIvdSgCY3I5Db+H/2V2Oi4dA6z5ueHgcQEqLtCvtlWO4+2oiEdaC3aNd/mGN0dIOconlu90hTt/j/WVCc2zCnDcI0/MbHm1fkSLjYMclkbO8dt3NDcNxrQloM8fYiDSnL4CNo0JcDmNwleyhGXWLADBUCPJuo15i3XnNAqpyva4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB6929.namprd11.prod.outlook.com (2603:10b6:510:204::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Wed, 12 Nov 2025 13:23:28 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:23:28 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 09/24] drm/xe/pf: Expose VF migration data size over debugfs
Date: Wed, 12 Nov 2025 14:22:05 +0100
Message-ID: <20251112132220.516975-10-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: ddbc7dc0-231e-4e9e-adc1-08de21eeaa9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekR0RUh4anBrY3A5bVF0eldYT3VCK0hXNHVJM1JGRVpGTnd0a3QyK1NSK3lu?=
 =?utf-8?B?WEk4YllrL2pEK1ZqaEhQVldjQ1krUzN3cmRETmxnR1VSQ2pGbXdTVjYwL09q?=
 =?utf-8?B?VmIrd005VE0rUmh2S2NyNllnTUZFVk9rcnN4bU5jTFFIZSt0NGZuUUtka1pP?=
 =?utf-8?B?MENmMU0xR1cyY2R4aXEyQnh5QkNZdUJEckozZ3FlcThaczF0dDl3ZXFmRXN5?=
 =?utf-8?B?YzY4QXBxWExEenZ2MjNRYjR2aVhzNlBSQlM4UFZrWTUwekxqb3poY1E3SDFV?=
 =?utf-8?B?aVpwU2ZPclNLWkNZZVJZYmVROXFJenllckZBMjlBZjcrTk1Oa3VEbEtld3cr?=
 =?utf-8?B?RC9XM2hVbldOUTRWVmtvNHVwSncwc2pRSEtIY1J4MjZFemxhb0VYbGFOU0Ir?=
 =?utf-8?B?TndVK09qbDlvRTVSZjJZc0lzeUxrUG5tQnNmdDdlT09NaGJKemhNUkcwNjNt?=
 =?utf-8?B?dTR4Ny8rY2FTdUNFbTZuVUM4VStvOS9UcW5RVHBjb2k4WnlVb0dOK1B3OEly?=
 =?utf-8?B?bnc1Qzg0ZlRXZVp2Zi9VbXFBdFFwNTMxOE5ZZWlGTjBkRlBBMW9sMDM3K3pQ?=
 =?utf-8?B?NXJxQkgvOERHekM4WmJMcEp4ZTBleGR4T3VjWEtYbWpLcUlUa29RYnVZZ1dY?=
 =?utf-8?B?dU85QlhGMTFRN1N4bHRVZlk4dUVEV3Q4dVRJSzY2TnNpaUJrQVBLdC9PeHNQ?=
 =?utf-8?B?aEFWbjJVOWpOK0VrYWNnZTBwOGhPczYvWUlEeXZrZ1A3UjZsd3dPU2RabHdU?=
 =?utf-8?B?SFNaYTBlWlVaSjJsSEpZU2VLVVZUVUgvUlA4b3BqSUdUYkhGd28zVVNxeWpC?=
 =?utf-8?B?UEdZYVJmNTF6NzgvYXhTMGJOMklGTnk2VHF5WWYxMUZqcFlyUjZBWlB0d2ln?=
 =?utf-8?B?QlN0RlFjT1N4ZjhocC9VUE5IZitlb2h1djFQUlgzUFRTenpib25aWWE3dVVI?=
 =?utf-8?B?Unlad0l5c3E2a2ZEMTBOT3FWQ1FHdjlhTXZ5bThKTEYvRHU2VktrS1BHZmt5?=
 =?utf-8?B?U3ZoU0M3cU9DNkFMcFhsWFFJbUpTVE9ZMXVOMjFCaGR1Uk5DNTEyeUFvdFln?=
 =?utf-8?B?bG1LMDhCOGczSDZGQ0hFbG4rcnZ4RGlXekZzVmVzUG8vS2xHdEFLUWJYdTJ1?=
 =?utf-8?B?Tyt6bkpTTHozbkZncW5KRDBWNS9yL0IyU1hHbldUQUdyR24zclhrYVBDSkQ3?=
 =?utf-8?B?RktqSnZnajZ0TEhXUkhGckZIVmxBMU5vYlhxZkxaYjBvd0RQSzJmRDBVR1Ni?=
 =?utf-8?B?OUh4WTE2cHAzNnRBbkdtYk9jNXZ2T25zcVlzclF0QWhZVWs1K2lpaW9kUWNP?=
 =?utf-8?B?Ykx2Z2lNU0hJdGVhTkM5NUptR2xIVDNhV0RmdFFXMWo4cGlod0RDWmNTUVA1?=
 =?utf-8?B?eTN1Q2FMVUlldlNKL2xuVCthejRYUlBBeVh5eFptM1BNNVpBMm0yZDZUQUtB?=
 =?utf-8?B?bXR2MS9mb2RYbUltZWF6aGFEamh4aVp0NHp1RVY4UTJSU2k1cEc5U2EvbmU5?=
 =?utf-8?B?L3RCTjc0UnBQc0VZb1FpdjVMazF5enBZYjlUTlpweStMN21KZTAweGo3bEdV?=
 =?utf-8?B?a01aVlVTU2R5V1pnemQza1NYZ2ZFczVpVHh4QWpxdno1cjlsMmxieHdxUVZ3?=
 =?utf-8?B?Wnd0UU1BbmFKRzBLaTczVzNPaGVrUjhpVTRmTVhvb3VNVERlU2RRdk90Y1N2?=
 =?utf-8?B?VVdvcnRmanE2bE5HZ2IzTHdmS1Y1M2N0WTQvUFVQM1R2dnFsbmFFa3BGYXN2?=
 =?utf-8?B?VXZ4dDN5MHZzb2oybzlKcnorbFBiYVNDM3huS0RwaGRGM2VYemJQa1IyakR0?=
 =?utf-8?B?UkpTR0MvLzNaNkdackNmc0s0RHhVUE94VVpuVE9XSjZRdnNDMVprVk1pVDBi?=
 =?utf-8?B?N1QvRnJnalJwL25mdldkcXRzTTBQdUR4Tk83RmgwaGRjSVgxcXorYU1nYi9p?=
 =?utf-8?Q?Ph1S77/1AWaO7TG1THr5GvTRpxZ417Pg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2RVazNrcWJLRUhrWHB6SjBPTTJyNnRzVUdsOCtyMGpiTVZnbXN6cjQvcE4x?=
 =?utf-8?B?a0VUckowTWRMRjdSclNPUXNydGZWbWc0Y0FHNWxIZnZ5QzRzUjdZa1UwcXQ3?=
 =?utf-8?B?Tm9zWjA1aTliOWZrbE9VRnJLS2RMNlR4ZTZrWmNFKzNSMWJGVG9FRUhYa2po?=
 =?utf-8?B?Kzk0SkkwSjBGS0pTZkZYNzJxUVdkSjBlS2svK0hraXN4bUtMNHpZckJyc0JO?=
 =?utf-8?B?cFhsNXZ5WU9nNlZwdTh6S2RqSjNDMW5TUzBFejIxRkNkUlhSdU9VRXFGLzRq?=
 =?utf-8?B?L1BYUi9IdUJxSHdySE8vOXpsM0N4NjF3VUIvRWRvd0RKS2hNKzVTclRTQ1RM?=
 =?utf-8?B?L1gvWkE3NDlBN2hlUmU4WjZOeGF4OCtTMDNDSjI5TVEyd0dTa0s3eG1WdWts?=
 =?utf-8?B?L1J0ektOYXFuU0lmR1FMNE9GTVpNV3BRamo4MWVVRit6ZFZMQnhGaTNEVU9H?=
 =?utf-8?B?MzJwajFla3J1MUhWbXFIVGJhdFVsVmN2TEgzbi9PSkl0RVQ4eDBwQUc3cm83?=
 =?utf-8?B?bjZJRGVpdFRtZlB6K016Y0xDd05uVGZyUmxVdmVrcU5YZTRNam5OOUx5RVE4?=
 =?utf-8?B?NVdTdW1nejJaSXh6ZU45NFArNDl4d2RnKy9xd1Uwd1dTLzNTc01uWnZER2dx?=
 =?utf-8?B?R0wrUE9vaU5TZlR5cmxhekcvQWNvZ0tzbHc2enBJMFVKMnJXa3dDaFZVeWtU?=
 =?utf-8?B?SkpQdmc1cnBmbU1jRStqTWpSeXI0U01qTG15V0lqTzBha3ZCbHI4YXRxS05o?=
 =?utf-8?B?c0RicmxScGd1RnB3MFFncUx5d1F0endLVzBUK0RZaDRXYlcvWW5aTVl2WXB1?=
 =?utf-8?B?eWZ3aExyVnYycWUxb1VjRi9LUjZwbnV6VGNic0RMcWp4MHlBZndPMDc5MXZn?=
 =?utf-8?B?azF3T08zVU5sckhoSXF2dDBDeHlyV0FMaDBKRE4zRlVDM0paYm0rMWk2SVl3?=
 =?utf-8?B?eVR1Rm1xS2lOa0c2Nk1wVGd2TlhhSU11QyszNmtaaXMwY0pTb0lIalhlckh0?=
 =?utf-8?B?OXNWS05wZE1qOHd6WGhMeExNK1ZEaGI1bEY1Nnp1aW9HbmdlSkN1RWMxMnB3?=
 =?utf-8?B?ODgwc3B3cXpOWVA1VnBXVndDODFlbkZEUHM4dGJCVDAwcFpGRXdJOHFha3Bh?=
 =?utf-8?B?YkhiTkd5TXYwUUdZWVd5WEZEdXRBL2NQSVgyRlh3WFZXazU1bmxqeFBUdzg1?=
 =?utf-8?B?TDNybE91dFZhVDlMaDJDSlZEcUI1WUFaN2FIOEdSUTFJMjZmVVdmK0NtZy9y?=
 =?utf-8?B?L2oyaHZFR2xxbVdNeVl0YmdKRHhRcStPTHZCMFZqSXBHT3hRTlMvT09BTzJH?=
 =?utf-8?B?NnUwYmJJbDgwVXU3NUhmM2RFUkpVcVpudjA4ZjhBMzFyNlkzUTBIaVBvTnF2?=
 =?utf-8?B?ZUdQNTVCb0JwVW1acXgvVUxieWdhNWRNU1ZiN2U2cFlwK2Z0eU1rR2dKS05o?=
 =?utf-8?B?Njk2VmJ5NWFndlZVcFRPaW5pUWhVY3dCWHBmQzhhbFZXa1ZjMmFBelp5bEFq?=
 =?utf-8?B?aFcrZFBmUlBSZVE2QTY3azFLZXZuM3pOc1pqZ2tLZkc0dXEvUFdhMHNJQ3Ux?=
 =?utf-8?B?R2V5WEdKZWNmd3V5ckRXem1ESXY4bGdBY29md3RWb2lodnN5NjJGL09pemFi?=
 =?utf-8?B?azJsQjg4SDdPRG1MYmlZcEc2aFhUMEpzQ2xnYWZrSTE0WFMyL05GOXM5MDZr?=
 =?utf-8?B?UFdzbk12MHJnbi9Tc1phZlpEUlozcVMycldSOVlraEVIdVNuMGl5cE44cm5T?=
 =?utf-8?B?T3dlV09hRmR0SzdyTXAxNHRUUlRNZWpvQUJ4SUlCUnhiZFh5U2VlekdQYTB3?=
 =?utf-8?B?VUVzZk82MVNhNFlDUndQVHNYWVU0dU4yUmphdURoaHc5OEJZTWlPSC96dUFN?=
 =?utf-8?B?U0hYQk9Bd05ZSDdCY0doYjI4aGVtZUVTV0libkZNVFJhUFRnSHkzQnlYUllk?=
 =?utf-8?B?bHRQaEpGTlExM0QvK2JNVVptRUgwbXFqSElzbSt0MkJKVEhqR0xlcUd3QXZ6?=
 =?utf-8?B?NkNsemJkU1l2VFJLSmFabFJtTEZZK0ZoK0plcGdvSU1FWVVvc1dUamVuQVNt?=
 =?utf-8?B?dVY5MlMybkUxUGxUQ29zbmcwdE4zaTdEYVlEdGtOMWFmQnhpVGNiZE5NNm1v?=
 =?utf-8?B?R0JpUXVmREpXcXpDMFpEanBBalV3K0N5SHJPYXp1TW8wN3pUQTdmeEcvWlA5?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddbc7dc0-231e-4e9e-adc1-08de21eeaa9f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:23:28.3596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMcygsr5ZipOyMGEUtJiA8A2R2YZ2EEcVJr24JCOeQTXy5+ZGFMENbBpX7H89BqnMuaMKrXBgeas1WVLmmxbavFZhylqjVN9S8J7EX9+DtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6929
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

The size is normally used to make a decision on when to stop the device
(mainly when it's in a pre_copy state).

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 21 +++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  2 ++
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 28 +++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 30 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  1 +
 5 files changed, 82 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 4e49022810ea5..0ffe64ee469fe 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -396,6 +396,27 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 }
 #endif /* CONFIG_DEBUG_FS */
 
+/**
+ * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: total migration data size in bytes or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
+{
+	ssize_t total = 0;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	/* Nothing to query yet - will be updated once per-GT migration data types are added */
+	return total;
+}
+
 /**
  * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index b4c7b5dc9e914..3ad3c3609b415 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -15,6 +15,8 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
 int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
 
+ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
+
 bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
 bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
 void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid);
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index 4ca86ff4b7dae..00fe73bd86dfe 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -254,6 +254,33 @@ static const struct file_operations data_vf_fops = {
 	.llseek		= default_llseek,
 };
 
+static ssize_t size_read(struct file *file, char __user *ubuf, size_t count, loff_t *ppos)
+{
+	struct dentry *dent = file_dentry(file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+	char buf[21];
+	ssize_t ret;
+	int len;
+
+	xe_pm_runtime_get(xe);
+	ret = xe_sriov_pf_migration_size(xe, vfid);
+	xe_pm_runtime_put(xe);
+	if (ret < 0)
+		return ret;
+
+	len = scnprintf(buf, sizeof(buf), "%zd\n", ret);
+
+	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
+}
+
+static const struct file_operations size_vf_fops = {
+	.owner		= THIS_MODULE,
+	.open		= simple_open,
+	.read		= size_read,
+	.llseek		= default_llseek,
+};
+
 static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 {
 	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
@@ -263,6 +290,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
 	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
 	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
+	debugfs_create_file("migration_size", 0400, vfdent, xe, &size_vf_fops);
 }
 
 static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index bbaf0caed0572..21b06ce6830a4 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -310,3 +310,33 @@ ssize_t xe_sriov_pf_migration_write(struct xe_device *xe, unsigned int vfid,
 
 	return produced;
 }
+
+/**
+ * xe_sriov_pf_migration_size() - Total size of migration data from all components within a device
+ * @xe: the &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: total migration data size in bytes or a negative error code on failure.
+ */
+ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid)
+{
+	size_t size = 0;
+	struct xe_gt *gt;
+	ssize_t ret;
+	u8 gt_id;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid);
+
+	for_each_gt(gt, xe, gt_id) {
+		ret = xe_gt_sriov_pf_migration_size(gt, vfid);
+		if (ret < 0)
+			return ret;
+
+		size += ret;
+	}
+
+	return size;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
index dbf8094900df8..b806298a0bb62 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
@@ -18,6 +18,7 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
 					  struct xe_sriov_packet *data);
 struct xe_sriov_packet *
 xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid);
+ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid);
 wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
 
 ssize_t xe_sriov_pf_migration_read(struct xe_device *xe, unsigned int vfid,
-- 
2.51.2

