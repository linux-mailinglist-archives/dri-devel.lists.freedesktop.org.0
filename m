Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA11509C35
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 11:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803DA89DEA;
	Thu, 21 Apr 2022 09:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993B110EAF7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 09:23:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIy/29iP1I6kt48Ltnhyv8Sdgo/APG1+0lXRkxaN1XiUCPDrOe2GVGMsOF3d+QJ3y12pXsDVSWMsevfSlMxHEfYc5A8Eg/V0xxvTELamckDDUE/9YnL2aaAiRUqeTomjP9wc8JUi5ES9RFJzFAaAOMziOQMwp9QXeMxBAgIvoLWKr0Wg4lQOA7GqVN9RAq+X3GBQ2EfJ+IHBnpRcgpNHqzjKzkypKSs/GKI0BOf0UFebiL1E4hgc/prt0eFlVY1lGndVXTtwNCNVtJrOl0wsIv0FuEHIuSnfX2UdT05hRDsX8tsgHoCyoojRgC50tCivN8oTKD4tTdrt+CwAdcMNOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIjIFsfSafEhhw8zzz1vK3cjZ69gqrJhzuUXgc8y6dU=;
 b=nvWvCyT6hNExHxj0Q4C1rpj47OTcWwv6TWveKrZidUQ4Jfqdb5yB2ffWYy322VwELTepSxG3iky2UlVxtktPe8NMlutHQAjGfMV093zZbxJRr4uath5hQwKh3NJbEti+3Rz1cLY48w9jxkeKOkWNmd1uLW0Q/z1ymA7p6R6XKdCyMaxmzQLAp1MbCFubIZPpvB3Z7ZwTLeADVHXPHqLOCjkvNbarJ+GLZJJstaYSAlJ1IzX6gqYa3SMa3H7FrKIbWOJM0copix1Gec8c7ooLVSXfWGe/3+gkpc4yBFejvS66HRZ8h2CPPEqfjdW1QGfutDN1PJPSd5FxN+jwI9YUtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIjIFsfSafEhhw8zzz1vK3cjZ69gqrJhzuUXgc8y6dU=;
 b=VTXDpnkoY3rnrLam8YYfOUw649OZ0A4f+kwecGx7bZCJC65PR2fgkahiUPovjrGDLWEwgyQc1XFl8Rk2CaOhOsOap+L/dSaDqegNkcrnmyGUA/v7+0+98LmES03lp9xUV49gID2hKk+r+PdYlFr024ZfH/rYoW2aMXeSf0z9k6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5272.namprd12.prod.outlook.com (2603:10b6:208:319::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 09:23:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5164.026; Thu, 21 Apr 2022
 09:23:26 +0000
Message-ID: <476cdf4b-7b65-c056-abf0-110f442e1cc1@amd.com>
Date: Thu, 21 Apr 2022 11:23:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] drm/nvdla: Add driver support for NVDLA
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Cai Huoqing <cai.huoqing@linux.dev>
References: <20220419135908.39606-1-cai.huoqing@linux.dev>
 <20220419135908.39606-3-cai.huoqing@linux.dev>
 <2aeee5a2-b5a5-348e-ccf7-04f49e1119da@suse.de>
 <b34fa2a5-58b4-6270-2d19-2ad591e3e250@amd.com>
 <dec16771-03da-2c49-ae53-9cb49d64c761@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <dec16771-03da-2c49-ae53-9cb49d64c761@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P191CA0108.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::49) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b5646a9-fe70-4030-898a-08da2378970a
