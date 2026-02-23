Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIreA5eynGmxJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 21:03:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 657FE17CAD3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 21:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B09710E30E;
	Mon, 23 Feb 2026 20:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UwEbbk1B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011001.outbound.protection.outlook.com
 [40.93.194.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0176910E30F;
 Mon, 23 Feb 2026 20:03:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zw7+KIWygG8HALoYiL4ErTqcbOF1b5LgBj6feMmjKWYHwp/eh9hBrqhENUkeCUxK/pNbheXSXYsx1RBtj4YM5dyIKqW8q0lG80a8+do7q2xqs5yvhBYeHEG+cagCfV5fmuD+qITqxbjI7YLtIAT7ZELM2MPtdjqUY/iA3UZhb2ffQg5OJ/FYyaHddOUF2i1JDLNaQfohWZql6tyS+kePpV5znSAIiWYQwpRBxYe+McdUhrRKW10KIsUuHUpsB8/JcMEGLSBZCnYGDfuPYBiqFr01y+GYOmURkshHkz374iYJ9yhaZVxjANRB0U+BnDiD1C0p4Svvkm+8asgnAHGfCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4jggszBeiq/NImU8CtSYt6nQDXl3yp4iBh7F0dDpbQ=;
 b=sBM1512x8z3whRkNoRSEGE5MEQkD+mfdH8kmDcIOn8Sr0IHREZj8FLY48ZV0aUViGi/f/ddq9f6pyuR3vXCrmonnVfj3ZETPYlSF4c2UbAvpkjHSt6YL0/NciSew+h4ymcVuPOS5f9msSat5J6/V5rDG2/qsYiATZIJYj8qr0HOot38X3Q0OR/tfzzhJk349qJjbakJBNcH565WnQXmx0ylDNUdEahhD3vmSFDM1YRhY5QIPdVAlSoIdkSdDoyLkN8C87Y4qkEAVGe3H8aLZLaHCwaX3loui7C4Te9+XILpvtF0CV518PdoeaCdwVW3Vl+vSGb5CfR+21KTr5MlzBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4jggszBeiq/NImU8CtSYt6nQDXl3yp4iBh7F0dDpbQ=;
 b=UwEbbk1BivCmp2ZN5DX490ZTRHLr8vOXmynG0MnWB6EvMmrIix04shMXJpAXsL/t0/uhUoyJbhVd7K0UxlL2WuVhMU3quZiqmbUxJ2LEJNa1AlA+9t81pV4USrwD/wrwq2I2eqLslGtD+qutoQVhbXN/dYeq04ilWa3cxHTvS8s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7217.namprd12.prod.outlook.com (2603:10b6:930:5b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 20:03:22 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 20:03:22 +0000
Message-ID: <b089b5e8-7beb-4da0-85f7-98c3b905ec00@amd.com>
Date: Mon, 23 Feb 2026 21:03:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/selftests: Fix build after dma-fence locking
 rework
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20260223172553.1663749-1-matthew.brost@intel.com>
 <af898ec2-c373-45ce-b78d-2002f43e3dd9@amd.com>
 <aZyodmAdQgWRX95Z@lstrano-desk.jf.intel.com>
 <7b3811c5-1086-42a6-8324-b7ec927a74a5@amd.com>
 <aZysPArxnuxFU9e5@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aZysPArxnuxFU9e5@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9P222CA0028.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:408:10c::33) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7217:EE_
X-MS-Office365-Filtering-Correlation-Id: e43dd4e4-77bf-4e5f-551c-08de731698e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDJ3LzVadjhjalJ2VkRYaGtFa1NtWjI0OE9rWVdDNUhhNjN2Y1k3aHE3endw?=
 =?utf-8?B?RHZ0WHN2dDRiK0pjVDR2S1U5dWFuK2ZSc1ZoTU52QTVhWmtLVUpwaGV4anNp?=
 =?utf-8?B?WTRRNjN3QVNCdGY4WmhaODFRY1BNKzMwVjk2RklQTWV3Zk9uMGMzbHpZRlVv?=
 =?utf-8?B?V1k2cG5zSTA4ck9WYkVhT0FBSFkxcitFZEhYS1dKa0lQY1UxMGc1YzRFOGlI?=
 =?utf-8?B?dmZKQWpmbU1WTUE5K3ZySkxzUk5LVk9EUk5pendDaGRzYXdWcWNKK0Q0RCt4?=
 =?utf-8?B?SG12dlRmbUFoL1RwdTZ4RytBekZKaW13VTdZWkNySEh1TmNxRUdVZGd2Q1Jw?=
 =?utf-8?B?cFc1WWxsRTRRbGlrOHlGYXlNd1VHRVJpeDJNaVcwczc0S1hFR0hnUWZpdUk3?=
 =?utf-8?B?Q2JwcE41bkZuQ1JGNXdBZGw2bXVDMVF4Y1BPcGFWMTYreldabGR0L1REZUd3?=
 =?utf-8?B?UU5BTDZMZWxCRUVIaEZnaDNPTmcyZkZTZ0drQ250UGljOXdnMGJORTUvWmdz?=
 =?utf-8?B?R1pJME5rVDFJMlRabCtMVFd0TGxBZGJBTlowWk9hKzBxMzJFTm50QXVKc2ds?=
 =?utf-8?B?VVFuRlRVR0s0OFowaHE5dm1PSTZHSXFoWnNudFJ5SldONWx6M3RrZkFMKzhi?=
 =?utf-8?B?NWdkQnpmNC9MSEh1eTBwaDNwZXpVWlZNNzFueUw1NTZ1c3J3ak53R3dHa1JQ?=
 =?utf-8?B?K0dlRjZIWDZHVWZiZ3ZycllzUWlUTExlbzFyZXpvSmI0KzRDY3c3ckVmb2do?=
 =?utf-8?B?bW42WkRtR3FQTHdVZTJ4RUNxTno4bVJZNENhZGhkTytLWjhWenRrZWluN3Rj?=
 =?utf-8?B?VHFFZ0Z3bWtwMVFCWldEMEZlS2t5dFBQYnBrQ2tsSHV0c2oxTmUrTnlzemI4?=
 =?utf-8?B?V0szU05lcHhReW1FUlMzUkY2YnJ6bkwzbHZpMEFJeklGV1ZzUU9DOWJmeFEw?=
 =?utf-8?B?cWk0L3J1VGU1Zm45N3BzdlVueDFGMHpUSGJKcERsQzZ4Y3JhRHVxTGg0NnFO?=
 =?utf-8?B?bnRMR2Z3eFNaM251UlR6LzBpT0VIOENWOW5jc0Y4WWpCYlJ6RnRwSHFJYVFB?=
 =?utf-8?B?WUk2SUUwU1YvSjBJeWtUMGlERWQrNlhBSTd1cHBmdUJJSzNnbWc4VzZhaDBD?=
 =?utf-8?B?eFR0WktlZXJTTVY3VG10UFd5bjVxVFVhck9iTlBOcFJiMWRuUk9QdW1iTWM0?=
 =?utf-8?B?VmM3VkJoOE04aW5uSDFudCsyTGlNa1F3VksrREt1dkpkVmJ4c3JHQzdsZkN5?=
 =?utf-8?B?UjAyMG5LNzdrSDdWWE40YWpFRS9jVkg5cU12a3pTb09BRGRBZGR0aFMvMkdu?=
 =?utf-8?B?cHF3SkJlOWdsZG92Rld4RDhhOUtVOWl5UjJUWGFteUhrOHBacWt6NlNWbFBK?=
 =?utf-8?B?ek5QWlZQMHlERk90MjRzQ1lDNkVEeWQ1ak16dUlIMHBnVW5neTcrUDl6TzVU?=
 =?utf-8?B?OEc1eFJIUmZ1cXpkNWdXSFFHNHMvU3kvYVpweWQ3cGYyQVdZaDRRMm50Y0FI?=
 =?utf-8?B?RFhkZkpNdE5BL3lpSDNJaTA1ZFpPbWREOVlVc1hDL3h0aVBQMVFENldvRmo2?=
 =?utf-8?B?V1B0YUlNUjI0bmM1b3o0MEp2cm56RVFhYXp2ZGh3MHJNU2szWjYzSlliVVVO?=
 =?utf-8?B?dkZjL3RPWUpLQkxjNnJtZVcvUlJETlVmdFdORG5XSkV5N3JiRlBzOFhkZTZS?=
 =?utf-8?B?bUEwS2NrOUpWK2pzcTJvM0syeEh2RFkwMmowa3VYWFBIK0oyR1ZsSnZveVJT?=
 =?utf-8?B?UEtVUTRZc1JVWjA3eFpMb2c0SDhlcjIvMHRxR2t0dTkvTVdhTHUxL1NhM0FQ?=
 =?utf-8?B?Q1RoUmZoVFF0VHVhN1hCSWh3SWl2Ry9JYjk1cE9hdDlxQ3F0YW5ZUG1QR0hG?=
 =?utf-8?B?K0c1c3hxNEZySlR4R0doNjZXTW4vQ0VtaE1xSWQzc2FrcEZzeG9UdWNZSjVs?=
 =?utf-8?B?WHl3QnZOaVplV2p2dUNZR0liT0xKY0J5aVJXYzlnQnhRMlFnejJRNUt6U0pv?=
 =?utf-8?B?cUtSR0JGR2pTc2dMeDFBdDdEMi9MU3V6bWgrclpxN1F3WHJsZXVoVzlNNXZa?=
 =?utf-8?Q?8EpmGa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXBDeW84OFJ0aW5PS0l4LzdYUXE4VXFiSTYyaE5YQTVUVCtabGpCcTFDYTZa?=
 =?utf-8?B?bENmRDlqbDJYSWRjbmNnektGV3R3cDR1TnNZcURRZTNXOHlUZnVZUWxDY2hX?=
 =?utf-8?B?Wm1WU3haSUoyNm9HMzVtSE1xdDg3TzVEL1dZSmJhb2I3bkhrNWNFRllENWVF?=
 =?utf-8?B?K1J4dCtkV0VXWTNOSmYvR0pURHpJSGZGeDZEODRXalhGNkdjb0VYRzFzZWNG?=
 =?utf-8?B?OFRXZ0FkVU0xSnJvMlQrd1JFMlI4dVovaU5Ga2JZZUtUaS95UXAvLzRjM3NU?=
 =?utf-8?B?K1Eyc3JyUTdmbC9meEtBUWRiTzBvS3hzUFRPMkdMY2w3K051UGMySWtPSStC?=
 =?utf-8?B?QkhqR3FuWVljVVEycDBzdjVSM1gvSmFxSFMxMmx0dFI2cy9sbm95OE5YaU9O?=
 =?utf-8?B?MytqZzFDZkFKLzBnWml0Zmd5UVR1cWZJOThIbWRRL3pBSjFtUk5sQ0FyUUlF?=
 =?utf-8?B?QVBNSUF3Z2dvZGxEMjlXQXpFaFc4Y1NSMG4wMTNmWUtQVjdGb0U0TVJBWkVE?=
 =?utf-8?B?cTFuU2FDRXcrNk02WVQ1OTErcWlyTG42N1MwbXEvV2tDVFF5WkpvZnZGbUpm?=
 =?utf-8?B?NHNmdmRobDFyVWsxWllsUWpOT2tucUMvZnExVytqZzIyQytINVNJWFNLbkxh?=
 =?utf-8?B?enlyQjNPWCt5bzdEWHByeWZoMnpjdjNMUnZlSTBld3NhQWVJTjB1V1MwU3Zv?=
 =?utf-8?B?TEJTdkVTNlRWWUxkd0NrWGttTVVuWEFIZXY5OTRRNWFnRWhyL0ttUzVmWExx?=
 =?utf-8?B?TXJOa3VsWVZtalVQVmhqZ3dlWk54RXhHSSsvaFB5UDJrOFVZQkxMRWJ3U0ZY?=
 =?utf-8?B?SHpYclUwandYOVhGcldIdzEyZytxL0w4cmErWlVWTTNFcFF0TEJoNk1XT0Ir?=
 =?utf-8?B?K2Z6OE5qMWdoUmg2VEpXOFhtczVxVU9TZHRJTlByZWFiZGExN29UV0JiM2JE?=
 =?utf-8?B?RGw3Uk5kNVBZRG56RGJwUUdOOWo2cUFPMng3ZVl2UU90MWF1eXUzQWpEdDUr?=
 =?utf-8?B?czhhdVorYytvUjl3K3hLNG1JS1UxRE9FMGRJenk4QlJpbmk5MU8wOW5IdnFO?=
 =?utf-8?B?SXBjVlk4Z3YvbU11UU93RHIvV2ttNklEc2tub0tvak5RZ0Y5K0R2alNvSFh3?=
 =?utf-8?B?NDBtMmN2TGs0QVRnOVNEd08vSG1SNE80Z1hteE5HajJUWHk1MWV0Z1lEU3Vh?=
 =?utf-8?B?OHREbWpDSldjaUZIbEJzcnNybGRiWVhOVFQ1MmNWYnkwUzBSVFFaVElhYWRz?=
 =?utf-8?B?VWVoVzVrdXBYcmJwQzY2STNRNlZlYngzQzA0bEtEMFM5c2wxU2dmcC9YbExz?=
 =?utf-8?B?ZUtmYUhkejZVOWMwQkxDNmRSWUJkVDYzY3dHS0lqNThHOXR4MnRIMWtEekx5?=
 =?utf-8?B?YzhEUzE4MFhQQUZrRzZkRVhjQmM0c3MwOU95Wjg2VTZiZ21PR0hSQ1M4Vnhk?=
 =?utf-8?B?d3JpRGZ4d3l0RHFyWk9OVFpvRWFGamNSVjBLL3NZME8rbUFjK3NDRWpVSDlj?=
 =?utf-8?B?QXc2ekE1REtQUUpURGdWV2lXKzNlOWdDc20rTlJlbUJ3MzBCYzVwMnNTdW9h?=
 =?utf-8?B?Ky9CUHRwUFB5b0Rid29DczR1d0x2eFA0eUExM1hPVlB6Q0FOQjBMRVpjYWlr?=
 =?utf-8?B?ZnYrTkZ1cEdYdktyd3RRbGRDdzNsYlF3aU0vRkFQODZvYThnM0poeHhiY3or?=
 =?utf-8?B?TXpqRFFJWGgxNnZPcVpEd3A0TXNxWXg0MUZBMzRoQnBPb1dzTVF4aFVPUnJ6?=
 =?utf-8?B?NHE2UDR5QngvTE1wTkhNdy9IMnZMdXpWL21oZFNqSjV3WTBEV2xkY3BXREpY?=
 =?utf-8?B?cjgxbkh3TjB5QUxHYmNqRXQwTStsVDAvaWxNdE5ncENIb3NPOVphd0xlM0xj?=
 =?utf-8?B?U3RROGR0dyt6cjZLTlJrRjRKZldEd0ZYcHpaQjd3VkRXRXBxYlBIT1BYM1Bk?=
 =?utf-8?B?a0tkOUdnU1hMcTFHQzloY2hlcmlUNnBKM2F5ZUtoWWNSRVlSWFd2b29KWVBY?=
 =?utf-8?B?ZGYrRlUxNFlWeEN2ZWUrK1JpZ2tPQTJvTjE5SXFHdHUxZm03RWNtVUdQWWRx?=
 =?utf-8?B?dVpBeHZNRkVmZDhaUElpMTd2ZFgwcXNXNEtIVXVTR3J1M0t0c2JkZUhJT1Vu?=
 =?utf-8?B?MkpYV2Nld0FXd2tHNThEWmJwVHJPc1JGSmhJMlA3d2NZUWtlZjZaR3JMY0dL?=
 =?utf-8?B?S0F4VGN0cVY3Mmk1Y0ErQTMrbG8zYUo5UGNDRWh6VHFxcWhWWkcvRkVWdzlO?=
 =?utf-8?B?SE4vVUVySm9iRG8xL0g1bnI3UGtsTEt2bk5nOFpBN0NvTU51U2RUSW1PWERo?=
 =?utf-8?Q?NaxdYLhOnRFGVISBpr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e43dd4e4-77bf-4e5f-551c-08de731698e0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 20:03:22.6035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8D/QzUSoqgeoqtM9rRGL7pwla6cwuLnnlDNH8gQZh+HIs0t+Rtm5W0cXbcwO9I3Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7217
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,01.org:url];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 657FE17CAD3
X-Rspamd-Action: no action

