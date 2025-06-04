Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6692AACE6C9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 00:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF57610E93F;
	Wed,  4 Jun 2025 22:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXlSsN8i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C40C10E89C;
 Wed,  4 Jun 2025 22:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749077188; x=1780613188;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P9h9eaP+boa20ehXlIG7vMhrQNq3+LgIVIiyzN3bnt8=;
 b=EXlSsN8ibDklGv2nrGwO19T/s9lo9fLB0LhDiOsQzjXyGbjrR48VPprD
 wqYwirRhRqRo9Mg/uDAYUOoT2zKbAZYPZbuWSTlKM+zReXILrvo2/DiEf
 7vH60Ytk3k7bHJ7KLKj86viarFOZLDWtxW2T4QUXG5zVKiSkPMZRMI5VV
 b4DNzn4RTRTsfXoBX5zEb8oh2f1pmZvLSiCKArrnGOuruiQLZ82nq/FCF
 Y1I9NMhJEssX7xTkEof0Z2uv6m8/P8BJ6Y5/bYA1ZkR9LRUVMZOWRNsWm
 5QKAY0oTLg0gll19Z9rOlWZE/VZ7zndqZau3H9d9cGNU38PAg7MZibx1s g==;
X-CSE-ConnectionGUID: GZzfMfyBThW6BCHpQq/D+g==
X-CSE-MsgGUID: wbKcfvo3Sd+1olLYLvngtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50294774"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="50294774"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 15:46:27 -0700
X-CSE-ConnectionGUID: zH/3HMDdSfm2giZ8onDfcA==
X-CSE-MsgGUID: a4S2TN/6Tw2XFve+6kkHmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="150197957"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 15:46:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 15:46:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 15:46:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.63) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 15:46:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2qKsyYwoJvtdZSGjvn+AhWN9llxp2hfSEfym6peBatzSzKkiiL8IIgcfqsNPdXvy1H4qsabnga7M5ZI/GgGbnfuyVYIIyq4IGkfIDIER6hwr4Mtn1lQqu0hVS0Q9TfCMqarDMc698O+mh8UQIqnFVJFKCJV8GR/gJp9nwfikijO+3NwdVvmlMaiwWh65gfqztwbPn4X+rDFmsCS2eHzPopphscxdWPAAGSKJc/W+S/pQogv3In6vRrmDH9OadbaWJSqxbK3YeQD3sKHwj78MDJouWEMvH2b1f8/rJMKNu9upxKXqcOCfESCmc7n1Ouw85pfw7UUNanOkh51KgA+2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/MudfHu3eR10s/clfEhPQvllUNYSj2WurhTjWCc7Vo=;
 b=Dv55Ef4p5BquRDyVeCHqQoKfsxlENBvA/EH3g2tINc7vl24scH0EhFH8vKRIgfrqnYVD/i6ck1gyLQL5uIvaGL43x+gdaAOQzUpooHPwpJt7RWjb7ObVfCBrAimK56MkBJ7rqRd5p8693qG4InNaT3pFiTYmpN3le1iOif0CThhvPPPhzUadTOuRFcTaLBMAkhJj863eCiM/GWwXTyrteMj2dQlVd+YgOLfMGmeCFaTPNQyKTr9XnGrhwO4VK5ccEN8n7mstGepIJxBsBE8k7IxCy5a9hYjfiHchHjFck0NZRoYwpfUYpFrsivxLGDpjXwZMfXCoZhaW6uxDd0+wzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by PH7PR11MB5887.namprd11.prod.outlook.com (2603:10b6:510:136::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 22:46:03 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%6]) with mapi id 15.20.8813.020; Wed, 4 Jun 2025
 22:46:03 +0000
