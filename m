Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDDBC3B252
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 14:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E2110E8AF;
	Thu,  6 Nov 2025 13:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ByGQmaEp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1800E10E2E3;
 Thu,  6 Nov 2025 13:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762435008; x=1793971008;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tY5uPm/VBfz8oMILvRn68nWEAq47jc3Qg6FbdKWv6rQ=;
 b=ByGQmaEpWf08Uv6gHwfQf0pC00uBPLyYliB7c9xmmQHBmkiT0kphTb3f
 pILJdjoZsB0DCBp9bIW0cRGLcRDY0zRs+j1emKbScYpyFc0/rKV7WzcDI
 RaU9TybdGITfNVLtphfaUxsDjmz/3047cdwkS+2z4zLeYar4OPS6nIJ0k
 NTvkFphC/23WfdaNfH7Zujj/5zohjFTgU64d73oIOOr4l8Yo7bJghddG1
 ByNFTXpJA0zrFoIMArBXRozEOJj0jVykelwI4QeBxpaAbfrX1QBK1ZQX0
 0eRxlS9ujDFPGU6jaXS21MD6dSTj0zf1BUo1wLwtLW5cFUuJ60WGcZ5rM Q==;
X-CSE-ConnectionGUID: LVJIZtAFTM6xBLwCjXQxQg==
X-CSE-MsgGUID: XErAguI0TnueCgi3F3KBgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="82199266"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="82199266"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 05:16:48 -0800
X-CSE-ConnectionGUID: sR+AxvXaTFqWAUIl4/lvdQ==
X-CSE-MsgGUID: ch0wMEvaRc+Flvfoucbkxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187008322"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 05:16:47 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 05:16:46 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 05:16:46 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 05:16:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rs7eUOsCzCb0w4n+oQU3Wnkq5v8w9crh7Etq2b8SE5wv0+7nI0vZik3O6U21GA92R98rKlgrI6CdHiqH7Mf3tF0guVTpp8SxWGplonqOdZq0LXqC03wfNSfMVtm0vhklTmh3rwDCwdB0SyAmQlJRirigvwlQgWu4n9TFmDeM6pY/HBFGNLXIrYTEZUWa3CGg7QqICxbMwdQ1zEdBFaHNcH79fGwXP+zdb6Vhwz8ns3+ofomSosmy2gZkvAtAnrG98mzmegBq232N8dcnTFU3i3TOQBigtWSqQFQPa2zLkMcQlXNIBcjj/9ub6LzwB6hB5/v3w26wa15sRUUvNshL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jadNKDqEPaNwfHtrrsssusU49KhOmkQ86AVKSYFxrg=;
 b=bzNXJDWsEvCMVT3q7WzXh+XDv8XwR6UpRIpDfdTjdXISLui0SdJso/nxPYEsm9fuk1ZhvMO8XT2fAD8pnDdWAt4tHt8HqCgrlCeMCUNmDC3IH7LA4/XZ5t2zMicL+mIqCdA8N/fDFJFZft/UH3AnsFEgVUlLx9cup6HitSlQtA3q9l+/Y+JjnIrdD6FITajrUS2jrdFyak+7E5shrEAV4y8uLGxNDScEqyQSsV3eW+IfRtsRs+MX6JZx8GeIJ/WHfqODwW/SOs7DXsVV8CIpJetdCdYTwGBM0GM2NmpDEjxCkhL7HWANXJqUsrN+iLUl/NNdTzjgU4vWQXSmJziMfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB6661.namprd11.prod.outlook.com (2603:10b6:806:255::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 13:16:43 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 13:16:43 +0000
Date: Thu, 6 Nov 2025 08:16:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Dave
 Airlie" <airlied@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Lukas Wunner <lukas@wunner.de>, "Aravind
 Iddamsetty" <aravind.iddamsetty@linux.intel.com>, "Zhou1, Tao"
 <Tao.Zhou1@amd.com>, "Liu, Xiang(Dean)" <Xiang.Liu@amd.com>
Subject: Re: DRM_RAS for CPER Error logging?!
Message-ID: <aQyftlgZN11YYQXy@intel.com>
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
 <aQEVy1qjaDCwL_cc@intel.com>
 <BN9PR12MB52574F4EE2FF679D2230BBEFFCFAA@BN9PR12MB5257.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BN9PR12MB52574F4EE2FF679D2230BBEFFCFAA@BN9PR12MB5257.namprd12.prod.outlook.com>
X-ClientProxiedBy: PH8P220CA0034.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB6661:EE_
X-MS-Office365-Filtering-Correlation-Id: 426c5a30-75d3-4e24-e5a9-08de1d36bad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007|13003099007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XkzyniK/5wymx84uwGiJOqAOmP84mTXD3PWRI7yMScQaOs09FGCSuPMuJG?=
 =?iso-8859-1?Q?MlthU7YKS6ic5d6CNckiNQtw/+hXvL0xjVbEVHaW3yzs3m4YanzryaRtVb?=
 =?iso-8859-1?Q?7LxpGXysPKNFbPwJWrkbl1N5raDPD/OGZF8czLgcVgUDkYYBK9qBcPth8O?=
 =?iso-8859-1?Q?mlrJ49wdsjFhhxx53dTBgomkh6R+FLqZNzCxE1t0n/2A4jv4t1FPYerdzq?=
 =?iso-8859-1?Q?TgaeEBCiLJVd2yu3DY7qj+RGfZgNHmSoEq+Uh50E77aUs7uINOR+WoKt3w?=
 =?iso-8859-1?Q?m6J3ijBxVQ1sSX7lbpQgbv7I4BEARXxHM+9Pe/nBH1SitMbaNOnBC4izI/?=
 =?iso-8859-1?Q?+z/+aode4VzD0WIfRXVM2tuua1FomlRXrtUwQVUJYc6QBEslKekKTgNool?=
 =?iso-8859-1?Q?uwJOzSJPKOfYb2ChlJtGVV5gWrxsnEDoJK0GorgEvx7n6aanztZ9pf7Waz?=
 =?iso-8859-1?Q?cQOiXxOzVJHbrAszgXO5Z2Kdvr7SjHadcV631TnMH+19Cgytr2nM/dRL11?=
 =?iso-8859-1?Q?thqr9MbGnQtQPWNhe6aIFqbU4ptTinN0xz/rr7t7BSKs79fN6TMGuNBiPm?=
 =?iso-8859-1?Q?7QFWKnMFIzgJBtV/ihudc5BznhjnoTgrjM0eyR6uLb3FQDJ8xGSTvgXjbR?=
 =?iso-8859-1?Q?6mGcKaRUV16W4pO487RiqXjpyi/thihzJF0qNf9alZe83p9SC8pCsJ8PaI?=
 =?iso-8859-1?Q?ZfNE4ZW2Cw+Mo3W1m0hdf+b1/YDwdtPi3I4/bgSdY6pceDRBh36Vw+7+pO?=
 =?iso-8859-1?Q?MMBMydar6JSr6ZLx7vkQp6cF5imaZT7YzPO3gQCwEEQv/liQWqHwq7QJuP?=
 =?iso-8859-1?Q?IsBp2f6HW7FnfPPOMP4el6g8dOZIdC/KZfY3P1InmLO4rqix3ygbqYqiaj?=
 =?iso-8859-1?Q?/yAK7PkUGFNMa3gJGik66T0C1KNme4DL8l8CnArm0E9PWOxUMJ7sa+gWhR?=
 =?iso-8859-1?Q?lZVzgxyx6xoKDvOno5sqBlyIMwTIebqM9GwE3Bqj+HVWJo97Pc6K+yXS+8?=
 =?iso-8859-1?Q?/c3JtzBPiXKXd4oq2CBkpbySmo/pFKWicv7qzwDuVS69xtzcDvCpMLSl2P?=
 =?iso-8859-1?Q?PIsG3Y9TbLFQpV1HPFYXcU+na6e2J/g1HInJGamfLs2QR6s9jJ8aUSwBUu?=
 =?iso-8859-1?Q?qbc5lklZ+Un2tWtu+HHqrznwO+1jTEV7N8w4h86DOnS65TwVI3IEhjsTxp?=
 =?iso-8859-1?Q?spgX8MJFmsV/jbynTa4wiIUbqzzmz7VRA84pyTWB6qYrMfI1a0FfcO3ZrI?=
 =?iso-8859-1?Q?tzondsSFzVkKfu/tnTKrjmDXYoC4bKK9v64IGTxF8Q8Z06XeEfYBbTNb7B?=
 =?iso-8859-1?Q?KffZKdhdE9oaX8imL1iNMhAUBsCi5TSgR8Vbnnyxz2i+yqjtB0P6PvAaNc?=
 =?iso-8859-1?Q?vuz2jX/q4xJnNZlV3IdPbkWznYfxcJiO/sjpFEMmzjtd7Sdm5apeqdW3OI?=
 =?iso-8859-1?Q?9E0UNLxL7X0d39FyVZy95P9DWkdwvRg1/NH1xQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Y3zWa79oF2tQ0k1+WP9I08EGgj/QpooXC4+cLRJ6OOMdyMoPTfZKA3K/In?=
 =?iso-8859-1?Q?peXSnuG5jwF3AC3Mh1QK21jUTqLO5A3aLBcyxRVQc2o9B0ssMeAlK3Ze6A?=
 =?iso-8859-1?Q?ezVRm7KJEKrES/ECv2sy6xjuSp5W5NhyqVJOLHuRGpRjhApzkQgmERplwf?=
 =?iso-8859-1?Q?Y0m5MDHyuoX0W8gjlDYrArfAyRiWv7lUkuclfgX30RjA1EYl3CRHgsZM84?=
 =?iso-8859-1?Q?Cg45aQGrDnP9j8TwK0f1eWXSRrEYizCOe3TIAuEEWAOJUfod6f3Dvf4AG5?=
 =?iso-8859-1?Q?8hmjjY41g9THAXKErpAy/fD1VXXeqF2VXCCYOMrBto5Pr699JS2vIa0+cO?=
 =?iso-8859-1?Q?4JChQuNlti2k/7kx71lCWJ6wI1As6ie+i8Q7fr9FWoe44YKo8lPrIhhe/H?=
 =?iso-8859-1?Q?PJR1AJnpwN8uNcylYZb3HGHRPx2GeCO6dQol98e81wMFnVRcooUnAqjZJp?=
 =?iso-8859-1?Q?M7TETc+5WGPz11Tu+HVTq2/rl1aXVZC4UQV0l3x/4+rlgag6jrQsmY/V1g?=
 =?iso-8859-1?Q?AdKdTJ5OtEzB6ikyCM9UYmUivBlbv7OrpDrCgLqV5weMBYCBODeQEV3+xW?=
 =?iso-8859-1?Q?gbK3ePxxNzCDcs/AKbz3aKjiM2aBMQxx76NtKtcA1G+aUCvvM/E0ZrHQn1?=
 =?iso-8859-1?Q?ZDqlgVw7VE+LGErpluO85VEj7pSqAerFfUeHLaTtGItehv4BnBG2w4pIL3?=
 =?iso-8859-1?Q?hbdGEb73j6P4RGC0SIXZxNIkDbYPkgK/Mel7w2M90psu82NQp3Xs7om3pV?=
 =?iso-8859-1?Q?HFtYOGdquhSGSyVSf7MSNIPnIkg+rI2Fwoam41KNMHsFViMSLxKlS3zvhM?=
 =?iso-8859-1?Q?qfGhfY8/W35iG1Zti9Wyuf1MiIbjWTI4GOX8u4XHId8kOWVI4sP4F1BphX?=
 =?iso-8859-1?Q?CcUEqbkPOKVed2oxkGiPafgk8Bpi5Uf89v1D5O60xAxC6IaBpmO5WHWBLn?=
 =?iso-8859-1?Q?k7tGJqibZiTeJ4KDTS0ZH0FQaL5Dq3rW9u8NKWAXaxPGzPwqjKIWTJCvQt?=
 =?iso-8859-1?Q?/I7dgBQQ/2uA59/HznycYNv0dq85ki7T77JFKv02EKXpUVAB2EULWvyHa1?=
 =?iso-8859-1?Q?qwpBGb7OsiVyPRUwOuZEt439jA07iqJqYSIBuNlzN0mlf5VkHO8YhVz381?=
 =?iso-8859-1?Q?MLJ5E7FXsZxc1FBlo7YMzZXh3du9Av8oYBWp6k5FcKAXOQKQPb85IOMMVQ?=
 =?iso-8859-1?Q?X0oe1Tul050k6xyDxoUhiQQYLzcF+ZrUGaIn61TRC/Zw0hq3OIzJqeIpEd?=
 =?iso-8859-1?Q?/7G4+30jS19T0jzZHKibkg2W8l6cIx1dlXDTNUhxIkAJYKlUJ5og+2LTqr?=
 =?iso-8859-1?Q?Z4JVt5qYBXwsvBu74Y4GIa2kxK6A+9j6Sp3F6E7sLZae1Ie2Gw5HIZParu?=
 =?iso-8859-1?Q?fLb6/tWAN3hvjLQxv32ZA2plCDbU45B1yU5bNPzXfLn4Cctf8MorijHZJ7?=
 =?iso-8859-1?Q?DIs6oJ3ZUKYptPy8Hr3M/79HWpmATbpfj423/FF6pqKLenwg3lMWWbUk9I?=
 =?iso-8859-1?Q?i8TzjhXQm+YqHxZ3BfrOm+WRQrsmtTnGbjHLzrQGgEOnXlYw1CQtBeLEv0?=
 =?iso-8859-1?Q?9TjNNtRuIRFo74Q4HMkgtB9045sWZ6Vg8zSe9HTYnA/4n24KWF0LM6F9Fw?=
 =?iso-8859-1?Q?UtIE38FLLbcmLdIk7UXmsWRh16Iv3oTVV57AjD1D7s27MA4m0Od0ZwKw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 426c5a30-75d3-4e24-e5a9-08de1d36bad5
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:16:43.5898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tp+eGTAMWZUXAAtD7jLT/+AN0uJq/FZf6p7+7lOT9b2y9FYPyFX4R9L4KMVUYti/Xy6tccUhQizPT6HEWJr7Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6661
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

On Wed, Oct 29, 2025 at 02:00:38AM +0000, Zhang, Hawking wrote:
>    [AMD Official Use Only - AMD Internal Distribution Only]                     
>    + [1]@Zhou1, Tao and [2]@Liu, Xiang(Dean) for the awareness.                 
>                                                                                 
>    RE - AMD folks, would you consider this to replace the current debugfs you   
>    have?                                                                        
>                                                                                 
>    [Hawking]:                                                                   
>                                                                                 
>    Replacing the debugfs is not the primary concern.

My initial plan was to go with debugfs like you are doing, but
I keep hearing complains that debugfs is not global and we need
to take into account some cases where debugfs is not available
in production images.

> The main concern is        
>    whether drm_ras can effectively support the necessary RAS information for    
>    all device vendors, as this largely depends on the design of the hardware    
>    and firmware.                                                                

I fully agree. This is the main reason I'm doing my best to make the drm-ras
the most generic and expansible as possible.

node registration with different node types, and names.

I imagined something like:

[{'FRU': 'String with device info', 'CPER': !@#$#!@#$},

based on the format that the current non-standard-cper tracefs uses, with
the FRU + CPER. But we could avoid the FRU and make the FRU as node name.

>                                                                                 
>    AMD is currently evaluating the proposed interface for error logging.        

The design of the details and the implementation is pretty much open for discussion
at this point.

What I'm really looking forward is:

to know if the path is acceptable overall
even if different drivers are opting for different node types?

Is there any blocker on using this drm-ras/netlink for the CPER?

Thanks,
Rodrigo.


>                                                                                 
>    Regards,                                                                     
>    Hawking                                                                      
>                                                                                 
>    -----Original Message-----                                                   
>    From: Rodrigo Vivi <rodrigo.vivi@intel.com>                                  
>    Sent: Wednesday, October 29, 2025 03:13                                      
>    To: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Dave    
>    Airlie <airlied@gmail.com>; Joonas Lahtinen                                  
>    <joonas.lahtinen@linux.intel.com>; Simona Vetter <simona.vetter@ffwll.ch>;   
>    Zhang, Hawking <Hawking.Zhang@amd.com>; Deucher, Alexander                   
>    <Alexander.Deucher@amd.com>; Zack McKevitt                                   
>    <zachary.mckevitt@oss.qualcomm.com>; Lukas Wunner <lukas@wunner.de>;         
>    Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>                      
>    Cc: Zhang, Hawking <Hawking.Zhang@amd.com>; Deucher, Alexander               
>    <Alexander.Deucher@amd.com>; Zack McKevitt                                   
>    <zachary.mckevitt@oss.qualcomm.com>; Lukas Wunner <lukas@wunner.de>; Dave    
>    Airlie <airlied@gmail.com>; Simona Vetter <simona.vetter@ffwll.ch>;          
>    Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>; Joonas Lahtinen     
>    <joonas.lahtinen@linux.intel.com>                                            
>    Subject: DRM_RAS for CPER Error logging?!                                    
>                                                                                 
>    On Mon, Sep 29, 2025 at 05:44:12PM -0400, Rodrigo Vivi wrote:                
>                                                                                 
>    Hey Dave, Sima, AMD folks, Qualcomm folks,                                   
>                                                                                 
>    I have a key question to you below here.                                     
>                                                                                 
>    > This work is a continuation of the great work started by Aravind ([1]      
>    > and [2]) in order to fulfill the RAS requirements and proposal as          
>    > previously discussed and agreed in the Linux Plumbers accelerator's bof    
>    of 2022 [3].                                                                 
>    >                                                                            
>    > [1]:                                                                       
>    >                                                                            
>    [3]https://lore.kernel.org/dri-devel/20250730064956.1385855-1-aravind.idd    
>    > [4]amsetty@linux.intel.com/                                                
>    > [2]:                                                                       
>    >                                                                            
>    [5]https://lore.kernel.org/all/4cbdfcc5-5020-a942-740e-a602d4c00cc2@linux    
>    > .intel.com/                                                                
>    > [3]:                                                                       
>    >                                                                            
>    [6]https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary    
>    > .html                                                                      
>    >                                                                            
>    > During the past review round, Lukas pointed out that netlink had           
>    > evolved in parallel during these years and that now, any new usage of      
>    > netlink families would require the usage of the YAML description and       
>    scripts.                                                                     
>    >                                                                            
>    > With this new requirement in place, the family name is hardcoded in        
>    > the yaml file, so we are forced to have a single family name for the       
>    > entire drm, and then we now we are forced to have a registration.          
>    >                                                                            
>    > So, while doing the registration, we now created the concept of            
>    drm-ras-node.                                                                
>    > For now the only node type supported is the agreed error-counter. But      
>    > that could be expanded for other cases like telemetry, requested by        
>    > Zack for the qualcomm accel driver.                                        
>    >                                                                            
>    > In this first version, only querying counter is supported. But also        
>    > this is expandable to future introduction of multicast notification and    
>    also clearing the counters.                                                  
>    >                                                                            
>    > This design with multiple nodes per device is already flexible enough      
>    > for driver to decide if it wants to handle error per device, or per IP     
>    > block, or per error category. I believe this fully attend to the           
>    > requested AMD feedback in the earlier reviews.                             
>    >                                                                            
>    > So, my proposal is to start simple with this case as is, and then          
>    > iterate over with the drm-ras in tree so we evolve together according      
>    > to various driver's RAS needs.                                             
>    >                                                                            
>    > I have provided a documentation and the first Xe implementation of the     
>    > counter as reference.                                                      
>    >                                                                            
>    > Also, it is worth to mention that we have a in-tree pyynl/cli.py tool      
>    > that entirely exercises this new API, hence I hope this can be the         
>    > reference code for the uAPI usage, while we continue with the plan of      
>    > introducing IGT tests and tools for this and adjusting the internal        
>    > vendor tools to open with open source developments and changing them to    
>    support these flows.                                                         
>    >                                                                            
>    > Example on MTL:                                                            
>    >                                                                            
>    > $ sudo ./tools/net/ynl/pyynl/cli.py \                                      
>    >   --spec Documentation/netlink/specs/drm_ras.yaml \                        
>    >   --dump list-nodes                                                        
>    > [{'device-name': '00:02.0',                                                
>    >   'node-id': 0,                                                            
>    >   'node-name': 'non-fatal',                                                
>    >   'node-type': 'error-counter'},                                           
>    >  {'device-name': '00:02.0',                                                
>    >   'node-id': 1,                                                            
>    >   'node-name': 'correctable',                                              
>    >   'node-type': 'error-counter'}]                                           
>                                                                                 
>    As you can see on the drm-ras patch, we now have only a single family        
>    called 'drm-ras', with that we have to register entry points, called         
>    'nodes'                                                                      
>    and for now only one type is existing: 'error-counter'                       
>                                                                                 
>    As I believe it was agreed in the Linux Plumbers accelerator's bof of 2022   
>    [3].                                                                         
>                                                                                 
>    Zack already indicated that for Qualcomm he doesn't need the error           
>    counters, but another type, perhaps telemetry.                               
>                                                                                 
>    I need your feedback and input on yet another case here that goes side by    
>    side with error-counters: Error logging.                                     
>                                                                                 
>    One of the RAS requirements that we have is to emit CPER logs in certain     
>    cases. AMD is currently using debugfs for printing the CPER entries that     
>    accumulates in a ringbuffer. (iiuc).                                         
>                                                                                 
>    Some folks are asking us to emit the CPER in the tracefs because debugfs     
>    might not be available in some enterprise production images.                 
>                                                                                 
>    However, there's a concern on the tracefs usage for the error-logging        
>    case.                                                                        
>    There is no active query path in the tracefs. If user needs to poll for      
>    the latest CPER records it would need to pig-back on some other API that     
>    would force the emit-trace(cper).                                            
>                                                                                 
>    I believe that the cleanest way is to have another drm-ras node type named   
>    'error-logging' with a single operation that is query-logs, that would be    
>    a dump of the available ring-buffer with latest known cper records. Is       
>    this acceptable?                                                             
>                                                                                 
>    AMD folks, would you consider this to replace the current debugfs you        
>    have?                                                                        
>                                                                                 
>    Please let me know your thoughts.                                            
>                                                                                 
>    We won't have an example for now, but it would be something like:            
>                                                                                 
>    Thanks,                                                                      
>    Rodrigo.                                                                     
>                                                                                 
>    $ sudo ./tools/net/ynl/pyynl/cli.py \                                        
>      --spec Documentation/netlink/specs/drm_ras.yaml \                          
>      --dump list-nodes                                                          
>    [{'device-name': '00:02.0',                                                  
>      'node-id': 0,                                                              
>      'node-name': 'non-fatal',                                                  
>      'node-type': 'error-counter'},                                             
>    {'device-name': '00:02.0',                                                   
>      'node-id': 1,                                                              
>      'node-name': 'correctable',                                                
>      'node-type': 'error-counter'}                                              
>    'device-name': '00:02.0',                                                    
>      'node-id': 2,                                                              
>      'node-name': 'non-fatal',                                                  
>      'node-type': 'error-logging'},                                             
>    {'device-name': '00:02.0',                                                   
>      'node-id': 3,                                                              
>      'node-name': 'correctable',                                                
>      'node-type': 'error-logging'}]                                             
>                                                                                 
>    $ sudo ./tools/net/ynl/pyynl/cli.py \                                        
>       --spec Documentation/netlink/specs/drm_ras.yaml \                         
>       --dump get-logs --json '{"node-id":3}'                                    
>    [{'FRU': 'String with device info', 'CPER': !@#$#!@#$},                      
>    {'FRU': 'String with device info', 'CPER': !@#$#!@#$},                       
>    {'FRU': 'String with device info', 'CPER': !@#$#!@#$},                       
>    {'FRU': 'String with device info', 'CPER': !@#$#!@#$},                       
>    {'FRU': 'String with device info', 'CPER': !@#$#!@#$}, ]                     
>                                                                                 
>    Of course, details of the error-logging fields along with the CPER binary    
>    is yet to be defined.                                                        
>                                                                                 
>    Oh, and the nodes names and split is device specific. The infra is           
>    flexible enough. Driver can do whatever it makes sense for their device.     
>                                                                                 
>    Any feedback or comment is really appreciated.                               
>                                                                                 
>    Thanks in advance,                                                           
>    Rodrigo.                                                                     
>                                                                                 
>    >                                                                            
>    > $ sudo ./tools/net/ynl/pyynl/cli.py \                                      
>    >   --spec Documentation/netlink/specs/drm_ras.yaml \                        
>    >   --dump get-error-counters --json '{"node-id":1}'                         
>    > [{'error-id': 0, 'error-name': 'GT Error', 'error-value': 0},              
>    >  {'error-id': 4, 'error-name': 'Display Error', 'error-value': 0},         
>    >  {'error-id': 8, 'error-name': 'GSC Error', 'error-value': 0},             
>    >  {'error-id': 12, 'error-name': 'SG Unit Error', 'error-value': 0},        
>    >  {'error-id': 16, 'error-name': 'SoC Error', 'error-value': 0},            
>    >  {'error-id': 17, 'error-name': 'CSC Error', 'error-value': 0}]            
>    >                                                                            
>    > $ sudo ./tools/net/ynl/pyynl/cli.py \                                      
>    >   --spec Documentation/netlink/specs/drm_ras.yaml \                        
>    >   --do query-error-counter --json '{"node-id": 0, "error-id": 12}'         
>    > {'error-id': 12, 'error-name': 'SG Unit Error', 'error-value': 0}          
>    >                                                                            
>    > $ sudo ./tools/net/ynl/pyynl/cli.py \                                      
>    >   --spec Documentation/netlink/specs/drm_ras.yaml \                        
>    >   --do query-error-counter --json '{"node-id": 1, "error-id": 16}'         
>    > {'error-id': 16, 'error-name': 'SoC Error', 'error-value': 0}              
>    >                                                                            
>    > Thanks,                                                                    
>    > Rodrigo.                                                                   
>    >                                                                            
>    > Cc: Hawking Zhang <[7]Hawking.Zhang@amd.com>                               
>    > Cc: Alex Deucher <[8]alexander.deucher@amd.com>                            
>    > Cc: Zack McKevitt <[9]zachary.mckevitt@oss.qualcomm.com>                   
>    > Cc: Lukas Wunner <[10]lukas@wunner.de>                                     
>    > Cc: Dave Airlie <[11]airlied@gmail.com>                                    
>    > Cc: Simona Vetter <[12]simona.vetter@ffwll.ch>                             
>    > Cc: Aravind Iddamsetty <[13]aravind.iddamsetty@linux.intel.com>            
>    > Cc: Joonas Lahtinen <[14]joonas.lahtinen@linux.intel.com>                  
>    > Signed-off-by: Rodrigo Vivi <[15]rodrigo.vivi@intel.com>                   
>    >                                                                            
>    > Rodrigo Vivi (2):                                                          
>    >   drm/ras: Introduce the DRM RAS infrastructure over generic netlink       
>    >   drm/xe: Introduce the usage of drm_ras with supported HW errors          
>    >                                                                            
>    >  Documentation/gpu/drm-ras.rst              | 109 +++++++                  
>    >  Documentation/netlink/specs/drm_ras.yaml   | 130 ++++++++                 
>    >  drivers/gpu/drm/Kconfig                    |   9 +                        
>    >  drivers/gpu/drm/Makefile                   |   1 +                        
>    >  drivers/gpu/drm/drm_drv.c                  |   6 +                        
>    >  drivers/gpu/drm/drm_ras.c                  | 357 +++++++++++++++++++++    
>    >  drivers/gpu/drm/drm_ras_genl_family.c      |  42 +++                      
>    >  drivers/gpu/drm/drm_ras_nl.c               |  54 ++++                     
>    >  drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  22 ++                       
>    >  drivers/gpu/drm/xe/xe_hw_error.c           | 155 ++++++++-                
>    >  include/drm/drm_ras.h                      |  76 +++++                    
>    >  include/drm/drm_ras_genl_family.h          |  17 +                        
>    >  include/drm/drm_ras_nl.h                   |  24 ++                       
>    >  include/uapi/drm/drm_ras.h                 |  49 +++                      
>    >  14 files changed, 1049 insertions(+), 2 deletions(-)  create mode         
>    > 100644 Documentation/gpu/drm-ras.rst  create mode 100644                   
>    > Documentation/netlink/specs/drm_ras.yaml                                   
>    >  create mode 100644 drivers/gpu/drm/drm_ras.c  create mode 100644          
>    > drivers/gpu/drm/drm_ras_genl_family.c                                      
>    >  create mode 100644 drivers/gpu/drm/drm_ras_nl.c  create mode 100644       
>    > include/drm/drm_ras.h  create mode 100644                                  
>    > include/drm/drm_ras_genl_family.h  create mode 100644                      
>    > include/drm/drm_ras_nl.h  create mode 100644                               
>    > include/uapi/drm/drm_ras.h                                                 
>    >                                                                            
>    > --                                                                         
>    > 2.51.0                                                                     
>    >                                                                            
> 
> References
> 
>    Visible links
>    1. mailto:Tao.Zhou1@amd.com
>    2. mailto:Xiang.Liu@amd.com
>    3. https://lore.kernel.org/dri-devel/20250730064956.1385855-1-aravind.idd
>    4. mailto:amsetty@linux.intel.com/
>    5. https://lore.kernel.org/all/4cbdfcc5-5020-a942-740e-a602d4c00cc2@linux
>    6. https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary
>    7. mailto:Hawking.Zhang@amd.com
>    8. mailto:alexander.deucher@amd.com
>    9. mailto:zachary.mckevitt@oss.qualcomm.com
>   10. mailto:lukas@wunner.de
>   11. mailto:airlied@gmail.com
>   12. mailto:simona.vetter@ffwll.ch
>   13. mailto:aravind.iddamsetty@linux.intel.com
>   14. mailto:joonas.lahtinen@linux.intel.com
>   15. mailto:rodrigo.vivi@intel.com
