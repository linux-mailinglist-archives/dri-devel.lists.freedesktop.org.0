Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNpUM2K8lmntlAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:31:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C70415CAC5
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B3210E274;
	Thu, 19 Feb 2026 07:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UxRWxGwv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010063.outbound.protection.outlook.com [52.101.46.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5DE10E274;
 Thu, 19 Feb 2026 07:31:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKEttdDdxtCsUEtl3wDKoCbjG73EtxTugxsqiQyaqImRGDkGOmesUDJ3kPRb0lrXz/33jTYO3drJio1AfKnFu7TVhZmHQ8AJmtEFsjGRStYPidppbuwtnkE9nzRhkVJXdqOcvHWZux8yk5dx1PJtYerJPasFISugMzCWmg77+MHQRtKTxwcoLbbI1R8Dj+2f7SPlPaq3OAfw090R8USU/b/tpQcmA8s/kcj8Nkq7AtQs3OFAKnpwSq/QR4VutFnYvmi6pxl1AuJjvMZ/pZocEfhy1GdOvt3Srw9GwlvxVT4wSNdVxMzmhWTTGfvspNXCOXgcldveYCzOxBhByqwBmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUu9grxFLKIwZ9I1TWWCHhyKcKz5WEa1cnEoHn2v9zs=;
 b=CPZ/RGCsZS9PteN0nMGgXyF9+YIoby9ioDGyUgFvqdkH8LA5x0HKbE1dLNhNmVpnl06M3bkIj9jNly+bCtSQjjcIlIJ4G53luX51UI6EmlZPxJ2k+xrQeG8CrhAXNwcvThlmVFtylAWf4IB4mpOPPE5wvANlEizOAug2ufDAP7eKZ6/QoINhGAfsK5SGHB64W9eQHaiPWyWODrpuKWidh32IUueW4w6fuNNkd4tOSjWsUND1EEXQoJt7Cr5Eo4pNO1K/1nha0sBAUhpn2e3qNSQMAYSA6F0tDPkOwN0VSP+R3e8/JWxBFff6Xyod4g4LQ7BgxxjoqrNaRe7XavHi6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUu9grxFLKIwZ9I1TWWCHhyKcKz5WEa1cnEoHn2v9zs=;
 b=UxRWxGwvRgUPcF1CNxSPVS+8F+FnZmSiLB85rxXmUdzr+Kqhtn4YQumprRXRxmvaS86T3mE/rPqMO5aeW0Rm8abn7rJR5c9bdcOm2qOyc1RhWiPAOUCtl0yla9MgyD5TdK5wzKcYDH7k5BEJOQVHaRMuAgHIeuJ+MFIq/q51LDo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB4326.namprd12.prod.outlook.com (2603:10b6:610:af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 07:31:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.008; Thu, 19 Feb 2026
 07:31:38 +0000
Message-ID: <905d7832-ff56-4446-990f-fb3e83807ede@amd.com>
Date: Thu, 19 Feb 2026 08:31:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/2] drm/syncobj: Add DRM_IOCTL_SYNCOBJ_QUERY_ERROR
 to query fence error status
To: Yicong Hui <yiconghui@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 wayland-devel@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
References: <20260213120836.81283-1-yiconghui@gmail.com>
 <20260213120836.81283-2-yiconghui@gmail.com>
 <f1100dad-b9ff-4ba2-987c-4d5cb4c1122c@amd.com>
 <bc491356-6db4-4466-ab0f-2f2a47f4da77@mailbox.org>
 <0e7c3ee9-54b1-4ecc-b960-6e2fda6ab3ae@amd.com>
 <e750ca62-8a2e-47e2-b154-c7cdaf5e270e@mailbox.org>
 <96e42cb2-c5eb-4f2b-bb52-faea1c91c6c9@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <96e42cb2-c5eb-4f2b-bb52-faea1c91c6c9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0436.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB4326:EE_
X-MS-Office365-Filtering-Correlation-Id: fc8387c7-796e-4423-eeb8-08de6f88eaeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2hkZDl2Q0RrQllLRjBTclhzR3pqRktMUDJZVXlTQ0Q1UnNwOElicXhiRHRq?=
 =?utf-8?B?QXdvZ2NtYzY2ZzI2ZTNqZVNCTDVNWDVmY3VuT3VxZU9jNyttWFJKbWlFNUtt?=
 =?utf-8?B?RUN0UW1GN3BVV0VjcW1Pa2RlaUFqRHNqSk4wY3MwWkVrWnNKRnBpMTN6S0JK?=
 =?utf-8?B?K3dLREl5WkdzWlNFb1hDK0VMOVU0d00xM1F5NXJBUmNIYmVHTGJjdWNBTjlz?=
 =?utf-8?B?WEtKK0ZNSkdhNWw3ejlRUHJ0U1RZZGdQZm5hMXVMVXZwZFNHcGZVcmUrbWZv?=
 =?utf-8?B?MWpHUFVoS1JIZmNKUVp6dHBaU0JLTlBkejRoSXRuMnFDV1h1dmZ2VnRRYktI?=
 =?utf-8?B?S2tRdzJqK1JKSThvb2FVTzlNL2VhdkpCdlBPZ2REQzJCSU5Ec1Y1UDUzZDBs?=
 =?utf-8?B?YnRLbnFtcG9QWkp6Q0VjOEphVis5QmVQYW9KN2x5QjJZOWU0bGpNNmwvL3VO?=
 =?utf-8?B?WWJobWNQUlRXb2RaazRXMmlCVlYvVFZ1MFVkYmhlNHc1RVB3Z0h3YUYxbWor?=
 =?utf-8?B?R0hVVnNaeXRQQlh2blF4SldJQWd5NjNNR1RIVnBLZ0NxQlkwQ1FVdTRvaWhQ?=
 =?utf-8?B?d0VJa3hLeDZuNGE1bFNnWWdHWnQ5V3h4ZE02N3EzT05WdTZ4K1d4eUhnY2N2?=
 =?utf-8?B?cUJNZmZJbDBHSkJGZi9sakFYRjMwTEk0cUV5ZDBOUWdDTkdSODVFMVpXVnh2?=
 =?utf-8?B?US8yaUZyL1gzOVFGYjhSdTN3RzdIRENqWXAyK2I0VjZtZThDTDN0Q0RvNC9O?=
 =?utf-8?B?bUEvTnd4UW9ZVkUrMEM4bUlTaHhnemlYK09XVWgrci9rMGJ6UjBWQnJ1K3dD?=
 =?utf-8?B?R0ptT2dvdzh6Syt0cEl3U0dKcUlMamhRdXc1ajNRR3hqbXQ2S2ZOdzE1WUF4?=
 =?utf-8?B?RFUzengxU3VyUDlWOFlNaGNsM1NQYWc3ZGgzc0xJRURqTmxpTGdjcnRtd3Rz?=
 =?utf-8?B?ODVYc0g1b3pEbDlVK2JRUk9sQVVvQ3lGN1RwT1FzY0FUSXcrVElNbzg2cmZV?=
 =?utf-8?B?WGNaWngzd2VBcTFJSUErSnNVUE83dko1Umd2WVdCaUN5bFlwYWEwamUrbHB6?=
 =?utf-8?B?RUU5YmFnMEQ5Nlg2bHorbVlJUUNncjF0NkxGNStjdlp4M2pBZUFvY3dTUnlq?=
 =?utf-8?B?bWl6Q1Vyc1A0dzBOd1hvTUdXcGVISnF4aHZkN2JXNWRqakFyS0ZEbkFnczFH?=
 =?utf-8?B?MlcyVXBEY1NVT2lnUHlkT1VZVS9jcWxLMGtFUENJRGlXVnRpODlzbmxuQWlQ?=
 =?utf-8?B?bkQwcklKZGQvM3kzVFp3dUdtd2dYb0lnRGE4MWNJR1VKZm9RZUc4OTFuZmx3?=
 =?utf-8?B?dkxISlFmR016bWJmNnU2THdjS1FNbFgzK0Z1WC9FOEorNmNVVDlUMXkzU2pE?=
 =?utf-8?B?T1BDd0d1OFlXeWNPdjBSdHBKdExmRFQ5Wm5DWmxQQ3ZvODM4NldvWDgxM0VB?=
 =?utf-8?B?cnJRZGwwVHJOa0pJMEFQbVRKY2tkWHYwUnpQaDNBNC9VZG5JZ0dLTmdOc0Rk?=
 =?utf-8?B?dXExNWpkc1daUUd5V2k4RlBTTnh0aU8yTXI5L1hoeWUwUW9DekxqWmx6Vzhq?=
 =?utf-8?B?czFWNnpPeDNXeU50UStCbm40SlVsNllxNGZSUXpPRlRIMldyWmJubEN6SVN5?=
 =?utf-8?B?V3F6Y1ZXMmI1VmliUHVKckQzQi9MSjFIOWtaMTZ1YmJFUDd5QXE5bEJLVkI5?=
 =?utf-8?B?WjVCQXpabVVCTjdvOVZKa3dLMGRLUi9XY01Cc2hoOVprYkppSiszNU9mOGtO?=
 =?utf-8?B?ZGVkeWlaYnBjMlVRVHlPaGZPR0djTW01NUh1TDFldzU2NUZpa0VPbWRwdWpB?=
 =?utf-8?B?bDRjV091dDFhZjNybFB6UkdtemZqU0Z1V3piVnQydEg2K1YyNUJXSGNzVy9k?=
 =?utf-8?B?Y0RNSkZ6bTV4TkJ2RCswSmxNQWxlYmlqeFNrK0twWFAxUDRCTTlDajVNUVFZ?=
 =?utf-8?B?T0dRcmU5NkdxUGRYZnNRTmhuOTVreDR2VTlKcmNzYzc5emZPME1IbnR6WEJP?=
 =?utf-8?B?QmMvRVMzQzJhS0ovQXVqdFVDMWlLRHJ4QWVVaS83K3E2UmFqYWJFM3U3N0xB?=
 =?utf-8?B?WmQrYWd6YUJydEVzdi95cDdnOFNjVFlQMnhKaVRZTkFnc1paaWlhdmhaMFY0?=
 =?utf-8?Q?DrUE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eE1JMHB5TmZsK29mdzJzQWxIOUpSemtvWldLNWZnSEdGV1Qydk5CZUV2bjJC?=
 =?utf-8?B?OHV1Ui9XaStGYjRIbVRESW13WUU0OEEvY3JyMkYrdUUwUUszQThTUzRkeWJq?=
 =?utf-8?B?TE5SNC8xNGYvYzZqNEpOQlBtOEtIUnltTmNsdjZpWkRLcXNET0thOUZ1ZDFF?=
 =?utf-8?B?NEtLNmRQb0JqUUxMeTdRVVFMK3RxZHoxTGVKRHAyOXlzMko0ajRWaWFFbHpT?=
 =?utf-8?B?T2x3VE1FcEpKMjZEaEZnOGR4MEMwN1Q4N0llbDdjMitLY2dIMGVRYzRFMkxQ?=
 =?utf-8?B?OHljV3dJdWJXcE9DSzZGbytWWEFpVzFPUUZERldxUG03TXpLQXo0d1B6WEVt?=
 =?utf-8?B?ekMwWGZLZjV4dFN0Z3c0b3dWWW5jWWR5dnEvZFVKcGxFMFJSbGRRY2ZTUU9R?=
 =?utf-8?B?b3dTajYyWVNBZGV3Z0pNb0JYdFBLc0J4YnhzeUVtcFl2ZWNQN2wyazlVK2hD?=
 =?utf-8?B?b3JrWjJ0LzdzVW1YSjVPUjc2clUxOWlTVlJkdnp5ck5jTHlxSUwrUmgwKzBK?=
 =?utf-8?B?TTQrZW5RNVh6SENWUFRGcFQya3NQUGQ1L25jL0YwSXRmSmMrV1l2bElaZTJL?=
 =?utf-8?B?R2lPK2ZYTXYrSVdlenVWUzJ5ZVBMdkJTenA5aFpHbnVOc0tjV1E5R2h3UU5s?=
 =?utf-8?B?WittVHZvNVlOMytoWm1hUEdCSVU0L09xZktTS0pJcHdPMnpnekRhN3hmTFJm?=
 =?utf-8?B?TFcxU1hkaG9YR0FCRVNINUROSG81bW8veGoyQ05IOFlRQVV6dG1aUEs0M0h5?=
 =?utf-8?B?Ty9YcUE3UHlQb0JCcUR6aWpuZnBhOWNjbE9aZGh0WlFOQnVTazQ3a3B0WG1E?=
 =?utf-8?B?SDFvUTQ0T002UmtVclpxVTJ0Z1VFZWtnY2FlYlJacXpFd0t6ZUIrNERYNXNz?=
 =?utf-8?B?Mmd1OTJwd0pCUWdXdERmLzVia3h2b2dsR044K0N3cVJTMDJ4Rkc2eTliY2gr?=
 =?utf-8?B?WXZxcFdCWEJsM2dBZmwzMXVQOEg3RlZzMnI4clJISDlmRnduTW9aS2RHaWhY?=
 =?utf-8?B?OUZzQzN3cFhoa0FzUjYyTTRHa3BlNmt3L1R3RFdiRzVtYWdwbENzb3pMYVNq?=
 =?utf-8?B?M2kxVkpHSGw3blVmWk5wY1dxa0lBNnZtdHRQMEZGUmlqVlZXWkRpWlZZY0k2?=
 =?utf-8?B?V041U3hublRsd2RPVXQzMmFmS2crZllEcVVSSFBsK3IxQm5Wa1U2ZW5FUDcv?=
 =?utf-8?B?T0JCUjN0c2NnRzNhSXJWM3UxUm9VY3ZCSUhYRjdKSDBOYzNlZzNiMUtwckVO?=
 =?utf-8?B?WGs5SEREUlpjWnNXWUNXUWtOTmZjNUtBNWZPbkJVYmgrMnNQeU9JYkNxc3Z6?=
 =?utf-8?B?U2wwS3QrS1RQM0V2dkRUKzl4MzFaYmp1TXFKSzhhbTZJTndvcldTc0tLSGJt?=
 =?utf-8?B?UlBDSlBZYUU0a2RkWTY1eUZYQ2xGTFdLR2svK1F1bjROUmwveXh2MmgrZFZy?=
 =?utf-8?B?U3Z5bityYzNYT2VqNWVIdnFnanRtdVlaZWRJQlJ3emMwSWpjOVJXVy8rMUta?=
 =?utf-8?B?cWxzZnpYT3FXY21UM3IxSUZKY1U0WGo2dXZ1dStKYlQwRm5NcitZajlWa0gr?=
 =?utf-8?B?YXRBa1VMVkRabllFTHRzYkZpODQ0UW1xSWgvY2orNmJMKzVKcHhKalNNeHIx?=
 =?utf-8?B?K2dZRHFjdGpNS2IvUzRLaVUwWGpKdWsxVGExQjNhVnNkSW4yNGdoTmZWc0JL?=
 =?utf-8?B?RFczQWx5V1ZhL05pWC9oRjNlMWJwU2Z3QUdNUFFpUll0UTVPQmdVSjZOSXFU?=
 =?utf-8?B?OTJHTkZYOVdhRC9aUXJKQU0zaVk1QkxjUFVEZ3hPam1SNmxzY3h6MTBvODBN?=
 =?utf-8?B?WFM4bU8rY2hyWE5NZVVwVENpV3JKMG1zUjZ6TndvUDFjemNRWGdDcGZQWld1?=
 =?utf-8?B?NWREZUgwOHJtcVREWUg2QXZpQVl5NXJma1V4eXVLWUhMVm01ei9Sd3pKaUR3?=
 =?utf-8?B?MXg4MUkzWmxUSW42am40UzZIT2ttTk9WMmpPa2g5SUpPcDBZUEpXOEpKdncy?=
 =?utf-8?B?aUx2SmlQM3FkZmFrbXZZam9tTTZDUEx3ZURHWE9hc0FNVEFaZkY4U2tHZjJo?=
 =?utf-8?B?eWZqMnJubkJkd0FVbWxBVUFBdW9YSlpIZm55V1VBeXRsRW5XdldDcU40Tlp5?=
 =?utf-8?B?YTV2MXQ4eG1IT3d2RnVzSjlLLzNNOExYL0hEeDg5anhTVjhma29DS1R4RXVz?=
 =?utf-8?B?YlRBVjNGSXhqa09VNGY2bHhzb2dSZmtJeFFUL3BnaVBFbmJwNkVqTDI5SHl0?=
 =?utf-8?B?Q1VONmFBdStyeWZMSkpBSU11Q1M1UVFoZkJ1R0plaFowTW9aYnBnY3NkdCtm?=
 =?utf-8?Q?T4PqzjUwzY4rssPfu4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8387c7-796e-4423-eeb8-08de6f88eaeb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 07:31:38.3765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2slDXEA9aR/BauamBh/pP2lxFHoIzkAPJZ3+uSKqHifhJoyYuCEWINv1pfqk3xY3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4326
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,mailbox.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3C70415CAC5
X-Rspamd-Action: no action

On 2/19/26 01:15, Yicong Hui wrote:
>> Instead add some additional flag to DRM_SYNCOBJ_WAIT_FLAGS_* so that the IOCTL aborts the wait and returns an error as soon as it sees any fence with an error.
> 
>> Another DRM_SYNCOBJ_QUERY_FLAGS_* is potentially also useful to query the error on a number of drm_syncobjs at the same time.
> 
>> Using a new DRM_SYNCOBJ_QUERY_FLAGS_ERROR on all signaled syncobj as separate way to query if there was an error should work for you in the meantime?
> 
>> @Yicong any more questions or do you got the idea?
> 
> So to confirm, I should implement a flag DRM_SYNCOBJ_WAIT_FLAGS_ERROR which would make the DRM_IOCTL_SYNCOBJ_WAIT ioctl just wait until any fence returns an error, then return the error code of that syncobj/fence's first error, and then return 0 if everything completes without any errors?

Correct, yes. I mean the name of the flag can probably be improved, my suggestion is DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR, but in general you seem to got the idea.

> and add flag DRM_SYNCOBJ_QUERY_FLAGS_ERROR which would make the DRM_IOCTL_SYNCOBJ_QUERY ioctl fill out the points array with the error codes of each syncobj instead of the latest timeline point? Should it leave the entry as 0 for syncobjs with no error or leave it as it would be without the flag? And if it has multiple fences with errors it should just return the latest error right?

Well I would fill in the handles array with the error codes, this way you can return both the signaled point as well as the error at the same time. For this you would just need to document very clearly that the handles array now has a double functionality.

I think it is sufficient to return the first error found. We don't need to make it to complicated.

>> Good point, poll() has a POLLERR flag for that but I have no idea if eventfd supports that in any way. So potentially doable as well but a bit more work.
> Okay, that sounds like somewhere I could potentially implement similar functionality for poll() in a follow-up patch later in the future

Yeah, agree. That is a nice to have functionality to allow mutter to avoid an extra IOCTL to check for errors in the most common case, but it is certainly a second step and a bit more complicated than the initial task.

Regards,
Christian.

> 
> Thank you!
> - Yicong
>  