Message-ID: <18e168a1-8c9e-4cee-9d26-b8969d3072fd@intel.com>
Date: Wed, 4 Jun 2025 15:46:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/bl: Use kasprintf for interface name
To: Timur Tabi <ttabi@nvidia.com>, "christophe.jaillet@wanadoo.fr"
 <christophe.jaillet@wanadoo.fr>, "philip.li@intel.com" <philip.li@intel.com>, 
 "simona@ffwll.ch" <simona@ffwll.ch>, "lyude@redhat.com" <lyude@redhat.com>,
 "pierre.morrow@free.fr" <pierre.morrow@free.fr>, "airlied@gmail.com"
 <airlied@gmail.com>, "dakr@kernel.org" <dakr@kernel.org>, Ben Skeggs
 <bskeggs@nvidia.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250604-jk-nouveua-drm-bl-snprintf-fix-v1-1-79b1593ad664@intel.com>
 <704b69a6af32e0d89a6d88051c12f29fdadfa638.camel@nvidia.com>
 <24f7d99d-3249-4fcf-a9e4-af610cc9436b@intel.com>
 <751f786a3ceee08eff698633c39bb3a6b4b2f6d1.camel@nvidia.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <751f786a3ceee08eff698633c39bb3a6b4b2f6d1.camel@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:303:8f::7) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|PH7PR11MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d892f5-0f1e-48f1-ed22-08dda3b99597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGZuSzN2TzQ3QW9TM1Zta3N6dVhVSXRic0RRSVpSZ2tYSzdlNXcxTjYvd09p?=
 =?utf-8?B?Lzd6M3M1K3hhUHhPZy8zQ0o0enV5L1hzS2FrTGpnQ2Yrb0NER1EvTnF1ZlJ0?=
 =?utf-8?B?bG9lTi9lZzZBQ2RFOTlOT1hyL0pxVHRtSm4xaFBESURvV3VCOWJuaFNVRWdK?=
 =?utf-8?B?MlJEYytPZEJXeTRsZXczbStzTlZLTW1YcWNSbGVWcFBZeWZqTHY4MXRnOTVx?=
 =?utf-8?B?dm9wRmI2cm93YllybGtRYmtuMUFtMnBuVkkwQmlQTUY3Y3V5emR4UWp2YzhU?=
 =?utf-8?B?QnVvbENod0JDb24vZi9wekVLT2RDUzA0RS9YYkk3Q0E1OUdtdWIzRUZhbitE?=
 =?utf-8?B?UWN2dU5welpTeGh1TWtHZFBleVIxOFJoVFFBOVpGcHp2L2xBT1lsc3hlVjI5?=
 =?utf-8?B?aUl2UWx3VXkzVmxiUERwQlA2VDZNcGxDNVVhVlVWbmROL2hDTm5ESHNHUlN6?=
 =?utf-8?B?SzVneGpQSncyN1liQmJzRUhCV3M2VHF0MEpLYXFwbE1BSFZ6NkFFZXJ5M05V?=
 =?utf-8?B?T3Y0VlovSzVNSENpSmJPZFJZQzJWcnQrVUhWcDZOcGFYWU93Qm53dTExRlBx?=
 =?utf-8?B?ZEw2THV0eVpQQ0lLVGQ5Mjl5WHYwWE9KVGlHR1l6YlIxeCtNbG9HekQxUFBm?=
 =?utf-8?B?aVVSd3MxeEowZm9XekEyZ29YMlkweHhwVThCUU9SZUoybCtTUzQ4b1hTT2JV?=
 =?utf-8?B?cnNoTVVuS1orY2lWY2piSmhVR1BuYXluYnBBS1pzWndvVUZhYzN4QXFuM3d2?=
 =?utf-8?B?bmJTdjBrR1Njc3k3enZINjNOSzc4Vnh4K0lCdk1Gc1FwN29uTUZzc1VnK2FV?=
 =?utf-8?B?OU5XRDFENk8rWXVHTmJOMHUwZDZ6VmVQcDRBVGQ4bTQ1OWZ6Y2twUVhwUk1C?=
 =?utf-8?B?UTlyeVRzaHl4ZzNLVWpWSENwSngwVFZ4a0tZcm0yK3F4K1VNczZBUGQwckh4?=
 =?utf-8?B?TUhaOU9kNTdHYWk5a21XNFBRWTZTOHJPeGtEZlYxTkRmQ1hxbnRab1c4S1o1?=
 =?utf-8?B?VlNzMHNFVUJZcUhvRlhqc1M1QUg0MnIzL3hzUmttMGR2UGdrT3BJRlZHUmVK?=
 =?utf-8?B?a1paVDBSdHZnWDRKeVVpdk1DK1U3RmRRdW5PckgrbXFkN3ZSMjB1UmIxbDB3?=
 =?utf-8?B?V0xHcWZRVWpwVWVuTUlUWVJZR3BnYkEycVFMYTVGSXhYOGFlWnI5bndnOWt0?=
 =?utf-8?B?bzJvLzJ1WE1OUGJmQkVkR0t0eEJRb1hGYW5VMDJwL1B6ZzkzdTNPZ0tuRzdh?=
 =?utf-8?B?UFJTRFVTb1h6MDIrREdmTnF0SDFPTU1lc0xzd2RSNUdMaXJGQ0Nab2ZhN2w0?=
 =?utf-8?B?Y0xHZ0hTWE15bmc5VHFIRnRySUpVTTRnYmdXOTNXK3BRRzl5QWRQZDh2Sy9x?=
 =?utf-8?B?MmVEdWE4UC9rbE4xaVI1RjdJaEtucjBqZHRpcWovdnMyaGhpWW9GUlo3ZTly?=
 =?utf-8?B?MXJHZUVDTmdpMXo2cVg2b3hZYnpvUDE5S2JBZ25iQkd6UHBqb2VqeS9LY0w3?=
 =?utf-8?B?YTZhNk1jaUtUSURmdW1FMEdBcUFzL1loNHZKdWthWUtyWnRnWCs2ZTJhc3U5?=
 =?utf-8?B?VTUxTGtITWZEMzNTTS9RM1d2MDd0SE9SRFU4dXl4cVpERkNicmJ4R3pNVUJt?=
 =?utf-8?B?b3IzVU9WaEFKa0pad1psWVdwaHd3Zlo3RnJNeXFRMVhuQ0ZnM25yMHB5MmEw?=
 =?utf-8?B?T1J1ODh1ZXU2NDh3MXRoekVLblNHUmQvZ0V1Q3JLVkp5NUEzclZzSzlYTjZx?=
 =?utf-8?B?U1FVR0tXUW11d2lhSjhTOXRoaWlyblQ5SldUODVZK1hsY01WZ2tDbmlaZitJ?=
 =?utf-8?B?NElWYXcybGFqd1JKU3NMQ1hBRThsa2xuUXJldzNLMjNpTnhPa2paSUViTU55?=
 =?utf-8?B?M1FuUUt4M1c3OUVLZ2t5WHpCNVVhbGxUN2M1T3JNNFFJclJGVU5FNm9PSkZl?=
 =?utf-8?B?UVB5RDNzVnJBb1ZsMUdFb3pob0hNOXo3NlFTeGZBYmVmMW5ka0E4YW11a056?=
 =?utf-8?B?dU9TNzI5SmFRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(41080700001); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDZMS3RUSlM2UmVuSnVlQnhMRnNmK0ttSlFhVVk4RWg2MUVrWkw2S2hsdUh4?=
 =?utf-8?B?VWVaQlBybFIrRG5rdnFJZGpVY0dFdVJ3Y0wwNXY5TmsvSGZHekoxYzJCWkp3?=
 =?utf-8?B?anlHREdQWTJQc0hnREhvcGxwWnFHY25vRkF0NERmNXF1NTVRVURFYnNneGNL?=
 =?utf-8?B?TTFHNTNlZ2JPTEU3b1p4TXhLSzczclJhbm5kOGZHd01DRzZTS3NHYmZCVUtG?=
 =?utf-8?B?emp1Z0R5UnN1Yk9IaHZjK2tEUWQ5bGZLV2Exb1RXTlhyU0ZYU1JJRGU4emd0?=
 =?utf-8?B?L3UwL0NaeFdvSzhCVVd2VzhqclYvMnFqcm9HcGVVdzk0K3pGNVpXUUNyaWEw?=
 =?utf-8?B?L2VsWUY0bEdkbnVlQnFMSlVWR0xWM0xpVjdDOWtCVjRSZTRBOTUxUlRzNmFi?=
 =?utf-8?B?aHdINDFSMHBSMkdqRTBXNCtZdVhPenJVd2l4bnNoY041UDJXYkJjSkhiTnVu?=
 =?utf-8?B?K0N0OUI1MlhYZUoxOWd0VU1obitDRm9NWmIyZGZFalF5S05xb3Q5dVVnK2Zj?=
 =?utf-8?B?TmQ3Wi9PUnpYQzNFblFoSVdOdmxZSEtqR0kyWUFvN01xOTZmRVBXRmRVeXpS?=
 =?utf-8?B?Q0FHZWdwMEFoSmhyYU1tejEvSnJzUUdmTDM5NEZFY2krMjhlMkl1eWdVZW1S?=
 =?utf-8?B?NlMwSks2eWxvZ0UxRGQ0M0JGSDlWdWJCUUwzSDIvTWhOQWIxb2F5Ny9wQzc5?=
 =?utf-8?B?RVowN1VjbmFnYVVuaE1uUkJVckIzYnBNSkNwWG0zVGFtTzhyNHlMdXl5aVVJ?=
 =?utf-8?B?dmFkaS9sRWVGK1J1cExjNnhmYmwwaDlFVkxLdFRMU2NyYVdVUWQzUU9LamxW?=
 =?utf-8?B?YzhjUHVrOFNJbUVxdzd3MkdaUjh3VTVWQWl3T1IyMTNDUE5OL1B2K25wS2k3?=
 =?utf-8?B?Y3R4TDE1blJDRmNtVjRlUVU2UGx4V21mU1pkL0FWaGY5M3E3V2ZJY2E0SmdK?=
 =?utf-8?B?WkZLQTVnSDBPcVR6SnptSVE0cnZza1VPY0NiRm1wVHJqMmVNUnQ4UFdmcDJF?=
 =?utf-8?B?ZGg5cVo1ZE94WWZEWE5yQ3FQVng1aCt1N0V1ZjVobTdvcWEwMFBRS0Z4aVJi?=
 =?utf-8?B?cGxFdGNyRjhXMkgrQzkzS25vR0JVTThwdHpVZFVWWEpLaUNwZEd2d0kvT1Qr?=
 =?utf-8?B?S1ptaTF2VlZHUnpVVW5BNDl5Y1BYcTQzcDl5SW5zN2tCS1ZBZXMwbDRhc3I5?=
 =?utf-8?B?Z2kreDJTYmJWazlnQmlCSndkWkdzWUppRnVBZkp1M3AzT3U1eW5ValBqT2lz?=
 =?utf-8?B?bnl5cFVYZUwvMzJHZUhUMGtpUjN2cnNxN1VvbmVNR01iRkdCVUZLbjNGY25R?=
 =?utf-8?B?NTlyd2tzQllzYndKSm1zTkh1bm5jN0FqYjBNcFg2aFZuZjNHMllNT21leWx1?=
 =?utf-8?B?bnJ6V3gzTUN5QVZGUnFWeUp5dk53cmZJNGtidm04V0FmVmlJdnY1bHhmWGRl?=
 =?utf-8?B?N000ZHpkYkRjV1RnWE9NWnBsa0JScVJnZXlVYS9HbEJheFJReE4ydkFsT3g2?=
 =?utf-8?B?UU5wb0w0aGRnMnJRSDNhRlNZTnV2QmQ1QUY0dGRxN3hnaGlPYm1xZGlVNTJy?=
 =?utf-8?B?UVpPb1k1VjB1UkY4clRsU1hNSFBlNmNHbEt1Y0g0UTUzNHJ0MnpUQy9Zc3JS?=
 =?utf-8?B?Y1Z6NXFFbno1TEJuNDB6WHc0Zi9nV1VvR3BER0Zxcm9kRG4wd0ZJL1p5NS9F?=
 =?utf-8?B?WlRhUVIvbHRjaHdZUGdJZ21iZ2w0RE1rd2JkOGZjc1RPQ09IZXRoR1pFa1BZ?=
 =?utf-8?B?Y3ZHK1ZtT0NSc0hTQVBFSTZiR0VSbWI4UE1OZGk0MVhtb21EZXdrdGl0RnlI?=
 =?utf-8?B?ZkRJWEkyTjhqTXF1bzFPb1c0NTN6endiS3p6Vno5cmNMdTkzM29oeW95WVpp?=
 =?utf-8?B?Tm9FS2JUYWYrTjB1eHNOY1YxTlZ2VFlyaFpKMC9HaWk2cXBGV2k5RzlELzVv?=
 =?utf-8?B?Si9uREdWMkdmNnRqSUtBdHdENDZFQ3Z6N0FndVE1MVVFT3Fja2pxTmlmTC9Z?=
 =?utf-8?B?Ym0xUzRSd0FUTVVjTWpZa3orUjBZM3o5UytYcnBFWG1oNGpUNGduanBsdXcy?=
 =?utf-8?B?RDYxa01kY0JXTFlnU1dZR3hKZEdNdVM5aHVDTFdYUGwvTWZRWnpYK1JGZExi?=
 =?utf-8?B?dEZjSEV6RGErWnNaZDJlRmZCZ0g1YWdxU1k1OUFSSVV0Mk11R3FxYmdSWE5C?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d892f5-0f1e-48f1-ed22-08dda3b99597
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 22:46:03.2443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c9jYwDokdPFvwpj3DIRVl+0gVgdIB6u6DpJ885K3DPxy6o2EEX7bEY9NSSCqZwRuGX5znPRaUv4XYpVLH7SGo/oDFVFerz9gZHHOt+c3XDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5887
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



On 6/4/2025 3:40 PM, Timur Tabi wrote:
> On Wed, 2025-06-04 at 15:16 -0700, Jacob Keller wrote:
>> Fair enough. Another alternative which saves the stack and macro would
>> be to add a new version of backlight_register_device which can pass the
>> integer number itself into dev_set_name, but thats probably not worth
>> the churn either. (Currently we snprintf into a buffer and then again
>> copy that again into the device name...)
> 
> If you really wanted to avoid stack space, you could add backlist_name[24] to 'struct
> nouveau_backlight'.  
> 

I'm not too worried about it. I'll wait a bit for anyone else to comment
and then send a v2 with blacklist_name set to 24 bytes.

Thanks,
Jake
