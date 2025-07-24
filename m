Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB0FB0FF76
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 06:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBEF10E874;
	Thu, 24 Jul 2025 04:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9n09Ydm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6437610E874
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 04:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753330328; x=1784866328;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pOahn1AcRkKlVGeDXk95Ab6DPWWMkG1wNeq/YL+QPdE=;
 b=a9n09Ydm8dHtVNSostHjSglcs1blk5D4RKRBv8mW7VnXZsHxOlvMMghb
 PE4V7o6UAP0UrpyboG3hjXGkObvQC9ZBLejiYyLcInKb7kQB1wzT2Pla7
 HCXitHRJ8SrelvHcoh5Vj9YhacZ6t6Vr8OWFYWDeOXRprI/SPe+gyaDpK
 KA6afnDutv+t6Dfo29ZNftAxofmqX3tFc9VyrbrLR+0e4Q55VyURasU1l
 XEqKUVAahUWV1gT5nxaGVcHjI01aFFf5zDlR3kE7RC7z+w7EZ8xgBLMPv
 wfPNXNvJYlaYxQRvnrnll7UDJ/FU/DPVQHzkvEeboZol53tC3tIxlvuwE g==;
X-CSE-ConnectionGUID: q/zgDJpeQAqQZ/0PwuRvWw==
X-CSE-MsgGUID: 8Mv0vBy/S2eOhwrYoUmI6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55475822"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="55475822"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 21:11:51 -0700
X-CSE-ConnectionGUID: 6N4SxY78QwCCuBNaVDYr6g==
X-CSE-MsgGUID: jj6mktQSSEuB1/qB6Fi/bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="190884411"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 21:11:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 21:11:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 21:11:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 21:11:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMOLjTxeTibjOQ7zCaUlUc2Vu2TeDk7Jj126b11gBDHLI5FCRYOITpXGRUqhAbW/oOx+gplDKkHNfWWxXH1Xc3QAZCojwvKeoS3kFTGhRXivk/io5mr/wX6dbhTiBoqOoOjORiZl6j5aZOQ5u5B1gy4bbsellzkUrACFQy0y5f1qf8OWQwLb870zeY6Y0c/VG2bFdgbraFsDk/qLua4gK5D0hlJ21uh81hE+V1WDGj6s/3Orm3xrf3Wc1WmMeE7W4ALNgiungkaC23E9TDxX3Ih5lkAbc8NTBta7n68L4NIbDm8k2JXXhR01poAFMwpPSBOUAbwV4M0R+uGu4/zJsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcwJkwoARz2OX6qMEIwfmuYzS3giFNhwNs8lKWalhTc=;
 b=bKth+T4KkfZMCAWdWWwdznqKkAPTe/6TK93O1l72vUX9C6t7XDn6B5MkwQJU70zPRyHzmENhTtQWTe3aYDDe/4RsZtpm/wsIVWr1SzYrZ310lyRgUfeCgnPt8FrQyYkMkrY2NnL3uYoyzst2b0O9X+CkvjFt/uso6jc6mfrjCDkEbsyaAJAtKAYxfOGXLmW3ubU3gDPNcIcbYqDgoEtiWuSuK94y+BQdieiBIbopUWKyycoFYKS8wMOTWvJwlkl6XmWfb7ebSs4wF8Me6aqmkZjdpCTLGgqL7qI8Tb+B/Vy86I20PnUdHhXh43RuGkfxzWUTHX5oXsACby7aAqbJoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7340.namprd11.prod.outlook.com (2603:10b6:930:84::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 04:11:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 04:11:46 +0000
Date: Wed, 23 Jul 2025 21:13:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <phasta@kernel.org>
CC: Danilo Krummrich <dakr@kernel.org>, James Flowers
 <bold.zone2373@fastmail.com>, <ckoenig.leichtzumerken@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <skhan@linuxfoundation.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH] drm/sched: Prevent stopped entities from being added to
 the run queue.
