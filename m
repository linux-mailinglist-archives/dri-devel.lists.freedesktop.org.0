Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1D1592B86
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 12:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C3B11B4D2;
	Mon, 15 Aug 2022 10:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCE318BC59
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 10:42:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMXMlYTVAf4fMjy60KboL5eYpaz4+JDaiFTNqKwwbFKqezjiqv3WlfcJcTIt62cf304tBm/o40sFq/c7By54p8xgumhiymfZGwP8VdNgdyMztuAxJS4Hp9mzyOUq4KYAtDlrWj8yP1vf4SwZoXo3ut4c/2qSnwWeBs/KAkOBlyUcQ8j7BdAiqAkBFVs46QR8GOVVCTBnugQHZ+5g+X7kZeyqe5VRg2zKd1GWz2X7OX9tlbDOrKJhnzxs4VuznaiHk56Ioq8N4jKmgiAyAhSvEdLsqa37ztVwAS6T2eNrJYvhgEiEw+sW9IL5m/xtfHLjeOFbXUCbfBWuZRyCjNYu3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdEM7mASNWY/WlXxM2w5jqRvCc2RGprOJ3UxiIjEE2Y=;
 b=Xr2tuAPUT06EbcVNCGb5/vKmR8fo3Lmxi3m7dCPQ3srRIgOX6K/SujQqNc6PVZuG4up+Dqg34o5h5ubGhzmHOUW9mjWCfxixwI5wwhhoTHtp8VAjCjLsdpL+Cvl8EaOqvosijRBYbXL+YceYhAODAdAY7lsjl/KuWrDcGxE7JRxTcmLYtiRp3g6uLX4f4zqGQ0ocXa3+3QL1u7gKykjgyIvsXvuMdpCcnNsL9/DMYrMY6l0w4Stb+g1YH3pwDZEy7juZmZu9c8DiRAjcQ0exw/cW8rZudawErkE2N9OxuHCqrsUb/7BHi4wxjUp3lln+fXEJMmu2vBfAORhHNkOb/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdEM7mASNWY/WlXxM2w5jqRvCc2RGprOJ3UxiIjEE2Y=;
 b=I9yKjhHsTz3Ew70RRsxTIVNH/oea4+fhaSx8FGJPOK6qq7TSjEtdmpmojLhaqMbZWQYFLVPVjVeUgfRsorkYaMczwjv4Bs6iTg+6m5k7XHW/o97V1GLOKLMYzJ/+8T1Yaes3AVFMxkpNJE30Cxip/HbTTn/xM3Y738uk4EF7IlE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB6158.namprd12.prod.outlook.com (2603:10b6:8:a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 10:42:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Mon, 15 Aug 2022
 10:42:28 +0000
Message-ID: <2e64c037-ee5a-0c60-5dba-2e48bb437014@amd.com>
Date: Mon, 15 Aug 2022 12:42:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] drm/ttm: Refcount allocated tail pages
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Trigger Huang <Trigger.Huang@gmail.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20220815095423.11131-1-dmitry.osipenko@collabora.com>
 <8230a356-be38-f228-4a8e-95124e8e8db6@amd.com>
 <134bce02-58d6-8553-bb73-42dfda18a595@collabora.com>
 <8caf3008-dcf3-985a-631e-e019b277c6f0@amd.com>
 <4fcc4739-2da9-1b89-209c-876129604d7d@amd.com>
 <14be3b22-1d60-732b-c695-ddacc6b21055@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <14be3b22-1d60-732b-c695-ddacc6b21055@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0209.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::34) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7de8b93-6189-4f70-ccba-08da7eaad995