On 2/23/26 20:36, Matthew Brost wrote:
> On Mon, Feb 23, 2026 at 08:33:05PM +0100, Christian König wrote:
>> On 2/23/26 20:20, Matthew Brost wrote:
>>> On Mon, Feb 23, 2026 at 08:13:34PM +0100, Christian König wrote:
>>>> On 2/23/26 18:25, Matthew Brost wrote:
>>>>> The i915_active selftest no longer builds after the dma-fence locking
>>>>> rework because it directly accessed the fence’s spinlock. The helper
>>>>> dma_fence_spinlock() must now be used to obtain the spinlock. Update the
>>>>> selftest to use dma_fence_spinlock() accordingly.
>>>>>
>>>>> Fixes: 1f32f310a13c ("dma-buf: inline spinlock for fence protection v5")
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>
>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>
>>>> Thanks for the patch and sorry for the noise, just one more question below.
>>>>
>>>>> ---
>>>>>  drivers/gpu/drm/i915/selftests/i915_active.c | 4 ++--
>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/drm/i915/selftests/i915_active.c
>>>>> index 52345073b409..9fea2fabeac4 100644
>>>>> --- a/drivers/gpu/drm/i915/selftests/i915_active.c
>>>>> +++ b/drivers/gpu/drm/i915/selftests/i915_active.c
>>>>> @@ -323,9 +323,9 @@ static void active_flush(struct i915_active *ref,
>>>>>  	if (!fence)
>>>>>  		return;
>>>>>  
>>>>> -	spin_lock_irq(fence->lock);
>>>>> +	spin_lock_irq(dma_fence_spinlock(fence));
>>>>
>>>> Is it guaranteed that this is called from interrupt context? E.g. why is spin_lock_irq() instead of spin_lock_irqsafe() used here?
>>>>
>>>
>>> Idk, this i915 stuff I’ve long intentionally tried to forget to avoid nightmares.
>>>
>>>> That's basically the reason why I missed this.
>>>>
>>>
>>> Also, please include the intel-xe list for CI — that will catch issues as well.
>>>
>>> We’re making it a bit further now, but we’re hitting a lockdep splat [1].
>>
>> ^^ that actually looks like a bug in dma_fence_chain_enable_signaling() which was there before the patch set and now just get bubbled up because lockdep can finally check on it.
>>
>> Just reverting "dma-buf: use inline lock for the dma-fence-chain" should silence that again, but it is clearly not the right fix.
>>
> 
> Ah, ok. Well let's just figure this out properly.

That is a bit of wider change, let's just revert that one for now.

> 
>>> I can dig into it now; hopefully it’s an easy fix. If not, I may ask for
>>> a revert. Give me an hour or so to look into it and I’ll report back.
>>> But again, please include the intel-xe list for CI on risky DRM common
>>> or dma-buf patches — if the patches apply to drm-tip, CI will run. You
>>> should have permission to trigger this; I believe all AMD emails do.
>>
>> I did that on an older version of the patch set but never got a report back. My assumption was that it's working but could be that this actually never ran.
>>
> 
> Got a link? I working on recreating this now on my dev box. Any hints to
> speed up verifying a fix would be helpful.

I would need to dig that up as well. IIRC that was one of the first versions with your XE patches still in the set.

I stopped CCing driver specific lists after dropping driver patches, that was probably a mistake.

Anyway lesson learned (again).

Christian.

> 
> Matt
> 
>> Regards,
>> Christian.
>>
>>>
>>> Matt  
>>>
>>> [1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-ptl-1/igt@xe_compute@compute-square.html
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>  	__list_del_entry(&active->cb.node);
>>>>> -	spin_unlock_irq(fence->lock); /* serialise with fence->cb_list */
>>>>> +	spin_unlock_irq(dma_fence_spinlock(fence)); /* serialise with fence->cb_list */
>>>>>  	atomic_dec(&ref->count);
>>>>>  
>>>>>  	GEM_BUG_ON(!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags));
>>>>
>>

