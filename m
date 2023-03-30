Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E706D0240
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 12:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BEB10E1F6;
	Thu, 30 Mar 2023 10:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2078.outbound.protection.outlook.com [40.107.95.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4972410E1F6;
 Thu, 30 Mar 2023 10:59:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SH2i+Tbzai8lkb1E9Qi8GQamCvPBEyMRs5jbzOUfXWV6d5vyrxr4jU6OFks0Fk51LyYzN9O/2pEqTEFQ/24dXnavbYJjemOOGrw7lQj5Dk0Jg1JwQqI2z4qHLdnkAoaY2dnKWq8J3F9PaqJI3KCfGE+QIKrGXRhkCwheyZxBCGpsnrdN6OB8x5OjHL2M7lgORxhoZNRw492E4foTcfrMXgsOV/1PCmNQ+AJ5iitRghaW2nxP5YC67YN5lghgGUAj0ETumLFehZ7/iNtxMsbGvRRmtLMdxKGeXDcdSUroBeTvf8JBE3RmsAEk8V/6UauQl3KWBY8pYI1jAD99RUISUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7wSsGtKslMp5Z+FVWyV9P5E/3RtJHE9R/5KFDp5D6Y=;
 b=lkoykhdgz60EJe82TSBPvVCdkM14CfQenMyh1nihLnJ5wOfwFSdSUHynFUUEdjViV8boSu0kA6YwfF5z+THq2/Rr5yByX/6aa9vVx+jnjAOe0/qFJKdnDMjlv+R2NIPoh7aP0vF1Hs8+u6WNclSDSsh00+yx74DsoGcgn2ZrcKiZbf/10RDHnGttA9+rEs/qXTirSEb/QdpOmNUCyYAUSBni+vSULh/aeUmFTWAFLpwB5v+JfnauqTelyW1IttAhoujQJGbYdEmI5QSXccpaUmZPRIjh4z4zEcHNbDXs9gEmWVOFz2TYixRx8rGX3+hHbyb4BAsRtZ0U+EX5Ps16Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7wSsGtKslMp5Z+FVWyV9P5E/3RtJHE9R/5KFDp5D6Y=;
 b=2OSzwXWS00OqiO+EqrZfwL4CrhZJcpfKwZSQqI2JlNa9CPoRZKVedJEznYPEpnLwfhduu2zaNCWWd62QohcoEqy8clb0koNwRv61HzYXKO319fxVhW6yj8YcrRCI1us4HKTlnKOu1hH/AMqSz8ap+KUuLHRyNcQGXYwHMrepIwc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4265.namprd12.prod.outlook.com (2603:10b6:5:211::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Thu, 30 Mar
 2023 10:59:24 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.022; Thu, 30 Mar 2023
 10:59:24 +0000
Message-ID: <7e7fa796-2614-92ea-012b-aa04f04a7312@amd.com>
Date: Thu, 30 Mar 2023 12:59:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/4] log2: make is_power_of_2() more generic
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org
References: <20230330104243.2120761-1-jani.nikula@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230330104243.2120761-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4265:EE_
X-MS-Office365-Filtering-Correlation-Id: 28e5a3d6-9cb2-45f5-dc66-08db310dd2a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aZxgBfT7d9IK1EUN20eVOb0s7T3KRJGHNoRFpIHsWFnczdPifPSg/46DNuF75HBQsY/lJfZyDHLr3PJrNDFkh0diHwrwWEIv7eTC1axu3u6pYAL11YS+8bLo66PposApGycTeGveVaGbTeoebKvfBA0m/DyZrn26gBzXIUFJNM/xfQuuothcjSA2VNMhKGnGIXPffn0njcS7LMfQwLg3i3+AB87IRetY4/q7irf4IYWZfXTFzoJNvzjVTVi7ICYuXyLKx9gQPtGqzYrdNoNd7p1mhIWwOeWEWv2MdlC9nXc0pVFUdxMLqr+xpR11szJX4NSp/kZTc25/EAaVND9ohdhNBrtwlsToGjseZkYwGRDbW2FyDX6etaWZF5JC8c0nK0sZurQGTM3D9VgFcq5lpq89hc3ctwkmL0cUtc3+B0aifp8ITqYURKyFsZC5sgzOpWkvu5MXQ3sVf2wDCucs2lEn1r7bjAK6BYnozlT+GCc4od8Gyj1JL1BYJNHM+2oimA+H1d/9WDUJl/ivN860hh8nSprhz2CTMpwySGPryKAxgVANaGjMyErAoKko1+eKqUs17vzmoKcAeK3wTQfe0kFXJe4E+i0KXQAv1Jd9fzw4KeAPjR52DE5grK3uQ7d7AclmEx8rEM+lg0I7TQkfvCyhm3FVmJt5XUqUmo5ILbQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199021)(31686004)(2906002)(83380400001)(26005)(8936002)(5660300002)(54906003)(6506007)(6666004)(316002)(36756003)(6486002)(66946007)(478600001)(6512007)(66476007)(2616005)(186003)(66556008)(4326008)(38100700002)(8676002)(41300700001)(31696002)(86362001)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejlLTnRxczFUSmtLZ0ljVDRMdGVmVy91WXA4QmlTUC9VcnU4WjZ2SG9MQVpN?=
 =?utf-8?B?U0tWZytZR3B6MmRpOGY5U28rU0h4NHFLZm9PZGh0OC9RaUNrbTg2SFhxdXZM?=
 =?utf-8?B?eFh0ekY0RktrVFhvZzJiTDRtdU42ckZXTk1rTlhEWDVYaHNORW4yaVB1Z2dh?=
 =?utf-8?B?cVBhcG1IM1ZodmZEOXhCTndRUitYeGtCWXZmclBzOSt5VkF0eTVLWkdhVXIv?=
 =?utf-8?B?WHJxWVFGakFFNDV6UWpIWkVNWmdaZXVEZU9CSDA4OUZkNTBvWDNFQ29jSHdt?=
 =?utf-8?B?eGVVMUtvUHJ5SmorMWlmOWFURjlFMGJFVkxtY041Rk9mdUwrYklac1VvRTl6?=
 =?utf-8?B?VjVzS0FvRFlDY094T1hPSTFONGgwTiszeEhmcFFvRG9sWXFTSHdiRG1TSTB1?=
 =?utf-8?B?aW9RMTkvZEJrQ05VaUs5TUpObnZSZnJvdFB3MFBKVUk1emxpYkhLLzM4aVZI?=
 =?utf-8?B?bEVJd1VNTm1GSDd5dFplOHgwbzBWdDlTMXpqeTBldFc0ZkFDYWw4dTNScHZv?=
 =?utf-8?B?Wjg3UVJLL0RTWVZ3endTUHJvUG52RHhzRUp4UThIWVl2SjFqZTVhZExZOHZw?=
 =?utf-8?B?VnEydjZ5UFdPVlR2cEthU1BZakovK2dsTytRaldTRE0yM0ZMalZNcXdoSzhS?=
 =?utf-8?B?VlJmNlhZT3NwanNlTHc3K0dBVmkvVmIyMjNoVlJQb2JxV2VGYVdacUxVTmNN?=
 =?utf-8?B?bjlGY3lQc29FeGIzOUN6V1FVS1Y3MCtCR1pxTmFoemRRR2t4VVdmcDRsMHZQ?=
 =?utf-8?B?SUFBNmxkUlorQkp3OTJyTkZpN0EwSDMzNFhWVDRBNDJhbjIvaExRTW16ZUQy?=
 =?utf-8?B?aTA1V2J5bnBhL1l6SFRwbGRweGIrVmRIWDF0LzRwVUJ0VVVRcFBCZmI5RVlr?=
 =?utf-8?B?dmhtZWRUaGVoY0s1cXVvWVBpSnA1Z1lxWmZUK2w2Yi9SQllYcHZ0dlhqR3VW?=
 =?utf-8?B?aEJ6YS9BeVM4aUtoNXlPbzR4bVFIVkxDK0JTOVk5am9qUUZIRTBITWJEc3VV?=
 =?utf-8?B?WXRHYllQV2VMOU55bXBMTTJzVFNEenNjUWlrRDN2cHNrVlJPdDVyUnlZTFV0?=
 =?utf-8?B?VmZkZHZUTmt5UTZBTFEwNFdyanA1N1VrRGpJZ2lRSEVJNUY3eHRnd2RpZ1Rx?=
 =?utf-8?B?amliNVJjOU9jK2RtdnlZMnNpOWF2SUYxNUVqRGQybXBlaHVKZkNRVkI2eGZI?=
 =?utf-8?B?MVFPbW5Oc0J3c3dVekRWem1ES29iMDRncE1EeU1WdTRLaWx6bTExM1MvUi9x?=
 =?utf-8?B?dkJOaWg3REQvTHg1Y3lac1RmMWhlaDJTUkl3a3g2VGlFNnB4bm45NVJaOEUw?=
 =?utf-8?B?K2VreWlGVGtpcjI1K3gyYUJ0c1BPVG16cnQxQUtQZW5Dd1pxK2hzaDJoRktt?=
 =?utf-8?B?SHpiUnhEenoyMUdDOTlYQ2xCcEVoRWtaampyRnJrcktUSjhSZXliMDVQWFQr?=
 =?utf-8?B?a0VXTnBvMW56Zy9ZQ2xFY21jcmZnQ2E1aFh0VzJEdlZkbGY1T3dMSWIvWVdE?=
 =?utf-8?B?MFBGUjBoNSswR09raWY5Sk03NldoU05jYlBhWU5Falp6WlJFR3EwNzM3emo1?=
 =?utf-8?B?VmlIWUlTMnAyWjl5UFNZNWorRHZObUVHRHYrTXM1RVZxS3BnMXBXOE9rdlln?=
 =?utf-8?B?d1VrZWJid1lPaTZRRDBlZlVrS1p5OS9JM0ZqMkVMcWdhQW1yc0JnZU1CVnEx?=
 =?utf-8?B?R3l3cVN6Vlg2Rmg0TzQ1OXk3c3RvNHU0aWpubU5TUFo2WHZDYzBTYkZqZG5t?=
 =?utf-8?B?eklaV1VLZnBlQXZDbkZld05LY2YralMrTUJUUzdlNlpxUzJubG13dVNqQjQv?=
 =?utf-8?B?a3YvR0ZPRjJITVpORDBVSXQ1NmYwbWhja21GU1dkc2hLUXI5bHJBNCtnbVdl?=
 =?utf-8?B?M0JtSm4wTkh1OWhkenpSdU1RM2huY3pBRlVYK3cyZVRvZ3BUOFhNaWp5ZVM1?=
 =?utf-8?B?b1JhbW9ndXlrT0VqUkRzbmU4SVdEOXp2N0VhS3FQY0RjcWFxY0dRbXVYY3Er?=
 =?utf-8?B?R1MyNE1ZZ1h5d1dDa2NxbnlFNXAwMkh2WHdXSzBJenJZVGVCVUt1dmI0Nk5k?=
 =?utf-8?B?eVdicGZHTmpwc01HTGdkUnB5SmZwczVIUVZsa3BXU1lvUXM2ODRmY0tHWURr?=
 =?utf-8?Q?S9sw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e5a3d6-9cb2-45f5-dc66-08db310dd2a4
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 10:59:24.3250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o6b+O8SpyMcnuz/cV80GfyImbEDkRT364PdO13SZqtr6P5RBS0yotKpuQ5zhgSJV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4265
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
Cc: David Gow <davidgow@google.com>, intel-gfx@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.03.23 um 12:42 schrieb Jani Nikula:
> is_power_of_2() only works for types <= sizeof(unsigned long) and it's
> also not a constant expression. There are a number of places in kernel
> where is_power_of_2() is called on u64, which fails on 32-bit
> builds. Try to remedy that. While at it, make it a constant expression
> when possible.
>
> I admit I've only lightly tested this, and I haven't tried it with
> allmodconfig.

Looks good to me from a one mile high level pov. But I'm really not an 
expert on that type of compiler magic, so only:

Acked-by: Christian König <christian.koenig@amd.com>

for the series.

Regards,
Christian.

>
>
> Jani Nikula (4):
>    log2: add helper __IS_POWER_OF_2()
>    log2: have is_power_of_2() support bigger types than unsigned long
>    log2: allow use of is_power_of_2() in constant expressions
>    drm/i915/reg: use is_power_of_2() from log2.h
>
>   drivers/gpu/drm/i915/i915_reg_defs.h |  7 +------
>   include/linux/log2.h                 | 25 ++++++++++++++++++++-----
>   2 files changed, 21 insertions(+), 11 deletions(-)
>

