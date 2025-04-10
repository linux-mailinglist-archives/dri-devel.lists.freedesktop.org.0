Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D97DCA8433A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 14:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443F210E991;
	Thu, 10 Apr 2025 12:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zqMyrCMy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C2310E991;
 Thu, 10 Apr 2025 12:35:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8JtGeFQ3RNIAya+3Q/wI6or2trBS8mFzp2KNUQdjVzYHIVamMI64+9aQCU1eA35S3v4WZZ1hmS1dKbdWBIj+SKdJHrjoYC0Ev4TfkAaAFTh/q1zOBF657KgVStdL6LscUSlTiBNIIoAx9LOejdSaq9yVsWmMcRppsErgQz8+HUeqlBAdH0T9wuzOQbhrOt1XDAmeIknl1isuIYF1HvsZUlwGwCgGq6oDPXuc0J+zQqnCnYce4Xi1QkdAHRk1muIe/2JlRPSY1bVlEPcNRt3/ZvpYlVuyjKzOAvZ7Gat0SmfCeRGgiZ74TsUDaJNMoSLwDvml10GOPArzQegPw42Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7YelMjTmq2eexOBMVm7VwCnzb7hpAoSMU+95dmYGTo=;
 b=T41dpNxEkcenFv0Yx+pkmT1TJfIcSuJOvym1BlQ7TiFx8ci37VZpPtmazuavEfwleWsGLqYKIrrBAWFwkNIzBI0X66OrSIUJ4IPKQGPTuuj6iIHwTRIQsAJtJRX6rPyEr+yXIhDfVbdd7JiB3OZa8FCGGIUPZoQ/Dy2s1EQG0UenvPhe+571id3uLqsJzJmLaDO6qljHDx91ZsPcjt9xUusYbvF7Nn/tUA1dQdQyJFW4seb7nXBXrh4a58JNB7Mnf+vv3KAdj0uEs0XogY8GVB/6wtiiooYQuMAHCr/ZGTvjSE1IZEUR+AzGuboKILylIBZQxXS5bS0k51iyoGSubA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7YelMjTmq2eexOBMVm7VwCnzb7hpAoSMU+95dmYGTo=;
 b=zqMyrCMyahQ3l5z3XG/qMvYXSwv0AVRv4iiOzB58LYGCu/h5/FGBwIPJF/zj9NM0znK4pUpdHEOQ52L2KRC4N1chi8V5wWPrZxo2wojZzBWsKIIfDIvDT+JiioKdSCrVjM3G3dg4WzqFtDuGm8DxL2mXgv6fSkjTD59i5hUse0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4224.namprd12.prod.outlook.com (2603:10b6:208:1dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 12:35:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 12:35:50 +0000
Message-ID: <e24e5e05-5ffd-440f-b9d9-8a0f792cc7c8@amd.com>
Date: Thu, 10 Apr 2025 14:35:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/lima: implement the file flush callback
To: Qiang Yu <yuq825@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250408154637.1637082-1-nunes.erico@gmail.com>
 <20250408154637.1637082-2-nunes.erico@gmail.com>
 <CAKGbVbt-Cfp_D3WH3o1Y=UUQzf-sM0uikZXO1MFRxt2P72gjJg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKGbVbt-Cfp_D3WH3o1Y=UUQzf-sM0uikZXO1MFRxt2P72gjJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0282.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4224:EE_
X-MS-Office365-Filtering-Correlation-Id: 5058f275-e260-4056-1edb-08dd782c39bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUc1eHcydzBJL3FqZTdFeE00cUluWlRsNWdRMzczOUFRdjJTalA5TUlhbnM1?=
 =?utf-8?B?dm1ka25ya1N5cTNjVnh5U0hPTURaWnh6M3pOWnc5Y1lnVWRNNmlDTTB6c2NB?=
 =?utf-8?B?QWtsZGpoYjVzL1p1QTNLbURxcWRhU1JYTjBxQXUxZUw1NE94RnIrRWYraGJ0?=
 =?utf-8?B?WGU4OWpjeHpyTE0wd3RyN2pvdU5KMWIwSWJ3NjdFM2xycXB4LzJPK1gzS0M4?=
 =?utf-8?B?ZGdIVU42QlE0dFNTMWNuTjJMSlpNandUNXBYVHdHZXBqbHhNZjd2OXl6a1F5?=
 =?utf-8?B?cVFlaTVmd2tveTlrdm9BV21kV05yWklHWS94WVBvY1J5M1IxdFMzczVWSmpG?=
 =?utf-8?B?MytzbVQvVmxBOEtlU29PMXJhVG1ob3Q0NnUya0Z6MHdmb2NPdkNJYzk1QmRv?=
 =?utf-8?B?a2VtcTh5aStqTGpwNXRSSFJCR2p1TmcvS1pUendLSlVnWjQ4ZDhyWkxyT0hP?=
 =?utf-8?B?b0RkcUh5aVNZR285OENNb1pQc3d5aVRSS3dROERzTmVKZFJIWTZpQTFrdnRv?=
 =?utf-8?B?TEo3ZklNalBpekpSdU0xUEV2aHFnL0ZFMTZLM2hqbmJFeHdMVmdZeENOZVFh?=
 =?utf-8?B?NGFscjB6QWNPeGMrYmlvZ2dxRnVJNE1WR2g4QkJjMVNWVVR6Y0owZVBEbGZh?=
 =?utf-8?B?SzlmYWZHbHlqcG5tRk5DVitReXhLN1VNOG9Ta2RHcUhoTE9pYmpMZDdlSGxZ?=
 =?utf-8?B?SU93NExVRWlSU0NsTWpGSDlMajZXalhRdEFQUk13Vk9lcEJmZFRCZUExUzgr?=
 =?utf-8?B?T1VtZXh1dTVlTXJ6bmpHN3NyVDFPV0JiZ1dvc2I5RHZhY3hzelI3Y2pvTlNP?=
 =?utf-8?B?c1Q0cjNBdGQzNW5DSEw0Q3ZEUnlITU85QjlvMWNjS09zVEhnWUh0bUNqWG40?=
 =?utf-8?B?NWtrV0hnZ0xnTU5vcWcvOE9wMkllWkErVFlRVlNHUWtyY2tzaks4eExDMFpi?=
 =?utf-8?B?YUFMcjBqWXIyRnlzWTEzL1hGZjZQZ1BxbktpUDJ2d2JFTHZsZzdoV2tCbDhW?=
 =?utf-8?B?TmFSRU9GdGl0bDZqSGhmbUYrWTJJRXQvTjB4RXE0bUNFTVU0YWROU0xkM1FM?=
 =?utf-8?B?dng3Nlp1UVVZMWw0WWhaVm9jMTZQMmpWNjlxQ1NFSlg4VFpoSE5nQzg3bkk4?=
 =?utf-8?B?VVArbnRnTlU0MTdKVG9hdm1VREJzK29IRGxoZnNQV0Y3MmU0S1NycDJpYkhJ?=
 =?utf-8?B?UkRPTW9wbGdyTTRKUFRKY0o1dk1LQzJlR0xnVXVEUGt6L05neUEzU2dLNFhs?=
 =?utf-8?B?RUhqUjJUVVFnT21XN0hPL2hURW1LZkptNXpDQjEva2pYS3pEeTAwL3FIMjMy?=
 =?utf-8?B?WGdZMGFGR1NsRm01Lzk3YkhGSG1LZ214RlllcnQycnh4UUxSbHBkZXExVWZQ?=
 =?utf-8?B?NlJtdGI3b0tFYitTTFpCRTd6UHlreUVvZDFNUFVFR0VDaWFmNkYxclFiQWV1?=
 =?utf-8?B?Szh3QUpvRTlYTVFwUDlJYkZGeGpqY2VJMUl1aHlYY2NyQUsyQldrN2E3Qk1S?=
 =?utf-8?B?ZWJ1QVdBc21mVXJpNjY1OGZBTXkxV0VFQUcyVDIvY0kvbDczVVVTbzVXNGty?=
 =?utf-8?B?dWRscFRwVEJydmszNWxxaUxFbG5hQnBYU1oybVR4MXFhSk1aKzVET2llT1pq?=
 =?utf-8?B?RFF1T2FoU21kZ1NHSkc2VFRuM1puZVBySjJNZFN2SUw5U0FWTFY1THFhSkF0?=
 =?utf-8?B?WTVFeENTZGU4dm1KbnFUYVFmd21yMWlySDhZV2F2NWRzMGEvOWlLZytNTDh1?=
 =?utf-8?B?c1BWRmVQbzZmd0dzeVowZnY5a1pMdEhKZ28yaUVhT2cxL2FCZEdlNW90WnVo?=
 =?utf-8?B?T3hIWkFJcDY1MWZVZzdtcnhqelEyNSt2YzNuZnVLaTdzRnlISWt3YzN1cEpB?=
 =?utf-8?Q?Pd2yMPqLRCsn2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkRwUUthb05CNis4ZjdjNEhoa1hhaCthUXhaS0tmQkJzZ2R1emdsd2g1SFhU?=
 =?utf-8?B?MFN0ZjhWc2xTaytHbngvU2pvZTVMeHBKWlBLTXBNNmJDMmNLY0FUdlE5Z1A2?=
 =?utf-8?B?SUp2R05vK1B6UTVibWc2dkFjclgyOUNTcDBnTzd3ZUNzbHVzL1l0M2xpVGRn?=
 =?utf-8?B?Q2V3VVhkNGI5Skdua3Q1YWNkQUxDSTdxaUVlYnNNNGhuejhHemRSRmdkSU03?=
 =?utf-8?B?VlpadFRKelZCa2pBajdlZWU1SDhrM2JpN0dMR3FiUklKRDdrbmFYczZMZ244?=
 =?utf-8?B?ckVZZStYY1VtaXRQU0t4d0sxd3VwL0NKMnNLTGI1VFF2dkZnMmRKa1l1Z1JU?=
 =?utf-8?B?QjJ4ZGd3aGtaMkR6dm5tVnBSNk5ER3p4V0M3eFZ0MFFOa3VJTC9RSGxZSW1z?=
 =?utf-8?B?Nm1kRFF6Y1BjVjZ3Q2crVks5eUpBT3VvSDNuTHlIRWNRZnlOTjd0ZVp4ejZT?=
 =?utf-8?B?V0ZHK2YxU0dVUlVwTDFHRXd6THBlb1ZpZEJobW9RMzJjTlFlUHVvQjNqV25L?=
 =?utf-8?B?eUVUbjBKUGp0bU5STmFIMXB0dm5kWDdIT0twNVVCTGsvS2lXMGJFNUdrNHRR?=
 =?utf-8?B?ZFh5N2JtVXNqYnFub1JRWVkwZCtwRDJxakZ3TG5raGNXUGVibUNnTVJUQmhR?=
 =?utf-8?B?RFBhbUlha1R4RzR4QldobTVyaGh4MWpsZWJhMW85Y0JWc2trUitER1ZJR2Nt?=
 =?utf-8?B?RDhHVzA1R3RZTG1STHcvSEMzMEk4RUF2OXhQb1YvS05yVFVtTE5sTW5JMjA3?=
 =?utf-8?B?WXhGZjFtTDVMZWNHS1hzTml3S2R4c3BoZDlLMU15SGY1dVdURXhqdzJYMDZh?=
 =?utf-8?B?ckNudkxwWDdIYy9zaEp2SUxZTGdGQmpiTjNtb0ZqSFhwVi9lcXNRUTlTY0g5?=
 =?utf-8?B?TWhoVXVRbk8zd0l4SnIwZ1F5ZHRoNHNtS1JUOGlrS1BtcUJsWjU4QXM0WWt5?=
 =?utf-8?B?OFBDZjZGbWxnZXhTa1d5UEtxL2o4TmlsbzlvRjFQeGtxMk5EczMyQlFnQzlX?=
 =?utf-8?B?aVNwejVpaENpMUQ0cTVVTTk4eFNkbEZIQ2g0dlZNOU5ZYlMwR2pEOWFEeE5w?=
 =?utf-8?B?c1l0ck43M2crRlhpYmFtUWNERmUra0dWZDdSSHZnT3hrSjZJYUNPTFlTQkxV?=
 =?utf-8?B?WFI5RzllbmxuQlBrT1dhUnZ6WVpLSEt1TTRuRDIwOXFuaWt6YllWeUpwSHdR?=
 =?utf-8?B?eitFTEltNTdPRXRQRmd1Y0RsM3p1TEY2d2Z0b1o0SVRwM09XOXc4YmdWZ2ls?=
 =?utf-8?B?S3VvYTZPek9nVVZsUXN5eGQyV01maFdENXA3UUsxdGo1RE9BbUx0MHdvQXZM?=
 =?utf-8?B?ckZBOXArc0hiNDBIV2tWSWZ0bmoxMEpPSmNuckZGMFlCOS9GQnJGb0VVMGJX?=
 =?utf-8?B?YlVrZTVXUzladnhaQlBIaW9ubjNCVFMwTGZKMnBDSXVRVkNjQUJnbnF1N296?=
 =?utf-8?B?RkRPbmQ5UDA1eU5kVjY4azJQRU0vTFQ3VnlVc1ZVc3N2QlF5R3JiQUMvRStS?=
 =?utf-8?B?MjNYSG5JOFhseFVhakZEWjNGZzVIM2U2NHllYnUxcks4bXA0c041R3poTUo1?=
 =?utf-8?B?dDIvaEdGYnRjQVJXenZseVhjZWhQOCtSanp6TXoyQk9nZWF2VXIyb1ZrRnll?=
 =?utf-8?B?Nm1mc0xleU1xSFRHQVVDRXBzUm5Cd2UxeHA3VjY3VTdZWmduOVBxTi9RbWFG?=
 =?utf-8?B?M0J5VlA0VTlYVWM5bkY2TGJ6cS9uLzVzdWlVbnRsMU8yb0twZlZFVU1GQlVJ?=
 =?utf-8?B?dnFzZmZsYkFuZUJ4S3owUFcrSTNWM3ZOeXErUjBXV21SZUhtMmZHcGdiZmpl?=
 =?utf-8?B?Vk9YTUE5QnhtaDdLcktTS3F1NnE5am1MSE5qY2xwOXVCSG1NckJ5d0N0bmFl?=
 =?utf-8?B?Z01KQ3lybTc5RlhlUW12VjAvaTcvU2gyWVVFMUxOTk1sc3RxbUdLWi9IcnFk?=
 =?utf-8?B?Z1I2VGc3aWV4WUVyM3hwT1hhM2ZJRSsxYnFkUzQ1Mjg4OFQ4Yk1WU0ovY0FX?=
 =?utf-8?B?bVd4QUFhcmdVSUd4NHJHVDlRTWdobVJETDVmcy9vZXhSd1c2eXIzUFI0cUhz?=
 =?utf-8?B?d1h1QkJ1SllLcUI1RFFnczYwbDFCbldRL3pRNmQxamQ5WEJNVmpxSVZ1TEpi?=
 =?utf-8?Q?WqQsPURBsv3MoyyWmth7dnHts?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5058f275-e260-4056-1edb-08dd782c39bb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 12:35:50.0410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tOnhuHS5kdEJgdDzavqoFK4JeKWr9MURAhwhDRj8+cOjGdKudqR2CaFVNyZi1eLK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4224
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

Am 10.04.25 um 11:33 schrieb Qiang Yu:
> On Tue, Apr 8, 2025 at 11:48 PM Erico Nunes <nunes.erico@gmail.com> wrote:
>> With this callback implemented, a terminating application will wait for
>> the sched entity to be flushed out to the hardware and cancel all other
>> pending jobs before destroying its context.
> We do flush when file release in lima_ctx_mgr_fini. Why do we wait here
> in flush? What's the difference?

Waiting for submissions when you release the file descriptor is actually a bad idea since that can prevent SIGKILL from acting immediately. For example the OOM killer absolutely doesn't like that and eventually calls panic().

Flush is called either manually, on process termination or when you send a SIGTERM. This should then wait for any I/O to complete.

The idea is now that you can then still send a SIGKILL to abort waiting for the I/O as well and so get pending GPU operations not submitted to the HW.

The DRM scheduler helps doing that by providing the drm_sched_entity_flush() and drm_sched_entity_fini() functions.

When there is still pending work when drm_sched_entity_fini() is called a callback to kill it is installed and the job just freed instead of executed.

Regards,
Christian.

>
>> This prevents applications with multiple contexts from running into a
>> race condition between running tasks and context destroy when
>> terminating.
>>
>> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
>> ---
>>  drivers/gpu/drm/lima/lima_ctx.c | 18 ++++++++++++++++++
>>  drivers/gpu/drm/lima/lima_ctx.h |  1 +
>>  drivers/gpu/drm/lima/lima_drv.c | 17 ++++++++++++++++-
>>  3 files changed, 35 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/lima/lima_ctx.c b/drivers/gpu/drm/lima/lima_ctx.c
>> index 0e668fc1e0f9..e8fb5788ca69 100644
>> --- a/drivers/gpu/drm/lima/lima_ctx.c
>> +++ b/drivers/gpu/drm/lima/lima_ctx.c
>> @@ -100,3 +100,21 @@ void lima_ctx_mgr_fini(struct lima_ctx_mgr *mgr)
>>         xa_destroy(&mgr->handles);
>>         mutex_destroy(&mgr->lock);
>>  }
>> +
>> +long lima_ctx_mgr_flush(struct lima_ctx_mgr *mgr, long timeout)
>> +{
>> +       struct lima_ctx *ctx;
>> +       unsigned long id;
>> +
>> +       mutex_lock(&mgr->lock);
>> +       xa_for_each(&mgr->handles, id, ctx) {
>> +               for (int i = 0; i < lima_pipe_num; i++) {
>> +                       struct lima_sched_context *context = &ctx->context[i];
>> +                       struct drm_sched_entity *entity = &context->base;
>> +
>> +                       timeout = drm_sched_entity_flush(entity, timeout);
>> +               }
>> +       }
>> +       mutex_unlock(&mgr->lock);
>> +       return timeout;
>> +}
>> diff --git a/drivers/gpu/drm/lima/lima_ctx.h b/drivers/gpu/drm/lima/lima_ctx.h
>> index 5b1063ce968b..ff133db6ae4c 100644
>> --- a/drivers/gpu/drm/lima/lima_ctx.h
>> +++ b/drivers/gpu/drm/lima/lima_ctx.h
>> @@ -30,5 +30,6 @@ struct lima_ctx *lima_ctx_get(struct lima_ctx_mgr *mgr, u32 id);
>>  void lima_ctx_put(struct lima_ctx *ctx);
>>  void lima_ctx_mgr_init(struct lima_ctx_mgr *mgr);
>>  void lima_ctx_mgr_fini(struct lima_ctx_mgr *mgr);
>> +long lima_ctx_mgr_flush(struct lima_ctx_mgr *mgr, long timeout);
>>
>>  #endif
>> diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
>> index 11ace5cebf4c..08169b0d9c28 100644
>> --- a/drivers/gpu/drm/lima/lima_drv.c
>> +++ b/drivers/gpu/drm/lima/lima_drv.c
>> @@ -254,7 +254,22 @@ static const struct drm_ioctl_desc lima_drm_driver_ioctls[] = {
>>         DRM_IOCTL_DEF_DRV(LIMA_CTX_FREE, lima_ioctl_ctx_free, DRM_RENDER_ALLOW),
>>  };
>>
>> -DEFINE_DRM_GEM_FOPS(lima_drm_driver_fops);
>> +static int lima_drm_driver_flush(struct file *filp, fl_owner_t id)
>> +{
>> +       struct drm_file *file = filp->private_data;
>> +       struct lima_drm_priv *priv = file->driver_priv;
>> +       long timeout = MAX_WAIT_SCHED_ENTITY_Q_EMPTY;
>> +
>> +       timeout = lima_ctx_mgr_flush(&priv->ctx_mgr, timeout);
>> +
>> +       return timeout >= 0 ? 0 : timeout;
>> +}
>> +
>> +static const struct file_operations lima_drm_driver_fops = {
>> +       .owner = THIS_MODULE,
>> +       .flush = lima_drm_driver_flush,
>> +       DRM_GEM_FOPS,
>> +};
>>
>>  /*
>>   * Changelog:
>> --
>> 2.49.0
>>