Message-ID: <aIGy7uRuvYA0v8TO@lstrano-desk.jf.intel.com>
References: <20250720235748.2798-1-bold.zone2373@fastmail.com>
 <66a14b005fa3dc874f4f3261b93901af1292bde9.camel@mailbox.org>
 <e7c0f63678a93261182b69aa526217821552a150.camel@mailbox.org>
 <DBHNK2XQHUIW.TQHV41LR5D8I@kernel.org>
 <aH6B7JruWCkReaLw@lstrano-desk.jf.intel.com>
 <80f569dd3c42f11927324ea80e7c14ac2d3352b5.camel@mailbox.org>
 <aH9GwaquE7OR0HFY@lstrano-desk.jf.intel.com>
 <aH9Pj+eIuIgNiL69@lstrano-desk.jf.intel.com>
 <3b4ef4687af55b2332fd128ff3f3f810f5681df0.camel@mailbox.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b4ef4687af55b2332fd128ff3f3f810f5681df0.camel@mailbox.org>
X-ClientProxiedBy: MW4P222CA0022.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 82238d21-03a5-48c7-326b-08ddca6834b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3YrYU1IdHZGZ1JxZDBjbUlOa0thMzYva3pkcmlPRWttWDQ4NzFDakJBd0ov?=
 =?utf-8?B?N0xsdi9WazZPdVl4MEFjSkdNQ2w0ZFhuNk9EMngydFp3SnRPdDVkRUZma1VL?=
 =?utf-8?B?QjA0T3pkRlFlTWcvVng2akJOS0FuZGluS2w4dUJIZXFoT0lQS0pWUzhFSUIy?=
 =?utf-8?B?NzF2K05pbHhWYWthNTVkK2loUnZGVkRaK0FIR2gzOTBDcDBZR3JJSUl3KzY0?=
 =?utf-8?B?OUhNQWVKMkRGTlZJS3ZMNTRjRGJIVm1ONEZVdzdxUkNITy9xOHFSRFBRUkFX?=
 =?utf-8?B?clV2UEwvUmx5Wk9uQ0tDcGQ3UU4rMGNKbGQyb3h2TG52MXR4MjlMWmtpTGxX?=
 =?utf-8?B?cnJQTlZWTDRMUm0zb2JDYTZFVUtvcHdkS1RuempSc0pXMC9HUDZ5QU4rUHE2?=
 =?utf-8?B?MW5odHRjSWxIMEphdnRtNzlOQnl6UWRXTVJNVW5BQW9EREFtdElxajNVdW9u?=
 =?utf-8?B?Y0Y1Y2NqS244NXBjOXhsczZrZVA2UDNSNWcrK2tOSHMzTUNZd0NIUHpXNVVj?=
 =?utf-8?B?dm5oOHhGM2hNdjE2bDdodXVEb3F1TkNKWTRlK1BtM0tFM2RLdEZPYmFBSFVE?=
 =?utf-8?B?S1FqZUhMeUtxNHYwR3UxdG1VVEROUVJZbkxEQ1Zxc1lYTjZLbUt4V3hLV0x6?=
 =?utf-8?B?SnJnaUJpUEh2UFJPR2JnMy9GcW8wTk1RV3JxZWhRSWdRbWYzVmMyODViKzZG?=
 =?utf-8?B?eHovMHZEMUpIV0JCVEwrbnFqRHZWTHFobzlsblU3U2M3VHF3cU5rZ2YvT2lT?=
 =?utf-8?B?NVBNNlgxcHcwT0RHdGNYbUJHNFhVTjN3cEoxalJQS0h0anBVY0ZlanN5WUk1?=
 =?utf-8?B?cnNMbFNiVThBRFhDUTRwakowaW5JNEVDNDRKc1M0YVBNRHA0eDhkcTN4cXAy?=
 =?utf-8?B?eVpoZWNMUFljcFY2OWhBdW10WDc3dVl0aGVWaVZ3QnNaM0FpQkFUMGlIQUtM?=
 =?utf-8?B?RExyUVhqaTM5VWVtcno2NlBJMzFTZXg0eDVxZGtycUl6QisyeVF1NFZaREZj?=
 =?utf-8?B?YWIxM3IzelJYYUg3WTh5N2ZKa1N1YU85ZFBNUmxGay9qQ3VEOWhzVGhIWVpk?=
 =?utf-8?B?TDBXWUxraXI1aUlwNG9qVi9DZllJQnNSUHBsQmROUzNSUUJrcElvM1NxRm8v?=
 =?utf-8?B?TnFPS1JYWG10d3lNNUUrL29aN29aaFJsc25yckF3cXQxNUFTUkJtZ0tSM3BY?=
 =?utf-8?B?MCt3Q0F5bEZEZlc2TzgwbUh1azlZem5SVm5GbDZ4eGhKQ0RjUkhsT3N2NXU5?=
 =?utf-8?B?RnJYWW41ZTJzN0dqN2tnc1p2NDRVbXZOdkhQZlBOWGNzQTJYK2FrU0pmbmdF?=
 =?utf-8?B?T0t4N0hLRmFkZHVBbUpHZUs2dUJzTDkwU2VzTEgveEYzWnFlQlp0WmJzdjZV?=
 =?utf-8?B?dFpNdG92V3dVSkJNYjdVUWIwc2dUbE9mTFB0bnRKTXVnQTBvRXpaZTBRdTVN?=
 =?utf-8?B?VEJlaVFoRitLd2UvaVlONWRsN0crSWo2THpaTEN6a2ViQ3Q3N0xrQ2JVci85?=
 =?utf-8?B?bTRZaGxYb1g0U0tXZWN1a2dWdUZGZ2NMTzVtWTFXQnA1bG9jT2Rqb2VmR0xx?=
 =?utf-8?B?RmR6TVVJbzZTaUxyMStJUUVaVVpqNUtBV1V0YXhxaUdHdXNlQWo2cG9ZYjMw?=
 =?utf-8?B?QTNmdGw4ODk0ZGp5eEhmTUhVV0JIRm43MnA1WFVnNW44SXBRSk9Id0hDOWRR?=
 =?utf-8?B?RzdCNis3NCtockk1NGJFRVR0dkJ3cFh6L1JBakJMRmxDMUNuR0VISUNJZllG?=
 =?utf-8?B?NSs2U2xqRHRONU83WVVOWWU1RHZSSDFJL0tvTEJzTGxacUxOZ3dKSGhIOUMr?=
 =?utf-8?B?UTRNdGIrZUZNcmhSQTRTWW1IdDNLTGhxdU1Pc0FrWWsvVmhwRmJWenAwbk45?=
 =?utf-8?B?OElNY1NOdWg1aHlsMlBxYmxBb3BqNmtsNHhpV0ZZM21xVE9ra00ydlJRR0pN?=
 =?utf-8?Q?fHSLkAeRmm8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEhUeWZTRGpLbkc0ZUhiNktrQ291T0RqT1BSZGZ0M0NON1NTSGxkcHU5S3Vx?=
 =?utf-8?B?Q3VEQThUeEtWdG9TMlBHOUZnWlo2Y1RnUXZGYnVQOVF5Wnk1dERCbURZck9P?=
 =?utf-8?B?NzdtN09HNThuczRrT1RDTHZoM0V2Z28wY2JmK01oVFN0c00wZGtndHcxTUg1?=
 =?utf-8?B?TmFmSG1jUXpveEtBWExXOVg0WWtyV3drd2tZTXFZQldxRkMvejBONzdJZmpT?=
 =?utf-8?B?RmM3MDVwUDFCZjZCQnpWckM2dFc0RWdYa0J1b0NuMTBOb2pPQkZtSm4vcWlJ?=
 =?utf-8?B?TDlXWnAvSlh4Z2lXMHJIZnJHWFI4Q2FEM3JFWlFkR2I3RldnTUpIWjZmMHdQ?=
 =?utf-8?B?ZHhrZndpb0tGWExDdHNpN2RmWlNHT1VuUno4Y29YVlFVa25JOGRrRGsvRUlX?=
 =?utf-8?B?Rzk3aHBOczhRU05aSmEvVG9ZclIzeFlzOWtjNmNmL0lEeEJsakh0V0p5S2pP?=
 =?utf-8?B?SGZMWS8wRG96UHpycFBOck1WYTR5TmtQVGRJeElPT2dtTE5ZR1N5c25RT1Zr?=
 =?utf-8?B?UjFjYjgzVm1nbEZzOTM4d3lmK2lBK2NGV1oyRVhLREtuTkNYMytUTjluUnhx?=
 =?utf-8?B?bmFBRXFaV2JzZ3Znd284UmlTY25scVRnNDNkUUkvWjdvN3ZVV1hqT0h1amFn?=
 =?utf-8?B?akhRMFpWMkZaVnNuL285Mis5Q2JoRnlJcW9PdUt6Z0JHU3huZXpIOCs1Zi92?=
 =?utf-8?B?bFp6RjJlcVV5bFp0dkJSN2RFSWFZakRmeU01VzVWbnFOREp6UEwzRjlVSFd4?=
 =?utf-8?B?eDZGUm4rZ2xNM21BZ3BmdWovdEtvNEdDU1pFSEY3M0t0WDU4aW55U0I5Zk82?=
 =?utf-8?B?T0VRRzlDa2I5ZWVQa1c1TTZpMjJ1bU5wa2JjWlFNQ0tlbmNTNWNySHVPZjZw?=
 =?utf-8?B?cUZwMTg1MW1oZ3hpM2ttOHNnMk0zMWxOUlN3dExuWG1pL2tpWUVGdnRvMlV3?=
 =?utf-8?B?Y3FQLzcrWFJ6ckc5Ry81N0xhQ0hnN29vTDQvcGxCejc3b3NkbWI0dnVpd3BS?=
 =?utf-8?B?QmVaN3NXL2Nwenp2MjdNQktSS1l1Nm5Ia1NSbGsybDhKTDVvZHhUaS9GeG8v?=
 =?utf-8?B?dHlEUXpjMW9mdlVuN3J0b1BkekJUdVZldldYeGJ6ZVZJMEhrRWJDMTR6b0Ix?=
 =?utf-8?B?ci91ZG1NdnV2a2JyT0gxcWpOYml2UXU2eWhOYkk3SHFHZ09IYTg4MTVubHZo?=
 =?utf-8?B?ZWNCcHFDekdMd0JEUHNxZGtNVURKVGRrTHNFZ205aWh5bjhvd2xGVDRRV1I5?=
 =?utf-8?B?MzJsMXN4cE82RURyQ1FaMzU5WE1iNmhQVVNUTzRSc05oaG8zc1JUQU5UVjds?=
 =?utf-8?B?SWQ4Q1FGdyt4VjR1REJLTFk2R2JLVHR0WC9UdEpmUXUxdVQyQUhpVm5OYys5?=
 =?utf-8?B?VnE3UnQwNGwxZ3FHbVBWNitBeitBdFFkMnFKUG5LMTViWFR1Yk9aalVTODNO?=
 =?utf-8?B?R0FhbXNodDZJU0laTnFyVGJpMEYvUjBjdVdub25Id1gvZjRMaUkxbjlBNUpa?=
 =?utf-8?B?cWpjbjlIYjNLZys4LzR2bGQ0TkUwMWVzVkRPaWZNQ1o3cUdWeFQrUnNoaDBj?=
 =?utf-8?B?UHEvREtpbUtzM2tCaGJySTBLVU5sWmFneHlKWWNBcEYxK2NJYzNFeVgvOVBl?=
 =?utf-8?B?UXcra280OTdrRGVNZW5rNzlmdUgvYlh6NmVJU3RjWnA5bmhsa01wQk80Tzhu?=
 =?utf-8?B?RmYxNUxndW10VDVGK2NZVE1rcVhOdHQyMGV1V3F3OGRQbW9jVjUwSU1lTEhx?=
 =?utf-8?B?ZVo1K3VwanM1TndXU1RmL1VQeXVkdWUraGRtVXlqTnVDRUdIR2pzcnB3d01l?=
 =?utf-8?B?dU9ENFhaTUw1bTMzWXVZa0FVQjVrYWxaZ01jbUQ0NTJGaStIS2hGM3dKdEJR?=
 =?utf-8?B?b1VEM1NZa2ZTMlJLRFJjWEpzMDM3ZjlONUpvd2owU3JEZG1QYmJvOVpWV1lK?=
 =?utf-8?B?aW5WYVdNZ2Z2Z00wdWNvTWlxUnNZdGRJY1ZGNGY4VHI4b3Q2c2JYV3lNWnFv?=
 =?utf-8?B?TmlrWjYzY1FJSFRUZE1ZTnZtOFI5TDBqY09EYy9xVThpdzJtY1FlY2RMRkEz?=
 =?utf-8?B?R3p6MWpYSVFSYjZOcmZzdkg5Nzl2UzNwVUV6VGo4ak9qVTNOT0ZIaTFGVHNn?=
 =?utf-8?B?ZGFYeHdqZzY3S2MyNTJnc1NoUWtvdGZ0Z1dSWmpXaU9uazIvelJCb2tURlB6?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82238d21-03a5-48c7-326b-08ddca6834b1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 04:11:46.8558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7gG8s9C66Ldg+BUe0s69RJY16AFtSjoMdLmXb1IByod/0qVqG+p0luxyWLv7Mww5C87niYGYEtd4pYfaviyPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7340
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