X-MS-TrafficTypeDiagnostic: BL1PR12MB5272:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB52726D8D59730FE6D152383D83F49@BL1PR12MB5272.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VE0TDjrtT+4lOYkij6mlXFPXvsVqngXsW/kPZoePVk0PH2HbTE1Xbs5KJJksvYK+NAbKVc7YGKxM4y+s9V9yoLifbHHvfN0k7aSJ7ntkijd9kpCyNV9VnKQYgrTefrdn8Wo2+aLeDuqsiM/sigh8jjHXht1cg0kGJA0VSF/oOnm5yv8tpnEosxyd+C2Lq6ZefXQun9p9hIv2CA3ykW3IQJnP4Uc0G7nlX8gS5I174AgAf9UGSdJe2eF6psDrN1aFmoMGH14SaAcK8B+x0kETkrKM+fdX/UG/ijNzb4/6h8ZINGKl5znhccHoA5VDJqTfUu8igYXp3tKq+BJ9uI4zW1ZpikEFLO7lNUbgbnIyAAQaVhddbdra49TAgwm/PUlnA+vxjQmlTGSl6AUcBGwryMtL0XWx6jb2x1IOJZqkd/G/LZS6VNQNseqL1Qevwap0JEUJokfF4uwt2YOb/NwJ8pyvnBdRv0ZQpesRErDDNSelmJUNIdA1X1aOFmHXTdnqLIyRE9FqqNO0iMuabN4Yqih12H+lGaDpqH3T7TahkeVovMWEu1CtxnPAZZ9v/tJmOcPHygRxwbEJALfzdq53UsurWJHAvq/O1p+Owm6KbdNjQh485KGHULcIlM4JajIHU8ifAbt2+kxNeDZ25DzIrXrg6YR/R/rCKvjsg1Hq3qT5A7BHeDHhkkWKZVejxaaXxi0WJQPZvrCi5qivgoyFgE2mX91rLlze0sJqdkeTRKg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(4326008)(8676002)(186003)(36756003)(2906002)(83380400001)(31686004)(6512007)(6506007)(5660300002)(86362001)(6666004)(8936002)(31696002)(7416002)(6486002)(508600001)(38100700002)(66476007)(66946007)(66556008)(110136005)(54906003)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2NNNTZiMC9RdWhkdmJkWTNRSXZMZGczNHh6WWxBa0Y5cmcvMXJaVW9qSW01?=
 =?utf-8?B?WXg4SUpmVTRmRmtDcSs3bEQrcjVoMVcycGFpejd3Z01PUGVZbnpZbzA2N2p5?=
 =?utf-8?B?NVo3MVZBN1U2M0NaWWpDQXk0TkdMTGIxYU1lTHJKZ1lMZVZiQ0I2ZTdsbTFF?=
 =?utf-8?B?dlB4TXZBRUY2SEVtajhCdThybnFiNldhbUZ0NHJHZGZUbGhxcE5uYlZLdmdo?=
 =?utf-8?B?Nk5hUmlGeUlTaFdDYVNVbDNjS0tmRTFvQTRDaENpODJzRW1kT3V2VjVGRDFl?=
 =?utf-8?B?RWhmN0h2bE14TGJJOC9venlhZk9mZTB4N3o2Nks4Y2dpWFhDMDRrS0Rzd1FN?=
 =?utf-8?B?cUxqYUtkbTRBSkxOZGU2SzI5NVN4ckorckxpT1FqSmVzMXBKRnY2VWpNdkxM?=
 =?utf-8?B?TDlEY0x1VThCdjR4L0lOdW1Fc0htZzhBNk1tc0hyR3BkcWV4Q2FwMzRUME9n?=
 =?utf-8?B?MVFkM1ZPSVJXSHJwVjgwTlNlRVdXZ0dYQXdDbXBGVC81b3hvSUpCa05ES0pH?=
 =?utf-8?B?eVA2K1Rjb0duODVuT1d1RkF0cU1QMTcwUjAvRXNXdHRITWhnY2tHYkYzN3dn?=
 =?utf-8?B?Q2lnM21zOEM2ZjdCbUhiTXVwOHNrMkY4MklyT01JN0ZNVElBOFMrWEpoTldy?=
 =?utf-8?B?cStmd3ZidGJPQjk4dkI1c0s3eHBZaGs4Ym9KbWNoT1JmY0NlY09Vam5URUFj?=
 =?utf-8?B?UExkc3Y3dTkwTnVHNndGZ2kwRXo0UUtySmlRZXlCQzhWUklMeDNXdURhU3BD?=
 =?utf-8?B?WDNJVUJ4ZlBFNFExc2cyUEtVeTAzcUtHcWpQK292bDhjaEhwSGxSY3lQc0JK?=
 =?utf-8?B?Vy9LSkVERk5TWTFuaHl3aXBpL0NkaGJ3RHBWV1hrczFsRU4vNm1kN3RzR3ZU?=
 =?utf-8?B?b0ZrNHhrSHlqUjQydUYzcjloRlVDcFRsSXRhNDJmSWZBZDM0Wm1lK3dSbFl0?=
 =?utf-8?B?dnFiVzlDWlFXYVpzOUlkR2tGQmdheWc3QWxQTisrdExBNUNralg4Nk1ZVEFF?=
 =?utf-8?B?RXNRV2t4bUxtbGdHbW9WZUsrTGdGamkzOVJZUFJaZ0RIMmVLZmpFdm1FWFBF?=
 =?utf-8?B?NG9MV2VnZzA0TDRvS3hSMU1qVlJpRUNoa0huOCtDcFVPN1FYSkVhWmg4dVQ5?=
 =?utf-8?B?NDcwZUxnK3Y0VnRaTzRaSFl5QVhyVnBSbEVubDIwOGVIWjBiNXpMcjR5Z3Ji?=
 =?utf-8?B?VEVDeVhaYlFRVDlXSHFiWVN6NnplSUM0N1B1c2dRc0k5SkFDZTE2bHFkTm54?=
 =?utf-8?B?QTE2N1RWdm1YRkxDRi94MU1YMjdKZTU1cWtjYVlPWURvby8xVXhMcmdkTjVM?=
 =?utf-8?B?cm44UGN4ckJueXFIUHJ6QzZoUkVXT29wd1dtSmlFdGFQaXhDSXZoU25GdzF3?=
 =?utf-8?B?TFlCSTdHTFFyQUtEMjJLUWc2RmZycHBzVGI4OGV4Y1VPbWM1OGZoaVVLMHJC?=
 =?utf-8?B?UFduVCs5dDFHc3ZJSkFnWFZ3QVErcDFMekdDU2NrZUUwNUQwUzVaVzNLK0Rt?=
 =?utf-8?B?bEFpcGRDRnFDQzh3a0kxMnVFdEU3OEJnK0NudjJmanpOYnUvOG12cVdhR21G?=
 =?utf-8?B?OWFyMThzL2NYZFB6RXFFZVpJS0t3dCtzaXVQQ0JCL1Q2c0tLdnZIYUp4Wndq?=
 =?utf-8?B?TEUzMVR3UWhhTFRpYld4ZW8wME4yK2x2K09UcnJPcFFpK2kydkVqamw2SFFk?=
 =?utf-8?B?U0NhZW8rMHpySy9XR1JFeTNUQVcxbHp3bUJGeldUKzZiSkxLeCtZcjUyTmtW?=
 =?utf-8?B?ZVNEVTJ3MjArZEUzYm9ZaXBnb2xhRFI0TXg2ZGJ6bWMvNGZSOUNyS1J5MWZQ?=
 =?utf-8?B?MVAvNDFJNGJhL2Y5SDhtQTlXd25nQmMrbE9pVUNaaXEvN01HYW5TZ3UxcEcw?=
 =?utf-8?B?YjBqWTZpMWdGMGJ1eFBuV0hJSUFNTFV5OEUvZG44bS9SczVmSFA5aDlVayt1?=
 =?utf-8?B?RGh0SkxxM05FOUFaT2QyQlFablVnQW56K0FUeThLN1BocUNmZ2craC9CR3gy?=
 =?utf-8?B?QzB4eVM2Z0QvV0pZdWd5U0RGdDNiUHlWTE1TVVYxWG5INEMzU2ZPSzk3blVo?=
 =?utf-8?B?SkNNTmRMa0dKVW9jdVZGSHJnYWNDTExMT3RManZSVG8yYTVCZzJZdkhWVSt3?=
 =?utf-8?B?eFhvMVRLZ1FLRk5zcDVXazgydzNxNVVIZFpPc1Mra3Q3cEFSVUlrejBaY2JY?=
 =?utf-8?B?YkpKR2pEMndUblo0S0szSGZTaHUvMFlSU2MrR2RFcmlKQnNYMzh2aUFLY01s?=
 =?utf-8?B?MTlGNnkxWmdaeVpJN3Bac21sU0VjeGZiNldvUEJkOUNxNDZvZ0tOK2JIZElU?=
 =?utf-8?B?SEtBNC80MkdxU1VMNnlkRE5WM0p6T0pXRWx4ODhJYmdmbzZKYkFlaHlZNlBN?=
 =?utf-8?Q?Ewjvn6pIEMNWTPx0C+mF8z5E1eSeIM/AJmeKr+0QBONqn?=
