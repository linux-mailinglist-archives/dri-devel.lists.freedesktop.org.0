Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA5A811481
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 15:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A5110E2BE;
	Wed, 13 Dec 2023 14:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5743F10E79C;
 Wed, 13 Dec 2023 14:20:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X13SUa3UJxkUlctosSKrPRQUmMN6mvSCx7X7z5VwlpMkP9oQXHzbdksLDuBNtMnAUAu2dSj4gb848c+MJ7Hp+w16ntEHpEHTSAWos9mM0gzavZC9Xkuxd8nJttAT/JOjW0WMnK/7p2tJMovgNMzKVaWhW+mifsuWW2P4T6IUCFHqcD6Z/LGI09zLNX8MHA63jSihlcXDX2jZQZeHTYW3/Amf/Iiri0M18MXe0WPX4WXogth2v2gBiCKohQacS8ErGuKL4qZ4COhRAUSSwVghpibxatUmCYf2UdOCq9Qt5WnuY/E14Yfl/NSfqIEcb3t1bn8IgYbd9KokvtdrHDGWkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLl4SEy7dof1TWtfEFABWCQEHHSfHTbjFgkzppn5Ms8=;
 b=I0ErgkfM9PCfaRsgKBlonA9j5mwaXquDwVPwPX0y1PVysyOzeW3Lf41d/ucRz2vpIgt8SZEEsp5ONaolommiuROcENtnbyOQYL81Oy6BjPcIKl9ff0LgrBI0NTKPkW05jfV8/tI6n9puTos2cBqKz3iZuapkH6Ix1hwMMMtXHqBmpojZiyICW3bWEI5kf0uqD8CJXqPb9MM5UdWnEtIqg/1iE7MZuwJrM3q4N2mQ+cLTI37Av/a75TRFwa2p8PMciQk64MYl0aZOQQ/eOhBZxKzZ/tqWzhbm/Vvvo8DX3wFpZbNCXelIos6UDZV/dFIfVFbEVxDjwLW+7bdewjMwyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLl4SEy7dof1TWtfEFABWCQEHHSfHTbjFgkzppn5Ms8=;
 b=Uub+V8cTf+ilQSHOL3Fu1KpZMMauLsz/AqlkI/dh3KuuOZdcHj74ybyhESRYOALCG2vBA8aDbqM30jhHnvRaYDpE5G5ExTnFyYmxIjPkXIU3dNhInld3DfBmoepn/EXIt1+9F53bsO7g5ktl6Moca0UrEdoyZ+DLUEhEqAy0Yuk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB6484.namprd12.prod.outlook.com (2603:10b6:208:3a7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 14:20:48 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 14:20:48 +0000
Message-ID: <86b95faa-fda4-4354-97bd-a1c15fed0771@amd.com>
Date: Wed, 13 Dec 2023 15:20:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: Enable clear page functionality
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20231207151142.929349-1-Arunpravin.PaneerSelvam@amd.com>
 <20231207151142.929349-2-Arunpravin.PaneerSelvam@amd.com>
 <d30b7992-5c39-49f5-889c-c31d4994a5c3@amd.com>
 <CADnq5_PdWUDVK0mvMgyTyogMnT-DD2nhXHarO+BLg9BjtGPRGA@mail.gmail.com>
 <473652dd-8ca1-436b-aa52-eb85eb0e98df@gmail.com>
 <381345a6-64bc-4cda-b787-fc431827b289@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <381345a6-64bc-4cda-b787-fc431827b289@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA1PR12MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: fce7b275-3b5b-4be8-f157-08dbfbe6b3a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hf1RVry0mkoqI5J+I9YjZhv+o2TGhijbC0+4ps7Wdg9NJk3irnRAII7hqL22L8bwl3tFWA8zhwFB8eGzxIyRmvfya0iWwq/D9Xw/mLVC3/lwUoj51R3EP/rKzDJv7oXAdl3F8S7nJaiord30o8Qa+ZZ2/exrHnJfcNEBVD7HG7oybTlHOCKjwC7NlVbFHIflm2jqyZhrJcH8nT1JXMTuqrLAstXR157Bj3FM/322BiSNitPe5VnQk9tUG2+0yjQ56FDf2Bcr501v3bAWP/FD2xEqWZSigtfljxyk7WUvYmcAtFyM2iL7Kr63qZe5MzGAhkEzCAi04LHk6/rNkzf4acsq8/NWVPN5+iO9z/6/lqAgKM1AmRluFoue/WKy/osCPEJyo+Q+6/roqe4MmQvpD9cSluXOSjalV5aohHxV6D0PoJI0vM+ovG/ir1bBGoqYge3RtMW+of4+fVQLQt4mGcTEiY8iJQ+8Fx3nm5RORaGzrT2npui2ENQxPJQEeupZQfgaQos/Gfk85HQAH+hMLfyZxSkZ18OlCWbxphVCRbi7bFz/hK9ubeGjNsRQr8fhTXxriqW45J+OFRlMZTxSH8MyjEDMgcBvhWjFnzcuTIwOe/OzzhaxAhvfSM+OkyputPceJ4SqZTnzx8gy6IMe1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(39860400002)(136003)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(66574015)(83380400001)(31696002)(86362001)(41300700001)(38100700002)(5660300002)(4326008)(8676002)(66946007)(110136005)(66556008)(316002)(66476007)(6512007)(53546011)(26005)(2616005)(6486002)(8936002)(478600001)(4001150100001)(6666004)(6506007)(2906002)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXVTM3dHNDJUVEJzT2p0bGJVaTV6dUNTWjYvRXJaTlk4U3VEd01Xa0p1TGp6?=
 =?utf-8?B?TENTYk9JWFgwd0dYaDFkcUU3aHd2amxPSkJ3cmQxd2s0R1Y4b09xdE5QcXFz?=
 =?utf-8?B?bVVWS01sZ2ZibTdFUnNtYmRuMVJoOSs5MmFGSUFNaEtyK3V0SnJxLzdSVkhy?=
 =?utf-8?B?cTVCVU9EL0pKWjRvalQ4U0E4S2Q4a1FhN0pJekNIZFg0UUEwNCs0ajdsYjlB?=
 =?utf-8?B?dzRLdFpKWmwyVjQvTXMzWndFME5Qa0lzSEx1R3ltaE5ycnhPUEJBcnBzS2FZ?=
 =?utf-8?B?NDV4WVJsMmFMZWxoTTBiYldpWnFzNFgzV08wRzZNUGlDa2hBWk5hdE9pbStZ?=
 =?utf-8?B?TUFOTVhTZDFJVW5DaWhidkIvRDd0NnhkeE5ZWEI1c2tOZGRaK0Y2bkFwVloz?=
 =?utf-8?B?cnJESEEyRDB4RDhwVUZHMlRYRHUrZHNQVGtnaVMwUjZxYVF5aFlZeVk2RVlj?=
 =?utf-8?B?YWRiRCtWZ05OWDZBTXlFVzFTM3Rra2xoSjhWb2NhZVdrTS9LcjJIcGhxa2pz?=
 =?utf-8?B?cDJ1Z0hkUkZaSUlldHhZcWt6NDZzOWU4cE9JVFdjWkc0S1grSUN6S0FMT1VU?=
 =?utf-8?B?c2ljSlRzRzNKM3NHRzFBRS9QTytiWjVjczdBOGxXUXR3SUhUakZVUENKZTda?=
 =?utf-8?B?b3Jtem4zSVJwQzk0RXMveFFmSFYyNG8rYUFEdkY1YnFUamRnSUpCTnRtQTl3?=
 =?utf-8?B?OHRYWWQ5RUdIWDFZb0QrdmdPRW14dThkcXdQMkNENU9Dd0F6OFd2d2VBbTQ2?=
 =?utf-8?B?aWVEMzlpc2p3a0FrU0draTFhOGkrL05WM2dYVU5IVFE5ZXJzK3FzR3poNDE3?=
 =?utf-8?B?b085c2ZxRkU0Y05DV2JEcXNHcXRRZUFGZkpKMm5UcVBCSnNYSE45T1VQNjdX?=
 =?utf-8?B?NXNJWkljZE1leWxJdDkyYnNpOHZ2ZDRzeTdVT25CVEx4cnlmMVZMbWhzRmdn?=
 =?utf-8?B?OFdMSGM1MjR5aDg4KzFzRkg4Y3pYbThGaFlkMWpRVmU0dER4ZGRCTUwwVGdU?=
 =?utf-8?B?bVVXajM3dkg5OUtyekJIbnNJOWdYM3kzT3hEUG9CT3dPaStJT1p4LzBCVDRZ?=
 =?utf-8?B?VXpQaWN2L1dFZ3plcVRpbGpKdDg3S2YyK29lTGY5Qlk2c09KZ205czZMN1k5?=
 =?utf-8?B?Qk1Gc2hmSFMwaXhUZFlnbitQMUdSUXNQVGg0b0V4cXNQNXJhRnJOeGhpY0Fj?=
 =?utf-8?B?cFFyOEpITUZ2bmQ3clEzZjdOS0xGMTViVDJBS0NKeU9RQXV3Z1FFQWFCbkJ0?=
 =?utf-8?B?anVLYUJjWmZaVERmYlU0M2I0WWQrUzA4QlJLcm1CNkJkV0libkNMSjBQalRU?=
 =?utf-8?B?dWpUR2pMelFoZFhYd3pUa2NHeUdxaUI2bmdCVTVTaDFxbisrRzdTdjhNKzg2?=
 =?utf-8?B?a0dYTjZJNUw5VnJHWDFGWitWcDg3OG5TdVZtZWJuM0FkN3hVTzI0cTUvY2JE?=
 =?utf-8?B?RU1Hd0lFc1BINnJuelpaQ2NpRHNoVWRVbVBNT3Z1RHlEblBENExBZU4rdzNT?=
 =?utf-8?B?UGtKVEFyQWVsaXFWSzlSb1hxZlorM1hsVDdUZlh5MVd5azBudTFGOG9GOE5G?=
 =?utf-8?B?NzVaZ1oyekN2QjQxcngwRHlRci9Qc3diL1ZEcjR5QS81czdCc0h0NWdydy90?=
 =?utf-8?B?NGRmZm53Q2dOQkRLbnFzaU83K3lZa2FRSXhaNVEyaUE0a3lscG5EbjFwUWlS?=
 =?utf-8?B?eHZvSUdaZ2xaa2ZZU0pST21CRWQ2N2F2WHZXYStNQnhYbTFMMjZwVW8xWnhi?=
 =?utf-8?B?Uk9scHhUU1pKWkxZeFlrUTZvWWFSTFlwVGNmY2dzaFJMUG5QR0RnMGxGczJu?=
 =?utf-8?B?R3BDZmNORTRNdCtlRzMxcmxEOFBJVzNWVWMydk1oOXZIV2pJU1poRVVvSUJ5?=
 =?utf-8?B?RTZFT1JBS09yUGRBTUtlQ2llTjY5ZnVnZjYwbUdhbXY1b3ZPWE9ZU0pPVzdC?=
 =?utf-8?B?WHBCRWdtNmpsdzk0NzVvN2dvcGNrM0t0Ymc1N0RwMG9BcUdoZ09zTTNpd0hv?=
 =?utf-8?B?NERuaUZNYThDbnpzVTdrOUI1UHJ3b0VFcWtPVFNpYU1YS1QyN2N5bzZCSzFz?=
 =?utf-8?B?dnI3cDZGOUYvVGx3TENKZmVRUDVocnQ1ZS9TNDBnbUpnUk41Wks5SGdRT0dx?=
 =?utf-8?Q?3+SkBCeiTy741n0dtTWGSCX7r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fce7b275-3b5b-4be8-f157-08dbfbe6b3a7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 14:20:48.0116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6KmGgCLJGUrx75TlvW6B/ieUOU9S0AuOngk+2qCTtp1wmSxy4PcdkHeCZXgqfh9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6484
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.12.23 um 00:32 schrieb Felix Kuehling:
>
> On 2023-12-11 04:50, Christian König wrote:
>> Am 08.12.23 um 20:53 schrieb Alex Deucher:
>>> [SNIP]
>>>> You also need a functionality which resets all cleared blocks to
>>>> uncleared after suspend/resume.
>>>>
>>>> No idea how to do this, maybe Alex knows of hand.
>>> Since the buffers are cleared on creation, is there actually 
>>> anything to do?
>>
>> Well exactly that's the problem, the buffers are no longer always 
>> cleared on creation with this patch.
>>
>> Instead we clear on free, track which areas are cleared and clear 
>> only the ones which aren't cleared yet on creation.
>
> The code I added for clearing-on-free a long time ago, does not clear 
> to 0, but to a non-0 poison value. That was meant to make it easier to 
> catch applications incorrectly relying on 0-initialized memory. Is 
> that being changed? I didn't see it in this patch series.

Yeah, Arun stumbled over that as well. Any objections that we fill with 
zeros instead or is that poison value something necessary for debugging?

Regards,
Christian.

>
> Regards,
>   Felix
>
>
>>
>> So some cases need special handling. E.g. when the engine is not 
>> initialized yet or suspend/resume.
>>
>> In theory after a suspend/resume cycle the VRAM is cleared to zeros, 
>> but in practice that's not always true.
>>
>> Christian.
>>
>>> Alex