On Wed, Jul 23, 2025 at 08:56:01AM +0200, Philipp Stanner wrote:
> On Tue, 2025-07-22 at 01:45 -0700, Matthew Brost wrote:
> > On Tue, Jul 22, 2025 at 01:07:29AM -0700, Matthew Brost wrote:
> > > On Tue, Jul 22, 2025 at 09:37:11AM +0200, Philipp Stanner wrote:
> > > > On Mon, 2025-07-21 at 11:07 -0700, Matthew Brost wrote:
> > > > > On Mon, Jul 21, 2025 at 12:14:31PM +0200, Danilo Krummrich wrote:
> > > > > > On Mon Jul 21, 2025 at 10:16 AM CEST, Philipp Stanner wrote:
> > > > > > > On Mon, 2025-07-21 at 09:52 +0200, Philipp Stanner wrote:
> > > > > > > > On Sun, 2025-07-20 at 16:56 -0700, James Flowers wrote:
> > > > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > index bfea608a7106..997a2cc1a635 100644
> > > > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > @@ -172,8 +172,10 @@ void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
> > > > > > > > >  
> > > > > > > > >  	entity->oldest_job_waiting = ts;
> > > > > > > > >  
> > > > > > > > > -	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> > > > > > > > > -		      drm_sched_entity_compare_before);
> > > > > > > > > +	if (!entity->stopped) {
> > > > > > > > > +		rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> > > > > > > > > +			      drm_sched_entity_compare_before);
> > > > > > > > > +	}
> > > > > > > > 
> > > > > > > > If this is a race, then this patch here is broken, too, because you're
> > > > > > > > checking the 'stopped' boolean as the callers of that function do, too
> > > > > > > > – just later. :O
> > > > > > > > 
> > > > > > > > Could still race, just less likely.
> > > > > > > > 
> > > > > > > > The proper way to fix it would then be to address the issue where the
> > > > > > > > locking is supposed to happen. Let's look at, for example,
> > > > > > > > drm_sched_entity_push_job():
> > > > > > > > 
> > > > > > > > 
> > > > > > > > void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> > > > > > > > {
> > > > > > > > 	(Bla bla bla)
> > > > > > > > 
> > > > > > > >  	…………
> > > > > > > > 
> > > > > > > > 	/* first job wakes up scheduler */
> > > > > > > > 	if (first) {
> > > > > > > > 		struct drm_gpu_scheduler *sched;
> > > > > > > > 		struct drm_sched_rq *rq;
> > > > > > > > 
> > > > > > > > 		/* Add the entity to the run queue */
> > > > > > > > 		spin_lock(&entity->lock);
> > > > > > > > 		if (entity->stopped) {                  <---- Aha!
> > > > > > > > 			spin_unlock(&entity->lock);
> > > > > > > > 
> > > > > > > > 			DRM_ERROR("Trying to push to a killed entity\n");
> > > > > > > > 			return;
> > > > > > > > 		}
> > > > > > > > 
> > > > > > > > 		rq = entity->rq;
> > > > > > > > 		sched = rq->sched;
> > > > > > > > 
> > > > > > > > 		spin_lock(&rq->lock);
> > > > > > > > 		drm_sched_rq_add_entity(rq, entity);
> > > > > > > > 
> > > > > > > > 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> > > > > > > > 			drm_sched_rq_update_fifo_locked(entity, rq, submit_ts); <---- bumm!
> > > > > > > > 
> > > > > > > > 		spin_unlock(&rq->lock);
> > > > > > > > 		spin_unlock(&entity->lock);
> > > > > > > > 
> > > > > > > > But the locks are still being hold. So that "shouldn't be happening"(tm).
> > > > > > > > 
> > > > > > > > Interesting. AFAICS only drm_sched_entity_kill() and drm_sched_fini()
> > > > > > > > stop entities. The former holds appropriate locks, but drm_sched_fini()
> > > > > > > > doesn't. So that looks like a hot candidate to me. Opinions?
> > > > > > > > 
> > > > > > > > On the other hand, aren't drivers prohibited from calling
> > > > > > > > drm_sched_entity_push_job() after calling drm_sched_fini()? If the
> > > > > > > > fuzzer does that, then it's not the scheduler's fault.
> > > > > > 
> > > > > > Exactly, this is the first question to ask.
> > > > > > 
> > > > > > And I think it's even more restrictive:
> > > > > > 
> > > > > > In drm_sched_fini()
> > > > > > 
> > > > > > 	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> > > > > > 		struct drm_sched_rq *rq = sched->sched_rq[i];
> > > > > > 
> > > > > > 		spin_lock(&rq->lock);
> > > > > > 		list_for_each_entry(s_entity, &rq->entities, list)
> > > > > > 			/*
> > > > > > 			 * Prevents reinsertion and marks job_queue as idle,
> > > > > > 			 * it will be removed from the rq in drm_sched_entity_fini()
> > > > > > 			 * eventually
> > > > > > 			 */
> > > > > > 			s_entity->stopped = true;
> > > > > > 		spin_unlock(&rq->lock);
> > > > > > 		kfree(sched->sched_rq[i]);
> > > > > > 	}
> > > > > > 
> > > > > > In drm_sched_entity_kill()
> > > > > > 
> > > > > > 	static void drm_sched_entity_kill(struct drm_sched_entity *entity)
> > > > > > 	{
> > > > > > 		struct drm_sched_job *job;
> > > > > > 		struct dma_fence *prev;
> > > > > > 
> > > > > > 		if (!entity->rq)
> > > > > > 			return;
> > > > > > 
> > > > > > 		spin_lock(&entity->lock);
> > > > > > 		entity->stopped = true;
> > > > > > 		drm_sched_rq_remove_entity(entity->rq, entity);
> > > > > > 		spin_unlock(&entity->lock);
> > > > > > 
> > > > > > 		[...]
> > > > > > 	}
> > > > > > 
> > > > > > If this runs concurrently, this is a UAF as well.
> > > > > > 
> > > > > > Personally, I have always been working with the assupmtion that entites have to
> > > > > > be torn down *before* the scheduler, but those lifetimes are not documented
> > > > > > properly.
> > > > > 
> > > > > Yes, this is my assumption too. I would even take it further: an entity
> > > > > shouldn't be torn down until all jobs associated with it are freed as
> > > > > well. I think this would solve a lot of issues I've seen on the list
> > > > > related to UAF, teardown, etc.
> > > > 
> > > > That's kind of impossible with the new tear down design, because
> > > > drm_sched_fini() ensures that all jobs are freed on teardown. And
> > > > drm_sched_fini() wouldn't be called before all jobs are gone,
> > > > effectively resulting in a chicken-egg-problem, or rather: the driver
> > > > implementing its own solution for teardown.
> > > > 
> > > 
> > > I've read this four times and I'm still generally confused.
> > > 
> > > "drm_sched_fini ensures that all jobs are freed on teardown" — Yes,
> > > that's how a refcounting-based solution works. drm_sched_fini would
> > > never be called if there were pending jobs.
> > > 
> > > "drm_sched_fini() wouldn't be called before all jobs are gone" — See
> > > above.
> > > 
> > > "effectively resulting in a chicken-and-egg problem" — A job is created
> > > after the scheduler, and it holds a reference to the scheduler until
> > > it's freed. I don't see how this idiom applies.
> > > 
> > > "the driver implementing its own solution for teardown" — It’s just
> > > following the basic lifetime rules I outlined below. Perhaps Xe was
> > > ahead of its time, but the number of DRM scheduler blowups we've had is
> > > zero — maybe a strong indication that this design is correct.
> > > 
> > 
> > Sorry—self-reply.
> > 
> > To expand on this: the reason Xe implemented a refcount-based teardown
> > solution is because the internals of the DRM scheduler during teardown
> > looked wildly scary. A lower layer should not impose its will on upper
> > layers. I think that’s the root cause of all the problems I've listed.
> > 
> > In my opinion, we should document the lifetime rules I’ve outlined, fix
> > all drivers accordingly, and assert these rules in the scheduler layer.
> 
> 
> Everyone had a separate solution for that. Nouveau used a waitqueue.
> That's what happens when there's no centralized mechanism for solving a
> problem.
> 

Right, this is essentially my point — I think refcounting on the driver
side is what the long-term solution really needs to be.

To recap the basic rules:

- Entities should not be finalized or freed until all jobs associated
  with them are freed.
- Schedulers should not be finalized or freed until all associated
  entities are finalized.
- Jobs should hold a reference to the entity.
- Entities should hold a reference to the scheduler.

I understand this won’t happen overnight — or perhaps ever — but
adopting this model would solve a lot of problems across the subsystem
and reduce a significant amount of complexity in the DRM scheduler. I’ll
also acknowledge that part of this is my fault — years ago, I worked
around problems (implemented above ref count model) in the scheduler
related to teardown rather than proposing a common, unified solution,
and clear lifetime rules.

For drivers with a 1:1 entity-to-scheduler relationship, teardown
becomes fairly simple: set the TDR timeout to zero and naturally let the
remaining jobs flush out via TDR + the timedout_job callback, which
signals the job’s fence. Free job, is called after that.

For non-1:1 setups, we could introduce something like
drm_sched_entity_kill, which would move all jobs on the pending list of
a given entity to a kill list. A worker could then process that kill
list — calling timedout_job and signaling the associated fences.
Similarly, any jobs that had unresolved dependencies could be
immediately added to the kill list. The kill list would have to be
checked in drm_sched_free_job_work too.

This would ensure that all jobs submitted would go through the full
lifecycle:

- run_job is called
- free_job is called
- If the fence returned from run_job needs to be artificially signaled,
  timedout_job is called

We can add the infrastructure for this and once all driver adhere this
model, clean up ugliness in the scheduler related to teardown and all
races here.

> Did you see the series we recently merged which repairs the memory
> leaks of drm/sched? It had been around for quite some time.
> 
> https://lore.kernel.org/dri-devel/20250701132142.76899-3-phasta@kernel.org/
>

I would say this is just hacking around the fundamental issues with the
lifetime of these objects. Do you see anything in Nouveau that would
prevent the approach I described above from working?

Also, what if jobs have dependencies that aren't even on the pending
list yet? This further illustrates the problems with trying to finalize
objects while child objects (entities, job) are still around.

Matt

> 
> P.
> 
> > 
> > Matt
> > 
> > > Matt
> > > 
> > > > P.
> > > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > There are two solutions:
> > > > > > 
> > > > > >   (1) Strictly require all entities to be torn down before drm_sched_fini(),
> > > > > >       i.e. stick to the natural ownership and lifetime rules here (see below).
> > > > > > 
> > > > > >   (2) Actually protect *any* changes of the relevent fields of the entity
> > > > > >       structure with the entity lock.
> > > > > > 
> > > > > > While (2) seems rather obvious, we run into lock inversion with this approach,
> > > > > > as you note below as well. And I think drm_sched_fini() should not mess with
> > > > > > entities anyways.
> > > > > > 
> > > > > > The ownership here seems obvious:
> > > > > > 
> > > > > > The scheduler *owns* a resource that is used by entities. Consequently, entities
> > > > > > are not allowed to out-live the scheduler.
> > > > > > 
> > > > > > Surely, the current implementation to just take the resource away from the
> > > > > > entity under the hood can work as well with appropriate locking, but that's a
> > > > > > mess.
> > > > > > 
> > > > > > If the resource *really* needs to be shared for some reason (which I don't see),
> > > > > > shared ownership, i.e. reference counting, is much less error prone.
> > > > > 
> > > > > Yes, Xe solves all of this via reference counting (jobs refcount the
> > > > > entity). It's a bit easier in Xe since the scheduler and entities are
> > > > > the same object due to their 1:1 relationship. But even in non-1:1
> > > > > relationships, an entity could refcount the scheduler. The teardown
> > > > > sequence would then be: all jobs complete on the entity → teardown the
> > > > > entity → all entities torn down → teardown the scheduler.
> > > > > 
> > > > > Matt
> > > > 
> 
