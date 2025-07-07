Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C0BAFB457
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 15:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B98E10E45D;
	Mon,  7 Jul 2025 13:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uJnG4bCY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B143810E45D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 13:21:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=md1s5FkxxVfwAY+Sj8IMPsMjx7muTkkBRDoiqFI2OUweEk4Bmprjo+pCrwkjTzH8Tml8hf6BgbmbH4nCe4ffSJyqRzwS2zJt1sTp3v1mMcpFBIUh0NpSw5IiA6Qy2uCp59HSH/oLuHVzTmOpWhfcb/o18ds9WTVgANBUUag36PA3VU6J9kic9Izg8QGLRJDDmTJ8cEUzGxDZL8GgGEW61AbhZsFssU0fmXLBmwQaMXSQrrbCb3fRmk42S4UlBhRM/G3OjKALR5yO+3dICblraAUacH007qDLlA1ejWYJCINtGl3Bp2FhFExF2TZmEOHtdQ4ybRns+7H5iCJ/7J/SHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Q70uWRmJdYtBRbur6twV50yjgVPPo8RMLHGW+0kTdw=;
 b=hwzYh2sMjCwetaHiW6CkI/GEDo7BF7L7dPtBVNVvmnQS8wZ/SfgtJ4wqn9nycfzaX+FA6ipoX1O8wWs/HZbotvl+Dpy58chTdofhncZQLlDD/x2hLA/FT60ac7YMiBW7Nb6atRhEuA5UFox9MrqWlDT/lLoEEFx8ryP4dJejzEWzJMseGf+WP+/GPZC4pAQ1mpVObJmu3OqLvJbGvE5D6ZKYytGSsJBje1sFzSCF0gaQ0JPT2tKVeeegl6V9w5V9/sWFqFfR6SqwWYKnBsan/fAaBxoOJpJKaStHiUZfDJN6PYh15bScZWblqYsWIxCV4c8yf1hOxLLAsQVdqGE+wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Q70uWRmJdYtBRbur6twV50yjgVPPo8RMLHGW+0kTdw=;
 b=uJnG4bCYkigtVepIjJRj/M3n+xJ4N/c2VdvtVZaYTsedNm/njY2xrN8P8qqVZi43YnSwUYPUqTsmJWrhjdhmazOnOGQ98zCbJjRqnFwHz8m+mHXqaI3ooHsCAYOlBpIb+KYeyu/8ioGDBnz4YErrOfrS5Q8MAehno0t0O/Bljjk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB4400.namprd12.prod.outlook.com (2603:10b6:806:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 13:21:22 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 13:21:22 +0000
Message-ID: <a3336964-1b72-421c-b4dc-2ac3f548430b@amd.com>
Date: Mon, 7 Jul 2025 15:21:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/framebuffer: Acquire internal references on GEM
 handles
To: Thomas Zimmermann <tzimmermann@suse.de>, asrivats@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, jean-christophe@guillain.net, superm1@kernel.org,
 satadru@gmail.com, bp@alien8.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bert Karwatzki <spasswolf@web.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org
References: <20250707131224.249496-1-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250707131224.249496-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0385.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB4400:EE_
X-MS-Office365-Filtering-Correlation-Id: f82d259e-a174-4562-95c1-08ddbd592a51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3R4M2l3c0FhcUpKYnM0VCtUczlEMzN1U01IdkpWMDBweGdCSXpkR0hza3kv?=
 =?utf-8?B?UUpvVi9TSWQzR3NZaDBlNzJUYjVFd2hJVnJENlF2Y09nZ0c5UVg3eEdNWlMz?=
 =?utf-8?B?RnJlY3FHVWZMV3A2NjVBWjhYQ2lvdWVvRFAzSTVXaW9zeHZRS2dndEpBeEt3?=
 =?utf-8?B?STdzeHFQOTcxK09MbzMzeGlNdFhUOXl3c25BVjBCWlllNVJGeUdMVWVYZmY0?=
 =?utf-8?B?YmFpa0ppdUtoYVEzWGwvbXFDT0llazJDNTd6VUhxcGFMQ3hRVnh1WTdUMFJi?=
 =?utf-8?B?clIvU2pFVEozak1oWm5lYyttcEFnZU9CSVJ0N09FY1NUQS9VUGRON04vNWM5?=
 =?utf-8?B?aWQxaUVVekhzS3Uvck5teHgvQnpsUHJ1NEMyNnRxbFFZczhHUjlLQ2VBSm1k?=
 =?utf-8?B?TURkOTl0RnhzK3ZWVzE4MVVOZnFsVjI0eERidmpLYnRpd0d5czFrL21BMWx6?=
 =?utf-8?B?aXp0bTM5MlBKaTRqMlMzV3ZpdmRwSEtpYVZSQ0xkdysvd1VBSk8vOVhjaTlM?=
 =?utf-8?B?Sm9DQjJielVMbmhwdTB0SUw3b3lGck1raTRHYXFLcGJXWlFpa1BERitHR0g5?=
 =?utf-8?B?b3BZQkQ3TEdHODd2ejBRWFdhNllHQXhzZzRISVkzVFlkVDRmaktTVTllajVB?=
 =?utf-8?B?bXEraGFuR21FZS9qT29WeEtGUyt4YlRHNUJZQUppZk5FR0w0bXkzdUg5WTcw?=
 =?utf-8?B?UThNUHlYUGtGKzZHWWZzS0hSdkp6VnNwMUhaeWNacHZoTW91RDY0Skh3QWJn?=
 =?utf-8?B?UjdzYVRKSXM4TThOSFV0M0IrOFNoQ0Zjb2tiVjhYVFZGdk94OFpsL1dTWTNS?=
 =?utf-8?B?dk9oM1U1a3lWUkVwMXduZ1MvL2IvN1Y3RUZ6bVR6cG9raUFBOUpycEhVd0Rt?=
 =?utf-8?B?c0s4NWpuQTBqSTNKQXF2OUtMWlUxWXpmbDZFcEVqcmpSMVk4b3RLc2RzT3RS?=
 =?utf-8?B?d0tjV25lVGJMa0llYjVUSHpRanAxMngwSmxPaG92RWVyU2ozMUxFT1ppNitN?=
 =?utf-8?B?U0xybzhkNUJzSHZBdWM5Q1ZsMmw2dCszR251dklGK2ZJcEYvWUpnRnZRMkV2?=
 =?utf-8?B?ODRrN1NGNjJ3TmVrbjcyUlZKRGh2SFB3Yk9BNXFjUlhKT2RUQTBCbUFJdHFF?=
 =?utf-8?B?V0VuY1RnUVpNTU1OdndIeEZzSUxJLzNRYzBtcFdxNXJhWVE5NmZBM3p1NDQ3?=
 =?utf-8?B?Z3dEYm43OHJJNDVFclp6Wm9sdzhCNjdQVktFak1MUUdnK2NrYVNLSlBzdC94?=
 =?utf-8?B?V1d4RTBQVTVmQlZkTVBjQzc3RWloSzVZWk5PbFUwL3hTT3VLSjBHK3pQRC9x?=
 =?utf-8?B?TTFoL0dLamJOdEJRdWROR1lBMm9KU0RmVGMzd3g3QzNCZld3SGRqNHNQc0t1?=
 =?utf-8?B?amFPa1RNUjhuSzltQ0Z2QlRtazBWeG1UdU5tYm1aQmlQTVhoYU8rUlQwTFlh?=
 =?utf-8?B?VWF5YjZ0bENST1B5YWtPN3M4K3Bwb0I3eDhQaFV6dTFSaVpCZ3B4c0gxOFVk?=
 =?utf-8?B?OUhpYjRXRk9Oa013anZJK1hKQnlXTnFkcTJWKzJxVCtPYkRSbkNqbjRMNlR3?=
 =?utf-8?B?c3F3cTZ0UTNEc0tVQmxtSklKb3pqUDd1ZE95YVJXMGRqK1lsRWJuei9xY0tI?=
 =?utf-8?B?UDFCeW9Ic3ZEYjZsME5xeUxxQzhoUzJ4YnZMT2VsZ0o5VWJ6MndUem8wU0dj?=
 =?utf-8?B?MXRTSG1BR1lBN3hPMmdLRVltSTIyeC80b3FYWml6YzBJNUIzc0JrYStuZlJX?=
 =?utf-8?B?VnNmNVpMVkFzOVgrS3VoT3o0NFNQUkkxNVZCclNBV29oVkFsZTBxS2MzOWVl?=
 =?utf-8?B?OWdQV2QyOENmNEtwT0lmWDdHSEVkVEVYUkxpVkh5UE85cjd4MExCNERFSVZB?=
 =?utf-8?B?NndqbzZWUlIyQkxVcVVtQktCT3ZhbWoyTThrbU9zYnZKQXU4b2ZOOGluQjRE?=
 =?utf-8?B?Uk93N2d6MjNFRTFLV3RDNlluR0tDakNEVDFPZDF5NklvNDJvdFR2U21YYVpm?=
 =?utf-8?B?L01hcEI4N0ZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUUyUmJrTDBnU1ZUVVBoZFM1ZXZXUjFwSnY2MDFSTFNYcXk4MHZ0U2hwOTRY?=
 =?utf-8?B?bW1SenR6YXJZSFhWVDVFYVdmU2paNHhiTFNmcWdCM1dIUXlGck5FbHlyMkpq?=
 =?utf-8?B?S09NQlV5K3dKVjdrZmE3amxZaHJFb2NDZjQ0UFpCMjBGNVdxanBNeUpDNFlt?=
 =?utf-8?B?eituR2YzWUYveVM5NXZtdkpWRzFOUEdVazQvRnQwbUJuOVIwbUt3eXliVjV4?=
 =?utf-8?B?bnFIZ1BCOTUxVG56ZjYzendJbFRkY0VoSmpLS3pwUzRCcmJGVFVTb0dsN0ov?=
 =?utf-8?B?OEloT2IwMlMvNkE0dDA1MTdCUzRpYTVBdGg3ZXJZWmdBN3lTMy82eGtGNGRz?=
 =?utf-8?B?ZDVvbEJubTdwUTM0dDgvU1B2b1I0L0tseTZkMW0yVWsvN21GZkNwdDg1NHA1?=
 =?utf-8?B?eTBzeUY1a0M4QXVCWU15ZnVQUGcwUkxaYXBNMXRnSXRHVjN2SVNVUFNPWmFS?=
 =?utf-8?B?ZFZ0ZE16YVVGeVhjVHpJWFNmMGx1a2ZxaURqT0NONGN5cWNqZm1DMldIYU1Z?=
 =?utf-8?B?TUhyME1NRFAvWkcvRTI2dkZlNlpBdS9kSXVXSlNiZSsyKzFEZEtGbFhqQ0FL?=
 =?utf-8?B?TWJlUlVWdWprajljbi94aGJvOENIRksvWGF4Skxkd0ozbnNpdVI0T3F5bTdl?=
 =?utf-8?B?eG4zaEw5SDdhcHEvOE12M3N2UXJTc3lkdHJGRzEyMVB5cWZTR0tVdElmUXdZ?=
 =?utf-8?B?Mm8wN0RnVXFaaHRuY2pMYnpIU1RzRWVBd29CMDdPZUI2eHN4bzhHK3hKSDQv?=
 =?utf-8?B?bGJaemlicGVSZzNLRnl4TGorc2VHQlN5L3RLaVFtNXZacDBMVUVxV2lLamFu?=
 =?utf-8?B?V3lUSjhqK1NZUlRaalZJVEczdkZMQ0xDUVJ1OTRRQnpPcFNleEN1a0g0bkx0?=
 =?utf-8?B?dVJJdzMzc0FSaHJYSHByYjhTTW8yQUlMV1BvaTgzanpPVnZqd3V6ampmSG5R?=
 =?utf-8?B?bEI5MTZtaEJRTVdoMXRpd3NwTVREK2JaSVRUY29Qbnk4K2RqbnByS3BuMnZv?=
 =?utf-8?B?dEF3VWxXeGdBc0lKTjF4QVZlWko1YXEzZXc2anVjWnlSL0h6RFZRQ2cxb3VR?=
 =?utf-8?B?YXBaVmtyU09LclhTUFhMVjl5MVN0VEozSFVsU3Q5anA2RzMzQkFsNFJzTisz?=
 =?utf-8?B?Smd1aEFWQWlHcUc5dlBFOTVSV2VVNXAwYmhRaVgvZUFkTG9IdXh2bFdocldT?=
 =?utf-8?B?M1NzUUZEcG10RmV6a2VzM2M0L2JMdUdFSUh6Kzc0dmRSc2N4a0ZaTVRuUjBw?=
 =?utf-8?B?YU1YaXpMNVJMc1UxSXJtT1lhem5MdzFIampkckhqT3BoWTk3S29ZakYwcWtT?=
 =?utf-8?B?d2krbEZTWEh5OTZOUWFLanc3aDloelVnMERiYWFyMXllb2hYYnBWVmhuTDNB?=
 =?utf-8?B?YWFMRzdMMHN3NENrL3dUbklLeHRvbXppZ3E4b3VhMHNBZHdNL1djcmJxRVVW?=
 =?utf-8?B?N25SanhMWDNEd1I3V0ZHdSsyVGRicURRTk1Ub2dOcHdwaysrL3BkcE1SQ1Zx?=
 =?utf-8?B?MHRWV0xtMFVBbzNVdlR4a0ZmaVFCUzJLQ1MrVWxTWHZTeUhwUGZtVlhTS2Np?=
 =?utf-8?B?UEZ4aVJmVTJXTmJ2MUh6emovR1JBL0NEMjJvRm1FU3RPWnZUQmtCSUR3TXEz?=
 =?utf-8?B?RHlqNDArOWh1QjNqNGtReWpWTG50MFYxaisrZ0xLT1kxRGRkMGpjZXk2eVRI?=
 =?utf-8?B?R0g5K0cyU1JkUHJPZ0xaV2lxSzY0MTJzeERuQTZWbTlSdW12SjluNWFieGVZ?=
 =?utf-8?B?V0VCT3I2RUpjQXpQdWVCYXNmMDVUam5UTGphdW1nMklSdC8xTTl5YWQ2MXpk?=
 =?utf-8?B?UG92a2JUY280MFNFSmRtdFVDaUpwK2RyR0Y3Y1lsL1ZZUEVDNzhwRmVOakVG?=
 =?utf-8?B?UGNKMzZoamtqOFdISlc1QThRZnhRdTZaS1hjTFgraW9sQjFzdkNsWmdOeVhT?=
 =?utf-8?B?ejZjRjZMWnVPQnVvS05PMytYSVptK1FnYTR0dWFseFNVOGFWeXFxYzdVL0sv?=
 =?utf-8?B?dlhXUStlTHZVNjhuckhrMTVhL0JNSGxYVEl1akFKbzc4VDhoUGFWYmNjVDdr?=
 =?utf-8?B?WElxR0N6UXh5aGVIc2xudTZHeWxxV09MeHIrNW0zWFI5aDJYUENKemhrSS82?=
 =?utf-8?Q?+aBmV8WqQy2eWdDVImNO928YT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f82d259e-a174-4562-95c1-08ddbd592a51
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 13:21:21.8975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLqB7bychTl/BdGmVfHa2VPxBxc2bQliR5x6lhkZAoaZdO/9ZZwfjUHc3BKARQfT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4400
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

On 07.07.25 15:11, Thomas Zimmermann wrote:
> Acquire GEM handles in drm_framebuffer_init() and release them in
> the corresponding drm_framebuffer_cleanup(). Ties the handle's
> lifetime to the framebuffer. Not all GEM buffer objects have GEM
> handles. If not set, no refcounting takes place. This is the case
> for some fbdev emulation. This is not a problem as these GEM objects
> do not use dma-bufs and drivers will not release them while fbdev
> emulation is running. Framebuffer flags keep a bit per color plane
> of which the framebuffer holds a GEM handle reference.
> 
> As all drivers use drm_framebuffer_init(), they will now all hold
> dma-buf references as fixed in commit 5307dce878d4 ("drm/gem: Acquire
> references on GEM handles for framebuffers").
> 
> In the GEM framebuffer helpers, restore the original ref counting
> on buffer objects. As the helpers for handle refcounting are now
> no longer called from outside the DRM core, unexport the symbols.
> 
> v3:
> - don't mix internal flags with mode flags (Christian)
> v2:
> - track framebuffer handle refs by flag
> - drop gma500 cleanup (Christian)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 5307dce878d4 ("drm/gem: Acquire references on GEM handles for framebuffers")
> Reported-by: Bert Karwatzki <spasswolf@web.de>
> Closes: https://lore.kernel.org/dri-devel/20250703115915.3096-1-spasswolf@web.de/
> Tested-by: Bert Karwatzki <spasswolf@web.de>
> Tested-by: Mario Limonciello <superm1@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Anusha Srivatsa <asrivats@redhat.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: <stable@vger.kernel.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

Just one more question below.

> ---
>  drivers/gpu/drm/drm_framebuffer.c            | 31 ++++++++++++++--
>  drivers/gpu/drm/drm_gem.c                    | 38 ++++++++++++--------
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 ++++-----
>  drivers/gpu/drm/drm_internal.h               |  2 +-
>  include/drm/drm_framebuffer.h                |  7 ++++
>  5 files changed, 68 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index b781601946db..63a70f285cce 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -862,11 +862,23 @@ EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_framebuffer_free);
>  int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
>  			 const struct drm_framebuffer_funcs *funcs)
>  {
> +	unsigned int i;
>  	int ret;
> +	bool exists;
>  
>  	if (WARN_ON_ONCE(fb->dev != dev || !fb->format))
>  		return -EINVAL;
>  
> +	for (i = 0; i < fb->format->num_planes; i++) {
> +		if (drm_WARN_ON_ONCE(dev, fb->internal_flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i)))
> +			fb->internal_flags &= ~DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
> +		if (fb->obj[i]) {
> +			exists = drm_gem_object_handle_get_if_exists_unlocked(fb->obj[i]);
> +			if (exists)
> +				fb->internal_flags |= DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
> +		}
> +	}
> +
>  	INIT_LIST_HEAD(&fb->filp_head);
>  
>  	fb->funcs = funcs;
> @@ -875,7 +887,7 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
>  	ret = __drm_mode_object_add(dev, &fb->base, DRM_MODE_OBJECT_FB,
>  				    false, drm_framebuffer_free);
>  	if (ret)
> -		goto out;
> +		goto err;
>  
>  	mutex_lock(&dev->mode_config.fb_lock);
>  	dev->mode_config.num_fb++;
> @@ -883,7 +895,16 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
>  	mutex_unlock(&dev->mode_config.fb_lock);
>  
>  	drm_mode_object_register(dev, &fb->base);
> -out:
> +
> +	return 0;
> +
> +err:
> +	for (i = 0; i < fb->format->num_planes; i++) {
> +		if (fb->internal_flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i)) {
> +			drm_gem_object_handle_put_unlocked(fb->obj[i]);
> +			fb->internal_flags &= ~DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
> +		}
> +	}
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_framebuffer_init);
> @@ -960,6 +981,12 @@ EXPORT_SYMBOL(drm_framebuffer_unregister_private);
>  void drm_framebuffer_cleanup(struct drm_framebuffer *fb)
>  {
>  	struct drm_device *dev = fb->dev;
> +	unsigned int i;
> +
> +	for (i = 0; i < fb->format->num_planes; i++) {
> +		if (fb->internal_flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i))
> +			drm_gem_object_handle_put_unlocked(fb->obj[i]);
> +	}
>  
>  	mutex_lock(&dev->mode_config.fb_lock);
>  	list_del(&fb->head);
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index bc505d938b3e..41cdab6088ae 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -224,23 +224,34 @@ static void drm_gem_object_handle_get(struct drm_gem_object *obj)
>  }
>  
>  /**
> - * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
> + * drm_gem_object_handle_get_if_exists_unlocked - acquire reference on user-space handle, if any
>   * @obj: GEM object
>   *
> - * Acquires a reference on the GEM buffer object's handle. Required
> - * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
> - * to release the reference.
> + * Acquires a reference on the GEM buffer object's handle. Required to keep
> + * the GEM object alive. Call drm_gem_object_handle_put_if_exists_unlocked()
> + * to release the reference. Does nothing if the buffer object has no handle.
> + *
> + * Returns:
> + * True if a handle exists, or false otherwise
>   */
> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
> +bool drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj)
>  {
>  	struct drm_device *dev = obj->dev;
>  
>  	guard(mutex)(&dev->object_name_lock);
>  
> -	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
> +	/*
> +	 * First ref taken during GEM object creation, if any. Some
> +	 * drivers set up internal framebuffers with GEM objects that
> +	 * do not have a GEM handle. Hence, this counter can be zero.
> +	 */
> +	if (!obj->handle_count)
> +		return false;
> +
>  	drm_gem_object_handle_get(obj);
> +
> +	return true;
>  }
> -EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
>  
>  /**
>   * drm_gem_object_handle_free - release resources bound to userspace handles
> @@ -273,7 +284,7 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
>  }
>  
>  /**
> - * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
> + * drm_gem_object_handle_put_unlocked - releases reference on user-space handle
>   * @obj: GEM object
>   *
>   * Releases a reference on the GEM buffer object's handle. Possibly releases
> @@ -284,14 +295,14 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>  	struct drm_device *dev = obj->dev;
>  	bool final = false;
>  
> -	if (WARN_ON(READ_ONCE(obj->handle_count) == 0))
> +	if (drm_WARN_ON(dev, READ_ONCE(obj->handle_count) == 0))
>  		return;
>  
>  	/*
> -	* Must bump handle count first as this may be the last
> -	* ref, in which case the object would disappear before we
> -	* checked for a name
> -	*/
> +	 * Must bump handle count first as this may be the last
> +	 * ref, in which case the object would disappear before
> +	 * we checked for a name.
> +	 */
>  
>  	mutex_lock(&dev->object_name_lock);
>  	if (--obj->handle_count == 0) {
> @@ -304,7 +315,6 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>  	if (final)
>  		drm_gem_object_put(obj);
>  }
> -EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
>  
>  /*
>   * Called at device or object close to release the file's
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index c60d0044d036..618ce725cd75 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -100,7 +100,7 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
>  	unsigned int i;
>  
>  	for (i = 0; i < fb->format->num_planes; i++)
> -		drm_gem_object_handle_put_unlocked(fb->obj[i]);
> +		drm_gem_object_put(fb->obj[i]);
>  
>  	drm_framebuffer_cleanup(fb);
>  	kfree(fb);
> @@ -183,10 +183,8 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  		if (!objs[i]) {
>  			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
>  			ret = -ENOENT;
> -			goto err_gem_object_handle_put_unlocked;
> +			goto err_gem_object_put;
>  		}
> -		drm_gem_object_handle_get_unlocked(objs[i]);
> -		drm_gem_object_put(objs[i]);
>  
>  		min_size = (height - 1) * mode_cmd->pitches[i]
>  			 + drm_format_info_min_pitch(info, i, width)
> @@ -196,22 +194,22 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  			drm_dbg_kms(dev,
>  				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
>  				    objs[i]->size, min_size, i);
> -			drm_gem_object_handle_put_unlocked(objs[i]);
> +			drm_gem_object_put(objs[i]);
>  			ret = -EINVAL;
> -			goto err_gem_object_handle_put_unlocked;
> +			goto err_gem_object_put;
>  		}
>  	}
>  
>  	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
>  	if (ret)
> -		goto err_gem_object_handle_put_unlocked;
> +		goto err_gem_object_put;
>  
>  	return 0;
>  
> -err_gem_object_handle_put_unlocked:
> +err_gem_object_put:
>  	while (i > 0) {
>  		--i;
> -		drm_gem_object_handle_put_unlocked(objs[i]);
> +		drm_gem_object_put(objs[i]);
>  	}
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index f921cc73f8b8..e79c3c623c9a 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -161,7 +161,7 @@ void drm_sysfs_lease_event(struct drm_device *dev);
>  
>  /* drm_gem.c */
>  int drm_gem_init(struct drm_device *dev);
> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
> +bool drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj);
>  void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
>  int drm_gem_handle_create_tail(struct drm_file *file_priv,
>  			       struct drm_gem_object *obj,
> diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
> index 668077009fce..38b24fc8978d 100644
> --- a/include/drm/drm_framebuffer.h
> +++ b/include/drm/drm_framebuffer.h
> @@ -23,6 +23,7 @@
>  #ifndef __DRM_FRAMEBUFFER_H__
>  #define __DRM_FRAMEBUFFER_H__
>  
> +#include <linux/bits.h>
>  #include <linux/ctype.h>
>  #include <linux/list.h>
>  #include <linux/sched.h>
> @@ -100,6 +101,8 @@ struct drm_framebuffer_funcs {
>  		     unsigned num_clips);
>  };
>  
> +#define DRM_FRAMEBUFFER_HAS_HANDLE_REF(_i)	BIT(0u + (_i))

Why the "0u + (_i)" here? An macro trick?

Regards,
Christian.

> +
>  /**
>   * struct drm_framebuffer - frame buffer object
>   *
> @@ -188,6 +191,10 @@ struct drm_framebuffer {
>  	 * DRM_MODE_FB_MODIFIERS.
>  	 */
>  	int flags;
> +	/**
> +	 * @internal_flags: Framebuffer flags like DRM_FRAMEBUFFER_HAS_HANDLE_REF.
> +	 */
> +	unsigned int internal_flags;
>  	/**
>  	 * @filp_head: Placed on &drm_file.fbs, protected by &drm_file.fbs_lock.
>  	 */