X-MS-Exchange-AntiSpam-MessageData-1: 4EHarfSHLHPawQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5646a9-fe70-4030-898a-08da2378970a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 09:23:26.6100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPyfy1aW5vfQAlw9Ja1VRJ9BdiVPxY5BN6uqMaNjV8HssiYg4jRHdTTb15YKoysN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5272
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.04.22 um 11:13 schrieb Thomas Zimmermann:
> Hi
>
> Am 21.04.22 um 10:34 schrieb Christian König:
>> Am 21.04.22 um 10:30 schrieb Thomas Zimmermann:
>>> (Resending, as some MLs didn't like the size of the origninal mail.)
>>>
>>> Hi,
>>>
>>> thanks for your submission. Some general comments:
>>>
>>>   * some functions are prefixed with dla_, others use nvdla_. It 
>>> seems arbitrary to me. Please use nvdla_ consistently throughout the 
>>> source code.
>>>
>>>   * For reporting errors, please use drm_err(), drm_warn(), etc. I 
>>> suggest to rearrange the error messages to not be located in the 
>>> innermost functions.
>>
>> If you plan to have multiple instances of the driver loaded at the 
>> same time, using drm_dev_err(), drm_dev_warn() etc.. would be even 
>> better.
>
> I thought that these functions exist, but looking for them now I 
> cannot find them. The macros DRM_DEV_ERR(), etc are deprecated.

That's what I meant with the comment below.

I wasn't 100%, but dev_err() etc.. seems to now be the preferred form 
since that allows filtering for log messages of a certain device.

Regards,
Christian.

>
>>
>> BTW: I'm still absolutely not keen to enforcing drm_* log functions. 
>> So if you prefer to stick with pr_err() and dev_err() we could 
>> discuss that once more.
>>
>> Regards,
>> Christian.
>>
>>>
>>>   * Could you please split this patch into smaller pieces? It 
>>> currently hits size limits of some mailing lists. Maybe add the 
>>> register constants separately.
>>>
>>> Please find more review comments below. It's not a full review, but 
>>> at least something to start with.
>>>
>>> Best regards
>>> Thomas
>>
>

