Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B49AA5B830
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 06:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E09410E04A;
	Tue, 11 Mar 2025 05:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+l/d3HL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFF110E04A;
 Tue, 11 Mar 2025 05:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741669412; x=1773205412;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=n6CFmR5ih0+qYu0hjtLDdprlqWj2yIAT9psVsKYRUkY=;
 b=P+l/d3HL8Y39UNG37pxS1xufK+TAIqLr8zn/aEPZDCFkeQFWEV6qshZa
 sDRR1MI5sUg+GtnMrk3t3MgoFiX5BsZQSuRNErqffO5gGPWGeHjrGMcoa
 MhH2zJgzC+Uz8iWFtMyzai8CwR3kLOQS8kC5Unr5C3FivO7UXZYfhYxKJ
 F4Kb0AL94gtzgN4I2eHfjs/tNz4TygnGz+r+pSFNUzEZN7u3a0INx/5gN
 k3Cwv0HY/KUwZsJNvhN0jBNQgc395cp7oUo7MtZybSHyFl/Nx3dEQvWB3
 JiL1ta89BYU20tCJaG9kusKwnzOEM92dDaMzS1ziA4c0+M6DdAVgiGE5S w==;
X-CSE-ConnectionGUID: J2sV8BTATUuZ2RzjlHOYPQ==
X-CSE-MsgGUID: IjO0oXHRRFqWRmX1GOCYEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="30266697"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="30266697"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 22:03:32 -0700
X-CSE-ConnectionGUID: 0fQdL5/HSPWzrg4thk8GIg==
X-CSE-MsgGUID: XiMiY1QsTSuyCOFmYfPcnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="124370156"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 22:03:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 22:03:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 22:03:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 22:03:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUCLvCkuXtjQs7dUmvBgDu7lBuca5N0oi95xDk6YAROpvoDthp7OOgQvWyPekeE0VETtcc9iqzdZkxUMClf0zC3LDl4e64ydo2/vhsFG8ad0rNX+BNmyId0t0bIrm1Xj0rspYTbojKeOd7Ujd/MkMWpXyqLm5fryO9PY5fE6s2LMW/LaM58wy5vsfA7AtNddkw3u/4RS6DWjqIM7/my67P0i3eUOd5tZTShk4jJcj0iD1yotKywqq71uTL1wKzEP2vivRYc6/WpXuQ/D18XvDBnTiZVOLLToY8uuPKvEGnY05RbAtgDFRvMvKror1QzuJXUAlsiNxgBOoDASsHcCKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMQDu6Bff1ztw0Cb2akb0uzCoTMNaPMJP8A5R8BuHUM=;
 b=OyHbLtqNkrR0HeHvWr9DiAWisYvvr0+5jdV9VkTVQwD4RSpUZKLbuxiabROwa7nVveeozofEJK4yf5YS+/jLWmF20tvCH184iRDhZe2J7PpCKNj8chJovS7xJdZ90aB5NMp21TpWvLAPiWOEh2vJGyzOUbLcQu5wMddTSdHq4D+vo2x94vE6KQVJwJR/hfCxLA8mjQSgi9jZigIWs4OpDJfMXTWFL3Re5CyJgVz2xlZHPyTvDwWNBziWPcVOgw4X6WcyI2YxHXGvn/bbfPNegj7GzFCPHUGB3AmRHhLB3lTFwRofPHHLxaYbAuW2mldhstPvAaoEHQaoU3n1T9ykTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6461.namprd11.prod.outlook.com (2603:10b6:930:33::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 05:03:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 05:03:14 +0000
Date: Mon, 10 Mar 2025 22:04:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH next] drm/xe: Fix uninitialized variable in
 xe_vm_bind_ioctl()
Message-ID: <Z8/EVnqZoYamdjTy@lstrano-desk.jf.intel.com>
References: <4a74b296-8b51-4dab-a2f1-69919da1ca62@stanley.mountain>
 <Z88ZzoFA5KpQTLmH@intel.com>
 <95a4da90-dfa0-4033-aba5-276b3d9a1824@stanley.mountain>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95a4da90-dfa0-4033-aba5-276b3d9a1824@stanley.mountain>