X-MS-TrafficTypeDiagnostic: DM4PR12MB6158:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BDD2f3kXN0j78ISkvJTKvaYziZsdFefQugRGnwHkdK4YKYfIZiPYhm5SRCjA0CfWjudreATdcO8sisaO5yCxIxiQPiF1Jjf1zNS2JQAmk/VUV3i+CafXckXp6cvblnZ/FNcgRGZlLtG1Si88G3uYdBI+Gy3bmPUbT5kp2JBygpAXor9TryOXlxB+PFxPM/lXsofDIxyx+YnKs5RZ13R4l909QBocnPRRd/6L6k5TjkasmWLuyEtJZ7BEbsUW05UWmY+dnElwuU1JXVl97uiYP+ApfF997bnIoAfhAT/sdicVcN7XrIuQY95GV/P+d4G2daHz8I8X9kGggc5JTsARRRfdfNRT/Sp2sTlVk3j7PZBql7oo+NnCt67tMbpU/Mffe/zodlma+K9m7ljPJYeusqiCTvvfj6p6xxE6iwJQYBJ/CAirYwcOrrSLyPX7fr5GdNCclr3dvCBtGjxCHlkFiFgp1N8yy1llIRvBqO3tME165jtGkkr7Ms13zM+a+y6EsfuLLCgGpGz5eoBJRazROmbd5dsw5S0Gfdq8B1mEIr0N0zaxray7ABPZSCPa3fpyjx79KMuSUqxYuMH20KmcqkGFF/htCN60zWxgj5vVULmH7BCBrKIH0iW7nZA274XBkiiVcPie7yj8U6Emhv2286083zoVYfyoI9g17efWA5DAaAk4HRPkSZKqhVt0zmRDGmwjjWw8e+hMwBz4yiZsefJzsoNLKF7g9JCpG+pb6dDBMzZ/ZIg8CEqfU4DcRdmDougg73uJ6nswpJPKUcZJXEoYLgo6a4ZMgPIZbpaDen8jBgGmHf8GDfIDIAex994fhbaLSdYcKZqwWLH+xiJ73A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(2616005)(66574015)(186003)(83380400001)(6486002)(478600001)(41300700001)(38100700002)(7416002)(6666004)(5660300002)(316002)(110136005)(2906002)(8676002)(66556008)(53546011)(66946007)(6512007)(4326008)(6506007)(31696002)(36756003)(8936002)(31686004)(66476007)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0J0Tm5BRDB2WXZnWjB4MnBndmUvL0gxNTVMVlFRUWNHOFZZdEtSU1dac0pZ?=
 =?utf-8?B?bzJXMWdVcHNDMkc2MnUwdldocUxYdTd3MHVuakxTNkYzOU5NUy8wL1NVbi9j?=
 =?utf-8?B?d3pyalBlSjVZS1pYVlR6Q3dPdmltUjEvMEhJUk5jblcxT3lzODRBckszWHZI?=
 =?utf-8?B?RFIzc1paOGZFNTNRV2hjQnVMbjFBTllBOGZXL2xxS0tlUkVLVEhrMDJ5aUx5?=
 =?utf-8?B?U0lhSldvZFRieS81ZG9oZWU2N0U2amM4bEFSelJ1TmtLdFJ1MFhsc1FLbmVW?=
 =?utf-8?B?a1VwMnA5aWh0SWdueWVUWS8yNlBhUFE3SzQzTThNazRwZkJLUDhqcTU5U24x?=
 =?utf-8?B?OFV1bTBBVTdDcVVzSVJ0aldhTTlxYTFiVWx4MWE0cEkxNWJGenBLYmd5RDFP?=
 =?utf-8?B?Z2NCU2FXNHFLK1lnaWlpL1hPVGMrQzV2K29IUS8zV2dmd21MbWhjU1dFT3Vu?=
 =?utf-8?B?K3g3SWNYZDdQR3lsc2JyVmgrWlhzaHJTWEVrWWpJc1JoUW8vNkI5MmY2UklK?=
 =?utf-8?B?QXdHNTBZaXgweGpKRFpESWVlOUJKL2ZTMWlKbjFNTEFNR0xpL3NXMjIyb1c4?=
 =?utf-8?B?VFRGeER2QXc1SC81T3V4ak91cFBRZHc0NVE3WUVpK1ZJWGlKTnYxUVl4WmRX?=
 =?utf-8?B?SHZ2KzU0RkNRb2dmVUZhYU1UeE9IQnZqd1BpZXlHK0ppYSsrMGRyK1RjUzJS?=
 =?utf-8?B?aHVXcTVDbU4vRFFiVGM2c0d2a2dzaE9wc2VVRGtoMk5aODU2M2oraVlpc0pi?=
 =?utf-8?B?MitIQUVma3FXR0RDVjdOa3FTdlpvbGNHWGhITzFmdnZWNU1rZWt1WXJpV2th?=
 =?utf-8?B?NlJtUWVaZUREU0pEYS9zUHNCVlozR1RBcU5CNGlnK21tQmx0ZHNxUUs2b0pu?=
 =?utf-8?B?Z05sYU1tZEZJc3VHaExkNXcrVnh0N3gyRzJnK1V2MXJoKzQxNWhRdzZ6VTlx?=
 =?utf-8?B?SHlsQkp3NnU4aHRkR0M0QWVoTUhqMHlrMjhVcHhxa1N4eDYxeUx1UVhScjJu?=
 =?utf-8?B?bkFnTGpseEhPckI5OC9mSXBLNmNzcE56R0tPL0M3SVJMSUlpS3d0WlJwdTdj?=
 =?utf-8?B?YXRIN0srUFpqYi9sbnViWGVNdlZNVG1jUVhGcmFtblNmekFZT1RKTGxtZkJp?=
 =?utf-8?B?Z0hEQzcxZG5pV2Z4YjN1ZXl2cmNzVEhTNWFQUTU0b1pmb1krb24yVjNrbkxM?=
 =?utf-8?B?Q0hCdU1LcDI3ZUsvSU5jaXFtRXZyUnZ0OWFLQ0dLQjhycW55cjFaQnJpeTlO?=
 =?utf-8?B?TjRyY1NXbnNZaXE0YVFReVJ0RnF3TXU1aHYvY1RNeHhFc2k2UitlVndVV2ts?=
 =?utf-8?B?UUk5RllsTisrbDZSalI5SHowV2tqNnlkNFU2RGNVVGh3S1M5UUFyZEZuRXBz?=
 =?utf-8?B?OTY3eDdIQU51QmhBaHY4N0hIT01pTDViT0NEVU4rSnZWK0duTHN0UVpBZzNJ?=
 =?utf-8?B?NUY2cUM4STlORFQ5akdJMTUrMXFVdUJlWFRzM3EzcmIvc3lvODFjUkRmdWln?=
 =?utf-8?B?VzM0Y2ZWWXp4aXRid1g1aEk3WHJhSVF1OTVJbXkvZStqOHpJZVlGYW5LMGRS?=
 =?utf-8?B?WEhaby85eDM5NHN2ZzBPRmdvY2R0OVgzWkRrdWkzZ0RYUUpTQVd4VjF3ZHZF?=
 =?utf-8?B?clpHNHZtU2c3ZVovdHlEUno0cGl4SGRocWFTOW9rQW8zd2U5YWNmVUZjWjJE?=
 =?utf-8?B?RlVvRndoVkJCVU8rU2RaK1ptZk1qc0VZaXk5U3ZWMFM5YmtnRHIvSHN4UDhr?=
 =?utf-8?B?VDlEeEhIRFRHMmxodmQrN1hwOW5FM05OTDVUNDA4ZVN2NnVLMHZZT1JtSm00?=
 =?utf-8?B?NW5zc01ITDZoSjdOZWdsNkRFUVo1Sk1oZ2hSOTdWMExxcEJsVjJCZVBXMms1?=
 =?utf-8?B?QUlsc1ZJTXo3b2tBOGZHaDRxS3dNZWh6ZTU5UDJueXhDampjbzY4Qy9GbFFL?=
 =?utf-8?B?VkJneVpHMVFxeEp6eDRwSTE5ZU82VkJiZ01TN25pazB3OXdUNUU5V0hqTkVO?=
 =?utf-8?B?ditsSXFDSTFNWEVaNS9UR2JRaW96cm4rb1RGejhTVTZqVUErVmJSZVlob013?=
 =?utf-8?B?WURXV1BnVEtHTCtzMERSUFgyWVlOdTlzL0lHTURVZjBRYXNGSzNGSHJuNFNY?=
 =?utf-8?B?V0JZbXp4QVROZWtIaFVOZUtTNGYzZEIyRGNyVm5KTGdUTmExQUhEM21RbjZo?=
 =?utf-8?Q?/7EJIuQoqDnytSBLbzxqttYe/3ZQX7sqz1dz388IBcaA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7de8b93-6189-4f70-ccba-08da7eaad995
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 10:42:28.8859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vpg0KmSUOQ5zTLiowY8cdDJhWJPf+5Hlz7L0ez4awi7PQ7FBGKGtpoCg19GGe/Ej
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6158
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.08.22 um 12:18 schrieb Dmitry Osipenko:
> On 8/15/22 13:14, Christian König wrote:
>> Am 15.08.22 um 12:11 schrieb Christian König:
>>> Am 15.08.22 um 12:09 schrieb Dmitry Osipenko:
>>>> On 8/15/22 13:05, Christian König wrote:
>>>>> Am 15.08.22 um 11:54 schrieb Dmitry Osipenko:
>>>>>> Higher order pages allocated using alloc_pages() aren't refcounted and
>>>>>> they
>>>>>> need to be refcounted, otherwise it's impossible to map them by
>>>>>> KVM. This
>>>>>> patch sets the refcount of the tail pages and fixes the KVM memory
>>>>>> mapping
>>>>>> faults.
>>>>>>
>>>>>> Without this change guest virgl driver can't map host buffers into
>>>>>> guest
>>>>>> and can't provide OpenGL 4.5 profile support to the guest. The host
>>>>>> mappings are also needed for enabling the Venus driver using host GPU
>>>>>> drivers that are utilizing TTM.
>>>>>>
>>>>>> Based on a patch proposed by Trigger Huang.
>>>>> Well I can't count how often I have repeated this: This is an
>>>>> absolutely
>>>>> clear NAK!
>>>>>
>>>>> TTM pages are not reference counted in the first place and because of
>>>>> this giving them to virgl is illegal.
>>>> A? The first page is refcounted when allocated, the tail pages are not.
>>> No they aren't. The first page is just by coincident initialized with
>>> a refcount of 1. This refcount is completely ignored and not used at all.
>>>
>>> Incrementing the reference count and by this mapping the page into
>>> some other address space is illegal and corrupts the internal state
>>> tracking of TTM.
>> See this comment in the source code as well:
>>
>>          /* Don't set the __GFP_COMP flag for higher order allocations.
>>           * Mapping pages directly into an userspace process and calling
>>           * put_page() on a TTM allocated page is illegal.
>>           */
>>
>> I have absolutely no idea how somebody had the idea he could do this.
> I saw this comment, but it doesn't make sense because it doesn't explain
> why it's illegal. Hence it looks like a bogus comment since the
> refcouting certainly works, at least to a some degree because I haven't
> noticed any problems in practice, maybe by luck :)

Well exactly that's the problem. It does not work, you are just lucky :)

I will provide a patch to set the reference count to zero even for 
non-compound pages. Maybe that will yield more backtrace to abusers of 
this interface.

Regards,
Christian.

>
> I'll try to dig out the older discussions, thank you for the quick reply!
>