X-ClientProxiedBy: MW4PR04CA0040.namprd04.prod.outlook.com
 (2603:10b6:303:6a::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: e03a7c52-6f6a-4db3-354d-08dd605a0776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1RmSzRaOVgvVCtndHVxWEVFbUFQVXhiWWxJQ0VaV0pDdnZMWTBoV1VlY3I0?=
 =?utf-8?B?cmNrNis3WmREV2RkU1pRZGlIT3RoZUIvcWdNY2dQN1c2Ykh4VEcrc3RxVWM1?=
 =?utf-8?B?WUVRU2JJc1ZRcEZpaVZHdHZ1YWR0aWVyMm9iK3VlL08yVXU2cTM1VkhEaTEv?=
 =?utf-8?B?azB0RGdTdHN1OGhTTVdWNThuTG95clJGSm1WV0hjbVpNUG8xZHM2a1FMQkE0?=
 =?utf-8?B?NlpBZy9pYSsyWjR0NTVsUFM1WWNZTTBxcU9sbGQ1eXlxTlVhcmdvakVRTk1X?=
 =?utf-8?B?K1NkT2NLT3RIYW1XT2w3WmJMR1V0bTZSR0lDYlJtWk5JdkFuRC9hRisxU3Rq?=
 =?utf-8?B?T0x3amVwTG1jeFdIY2pOL2xCSmxHQW1UTG9jbEFPOCtOUE9Xb0hObWhiTU80?=
 =?utf-8?B?VWdqQ0YwQ0daa01wMXEzNEtFeUlDcjMyTW5IOE5Ja1UrM3lBbjV0eFVyZUMx?=
 =?utf-8?B?NHFacFJTY0haVkNXcGE1R0RuNGI2MTVFWFdYTFVUdkE5VmxUc2gzY09oOVpX?=
 =?utf-8?B?aHRtS1VBRFRuL29idEhMOWNLTlNOcWNPZGlmRzRNN09Ha1RxcDM2azFiS292?=
 =?utf-8?B?OVY1RGNSWmlWaTUzSGRyWEtnaTZ6MytwZ2RrUnlSUnl6VS9zS0VaakUyTFcr?=
 =?utf-8?B?ZGpZN3ZZSWltMkorKzFiN2Rpa205ZkJkT1llMC9ON0NJV3B3c21ZYndFZDVY?=
 =?utf-8?B?cFNTazZTamRQeS9LTUVrcFpIQ1dYeGNRMzEvaG5LY0IyVDJTc0ZVajMyU3p2?=
 =?utf-8?B?SEJrdE9ITlNQRXNYTXJtS21RU01ISndXMDlSbDg5WjJnd21wRWk4ekc5Y2pt?=
 =?utf-8?B?dWw2dWJOWHFvTk4wc2U1SWRpMmRjMVBWcUx2aHliS3l5bXJlZlp6NmtEOFRH?=
 =?utf-8?B?eWZYdHNUN2Uyd0pjUm1LcHl0RnkvYm5mdC9Ba1NONlRPOU9wamZUeldqdi9j?=
 =?utf-8?B?VWpiN0dSL0pkZzFZR2NpTHFOMUZsNkM1QU11ZGZoejU0K3NLTnljSm9kZmJr?=
 =?utf-8?B?UWpKbUFsWDcyT21lb1V5SitSYXNLdG5uMlVBd0RncFpjWVZkNzBkK1crU3VK?=
 =?utf-8?B?d3RacVV3Rkprc0tFQWNlT2FOWmhBQjZCU1hMOG4xRnFNZ3grbk5vdWdUQlMw?=
 =?utf-8?B?R0ZLRGdqOTdlYWJUdVV4NVVFazI3eDhTbkZUVjAvL0tEWTNEWVU5TG9HR1Rq?=
 =?utf-8?B?SjlzSm12aGJFbHNJamc3VXhuY2huakFQRUpsNm16UXhOQ1V4K1hQbnBvU0sx?=
 =?utf-8?B?bjBxeVNDcmthdDU3QWpyVlB3cGVodmxwVDdZekJWbkFzRzRPQmxVcjdFVEJv?=
 =?utf-8?B?RnlSWFBVSFdISy9ZbERLaUx6ZkorMFJVSWpnU0VpSGpidFlaM3hVc0tPV3Q4?=
 =?utf-8?B?RG5Nb2U4RkdUd3FvWjVISU9reDMxZXRMMFUrSDJON0JGTWI1RitHUmRSRkYy?=
 =?utf-8?B?anNFNDBjWExMWVFqQ1NYQkM4d3lSZTY1RDlOdndGWEtNamlCL1ZUQUs2S01y?=
 =?utf-8?B?RUNBU1FzU1dYQjN5dFh4QUVMUjA3Z2xGVEdLa0NQdTFVQi8zbVJ2WjRwdW51?=
 =?utf-8?B?UTZFNzcvWEVjQ2hRaHlzVjlhKzNEdWRIeXovcWtQUUhEdkpoTVo3U01LZ3JP?=
 =?utf-8?B?aGlRTWE3aG1SSnoxb21IQ2UxV2ZWQVNORm9vZmtiUnpOMzJqNXRZbUR2TmdM?=
 =?utf-8?B?YWN5WjNib281ZDZtOEE2UUd2Y3VzUklLb2N4MDZkWCtGK3FadkdPdDBjejV5?=
 =?utf-8?B?SGdkQ25xRklDaWZ3OXhOMmpwYjJtR2ZTNjZVSE9yb2ZUclRMVW9KNXFDRG1x?=
 =?utf-8?B?QllKTkhjTi9LS0VhZUZpRUNMaU1XK3oraG1nWmx5LzhwR25HVzBzTmhkSkt0?=
 =?utf-8?Q?fjy9FNOyORYRl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1hzUDJUUCtWTjMvc1dlaUpubTh0Rk0vdkMvS3Q1UVNOQ1JDRzE5M252OSsr?=
 =?utf-8?B?c3E3NDE5VkxXQmQ0UHFNbkVkMjFRQkc2WlF5ZjUreElLVldzbEZ0R29IMm02?=
 =?utf-8?B?REs5OHp5Sm93YkQ5dm5VYjZSc2V5bWpzSkFkRFFHMWdFTlZJSGRTbDBxOE4x?=
 =?utf-8?B?Zm5meEkvQlhOd1VMNVFULzhxdVo5OWZJc1hTaTBYbGs5d3pOdy9VVGpLLzli?=
 =?utf-8?B?RlV4NktJTG0xL3IyR0FLZWh3cEpNUG1qamUwNnpndWt1L21ZeldxVXpZc2tO?=
 =?utf-8?B?bExKRWg5a0NBSGlkbWJnNFhqTVc2M0c4RHJMWGRUU1pwTjlRaGg2QXRoSlkv?=
 =?utf-8?B?MlAwbUtlazZiNXhLUmxieG11Nm5peUtNWFZJZVp2VldvMWlNWjZZMVFRckl4?=
 =?utf-8?B?YVNDWGJFUTVXaGQ3bDloQkRuMmZ4N2RPRVZRQTJMLytYUlZkcFZndU5COGV2?=
 =?utf-8?B?MnZWQWNvUDJrcWE0UFY3engxU1VKZ3pQcGV5Zko0Wkh4eVlFcnlaaWdQY3Bi?=
 =?utf-8?B?VVJRbnE3MkZCQXozQWRUcnFVMm90ZEJJZEl3WFhYem12dEFwZ3VjQk5vN0pW?=
 =?utf-8?B?MU9LZ2M0cCswLzdDL1YrRlNQUkJTM3h2akZ0VXorKzhsSEV4OHZxK2FCV1Bu?=
 =?utf-8?B?UVpueXpqdWFvYWdLN1ZoQkRJd1hHYkdWdWdidkRVVDRMcUl6WG1wcmdaUGhQ?=
 =?utf-8?B?YWVjQ1h0eEpMQnNNZ0x3dFgvbFIzQXhmWmFxYzJkWlhXUXZXYm0xdVFmSVhB?=
 =?utf-8?B?TC9EQllOeGErSEhwOWxXZm44RzFCV081cFdnUTZaaXFMSGIzaWNFay9HMU9O?=
 =?utf-8?B?SlF1RURKL2lGVmVQbkpVNEdheUFPNFpaWk5vdWZpY2FNTHRoQUNubXlYeWpR?=
 =?utf-8?B?c2w2eERtZUxFQnJTZDluVDVhTXJSb2lzSGdycFFsQklvNmRiclAwWWJuaVJU?=
 =?utf-8?B?WWtLZWZJMVp4SmV2NWlTU2UvTkxualFKcTVhYk0rZ0QreGlNTTZpSnd3d2N4?=
 =?utf-8?B?RlUrc2VwWlRMdE1obzBKclB6RlJXQitUTmF2ZG9wQmpTdmNKeTJjT1k5UVlP?=
 =?utf-8?B?bUkySUxFdHNtQjFxVG5hNlRITTBwNjJuSys1b001OEVYTFAvdmo1VmFyaWM5?=
 =?utf-8?B?VmZjRVFLSEFBRWZKQkhLNVZpdmhjN2xoeVBMeThYeWgzdVhYbXVsZW0yZVY2?=
 =?utf-8?B?ekJFLzFpVHJQMnh3eVNsNm1xcXc4dFNDb0I5bE9EY1lua2w0RURRdUZDTGFZ?=
 =?utf-8?B?OWZnTk13NUN5cGtGb2hsSURwTG4vNlFuVVBDZnpLU2xjYjNKeVI0MWQ0ZVJl?=
 =?utf-8?B?L2Y4czFRbmtvbzY0WHNDRFBKQ0JScjBMSUV4c1B1dUZjN2ZMYmZXcU5wZkdK?=
 =?utf-8?B?eTFSdjFFQWhTS3FDaW9SMk41cGlta1h3UElpTWhrKzQxM2ZiY3V2YWpYYi9h?=
 =?utf-8?B?bjRHb2xkTFlYRUpOdWt2ZndKS3BWVkJCemRFd0dwOEkxaDd5bGlFdnEvSXFN?=
 =?utf-8?B?aUYrdnRLNUJvUUpIQ0RWTjVvVG1hVEt3eFZoQUFnQVBRaVFZWUJieDRvMTcv?=
 =?utf-8?B?ZlVJWkdld1ZPM0VvaTRIVzhkSHlKc3NmMk51a3ZsZGx6M0F6SVBiYkRkTURz?=
 =?utf-8?B?ZjFDRGlBQm4rVWxSUnhPL3N0d1p5dGdCbTdjS0hiMkRyRkhqNjFDTXpKcE12?=
 =?utf-8?B?NDUwVmZvYXNnM3BiaXhZbEkzMmdlMEYxQkttcnJJQ24ycFJSNW0zNitxZWF3?=
 =?utf-8?B?V0xKTzNYMHdYUlJZWmtrSnF3bkQ3RkNQUy9NZWlRRnhVdDBMVnIzaUlsZGJU?=
 =?utf-8?B?K29ELzdiQTY2d1hNTWdOUGg1YlhxSHlPTnY4VGF1Rlg5RWdFNXZlU0ZrYjhO?=
 =?utf-8?B?eVRHZmlZZFBURFRyQ2dTOGdjV2UrcVlYcU1hUTRSVmcrdjRVT2tNRGxwU1JE?=
 =?utf-8?B?NDRBQUR0MmZYdUl4MlNpSVhoaUkrUUJIMnczcWRja1RGRHlwZitBenQ1NU9v?=
 =?utf-8?B?STdpQzdXK2FyaGhDZ3Jtc2RaWjNVcitkYmQ2ZFU2NzBta0ZlOUk0Wi9GMTRG?=
 =?utf-8?B?ZXNaTVVPcWRLRXQ4SW5laWV6Q1BjY3h0UmpzQkdrc0xIK0RGWkdRM1JPdkl3?=
 =?utf-8?B?TXQ3YVY3UDJMcmxlRGdBQnMzOTNhNzNDVk9NRERkck9nZWg2dEpwYUowU1hk?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e03a7c52-6f6a-4db3-354d-08dd605a0776
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 05:03:14.6469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLMxpUtKCaDOJXWheARQJkz8fhDAZ5Ad43vPA51+eg23iXi35MG2gxQN9W4rxL5agAPWp9zL0Rsg8vfZVHdOwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6461
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

On Mon, Mar 10, 2025 at 09:22:50PM +0300, Dan Carpenter wrote:
> On Mon, Mar 10, 2025 at 12:56:46PM -0400, Rodrigo Vivi wrote:
> > On Mon, Mar 10, 2025 at 01:48:00PM +0300, Dan Carpenter wrote:
> > > The error handling assumes that vm_bind_ioctl_check_args() will
> > > initialize "bind_ops" but there are a couple early returns where that's
> > > not true.  Initialize "bind_ops" to NULL from the start.
> > 
> > It is not a couple, but only the one goto put_vm where this bind_ops
> > gets actually initialized, or not...
> > 
> 
> I'm on linux-next.  I'm not seeing the goto put_vm...  I think we're
> looking at different code.
> 
>   3063  static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>   3064                                      struct drm_xe_vm_bind *args,
>   3065                                      struct drm_xe_vm_bind_op **bind_ops)
>   3066  {
>   3067          int err;
>   3068          int i;
>   3069  
>   3070          if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
>   3071              XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>   3072                  return -EINVAL;
> 
> One.
> 
>   3073  
>   3074          if (XE_IOCTL_DBG(xe, args->extensions))
>   3075                  return -EINVAL;
> 
> Two.
> 
>   3076  
>   3077          if (args->num_binds > 1) {
>   3078                  u64 __user *bind_user =
>   3079                          u64_to_user_ptr(args->vector_of_binds);
>   3080  
>   3081                  *bind_ops = kvmalloc_array(args->num_binds,
> 
> Initialized.
> 
>   3082                                             sizeof(struct drm_xe_vm_bind_op),
>   3083                                             GFP_KERNEL | __GFP_ACCOUNT |
>   3084                                             __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>   3085                  if (!*bind_ops)
>   3086                          return args->num_binds > 1 ? -ENOBUFS : -ENOMEM;
>   3087  
>   3088                  err = __copy_from_user(*bind_ops, bind_user,
>   3089                                         sizeof(struct drm_xe_vm_bind_op) *
>   3090                                         args->num_binds);
>   3091                  if (XE_IOCTL_DBG(xe, err)) {
>   3092                          err = -EFAULT;
>   3093                          goto free_bind_ops;
>   3094                  }
>   3095          } else {
>   3096                  *bind_ops = &args->bind;
>   3097          }
> 
> > but perhaps the order in the exit is wrong and we should move the
> > kvfree(bind_ops) upper to the end of put_exec_queue?
> > 
> > Matt, thoughts on the order here?
> > 

Rodrigo – I think you are looking in the wrong spot in the code. Dan's
subsequent reply, I believe, explains the issue correctly, so I think
the patch is good.

> > Cc: Matthew Brost <matthew.brost@intel.com>
> 
> I feel like ideally vm_bind_ioctl_check_args() would clean up after
> itself on failure and, yes, it should be in reverse order from how
> it was allocated.
> 

This is a bit of goofy error handling/convention—perhaps it could be
cleaned up in a follow-up.

That said, this patch is correct. However, the 'Fixes' tag looks
wrong—it has been broken for a bit longer than the tagged patch. We can
fix it upon merge.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> regards,
> dan carpenter
> 
