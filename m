Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ED448ACDB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 12:43:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A83410E3FB;
	Tue, 11 Jan 2022 11:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CE810E3FB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 11:43:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYkrnvHVD5I5DruQdgzzUAwgxHJzxdGAACSJgIb92wIzKGnBHXhZBzP6JwcSm9DAJwvcRzsn7ZL7/j381yDZUSjPd4dPWZSnH5LR/vNSo+HAkgj9DNi8N55FFpc0YoImRHxNPSHgPAvs0eFqHNYfZ9e56q+fgN8sCFOSpmUXhPKjhyaDChxWPyBtMYgxAU+iODCQ3jEBznzTVtxZCn72AjOtk7g3y49anh0MdP77d3ApVmHpVTP1PtqVmPB4+sQnfJmSl0zOBoLkXYTVRZnb9nybi6Dz/h42gtmHIk6k3R7rKIT/sHkfRCmOEA74FVX9pNhUCM0kRWq/dPCMa/aOuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxGPko7UnPmilmnuM61Yuq3Ei9UFqJd0hk/o+Ydc0S8=;
 b=esKMGA1D//mWEKCxysB6xUQvX/FRFjtMClkkjjhw5FCHDhfXVOD5O60UGjl9pj3P9UhueNXdM7Spjh6zS4F63WKDC8CPVNzLoDJV9HfES9aiETKXzjEsF8sxMR2QYukewCB7ih05065hgKm7NN6e30ZW0scWmg/fAmgNnVpg53FsVtA2vOgunrCxFjujQqq44uHkfNHCMg/kjD5s1l6BNk3EkKFJ7gBYs/j2EtsKcL86Uxpu32uSRGoyi3XNIP7l3dTvRA92AusKjRv3QRf2EMZQrMMDTh6mBgxgWV+mGGRqIzjgNPd8dRzsO2zxjUqDZS75Okw7XZUdgRA7xzPGiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxGPko7UnPmilmnuM61Yuq3Ei9UFqJd0hk/o+Ydc0S8=;
 b=ebOxXROe4ZE5NCMcXB6+my6vHrpxf+1HbfF6mTk9ibor1U1ySGrgCwdSFFQOIqYdH2p6iOkfgmg2lY4Mo1KDiKDmgp5zVSg8LgAnZ+HLPc1d7Hg83B2091UGCutbAJ7kjXZ4Ct9jdd4yjdEsHVv9GnP/ssd1YH6Ya5rUW7CLU8o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1407.namprd12.prod.outlook.com
 (2603:10b6:300:15::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Tue, 11 Jan
 2022 11:43:15 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 11:43:15 +0000
Subject: Re: [PATCH] dma-buf: Move sysfs work out of DMA-BUF export/release
 path
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220104235148.21320-1-hridya@google.com>
 <49b29081-42df-ffcd-8fea-bd819499ff1b@amd.com>
 <CA+wgaPMWT0s0KNo_wM7jU+bH626OAVtn77f7_WX=E1wyU8aBzg@mail.gmail.com>
 <3a29914d-0c7b-1f10-49cb-dbc1cc6e52b0@amd.com>
 <CA+wgaPOmRTAuXiSRRmj-s=3d2W6ny=EMFtroOShYKrp0u+xF+g@mail.gmail.com>
 <CA+wgaPO81R+NckRt0nzZazxs9fqSC_V_wyChU=kcMqJ01WxXNw@mail.gmail.com>
 <5a6bd742-10ca-2e88-afaa-3744731c2c0c@amd.com>
 <CA+wgaPPdCMPi1t+ObyO4+cqsk7Xx3E=K5BOPM37=QAviQDAfmw@mail.gmail.com>
 <CAKMK7uGRUrP+0PcY-yxTweb_K_QacHJchgPoa0K9K_kwGO+K3g@mail.gmail.com>
 <934ac18c-d53e-beeb-48c1-015a5936e713@amd.com> <Yd1nJqmHXULnccNF@kroah.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3610ecd0-03c7-2cae-8f36-f8fd555757b0@amd.com>
Date: Tue, 11 Jan 2022 12:43:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <Yd1nJqmHXULnccNF@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0096.eurprd03.prod.outlook.com
 (2603:10a6:208:69::37) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64bb33f6-e7de-4d59-2549-08d9d4f78e13
X-MS-TrafficTypeDiagnostic: MWHPR12MB1407:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB140770221D3641E5EEE39EF383519@MWHPR12MB1407.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AWqGUKkTPqbmiAdp66eQBNcPZQRmYiJ48ZzJUdI/UsrBQ+XeTt2Vwk9DLN3Ly2dAVsxd4tbFdLFO+Yw8vHYU7MJpaA3FQqITdUPVCo1Q2Et/PHPmIYD0KqiiF9n87QQYW+u2Zo4/TUAEaV4RVyz0SXGI1yglkBIhha8a0ICYPEQmj+Dzds+T5EWQd3Ze+nRlKQyx7u978GMvEetSy4XbXiyxrRej7eU3WYZmh8PEJ0JVrSkfcWH/tqQLWwY7f1qmczg4blx6i4JEDx8GDR5fpEmyCcW/Jzk6NGvzB8IeGVrmnzOdxUaw8PSksMqOT0PVikYt5xwJo2mD5CsTSNV9m/zQ4kQx1io4nmug3NTWtZzxc0TD4DzXlN09cGNMR4bjOzxP9MFBjPBg5thHK5Jp0AGyI+iRyc5OiM9Psh4Ka8ves72U9NXRImFT9vSyiMdy6zQkeKX03SV2fl5PJR/syi/s61lXwiM8PEpIGaDcoWu9waRZKfr35uT3vEAkj/TDoOOjsCZXFFP5Ytoyfj0WhbIEYqysmccNNRBJpCUkcuUyMlNjTLDyyLTIjYZBAlosIM3w97sGlHq12re8NnQ7iQJKdqGNdq61cAe33jXwV+8kZdanPTGDReQN1Ih5jT0DkEyYnQGp5Z/Gyf8PHRMuXjR7iKo/ZY92a/Zcp9qDj67VEst0tJVbskHZ3G5gKR2ZRP+JzI5JDBTnNfxciSUHyDrmxdB3WcdRgzbELBnYxYX+SQaGhvdnlU7oL7zqBh2T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(5660300002)(2616005)(2906002)(83380400001)(508600001)(31696002)(6916009)(7416002)(31686004)(8676002)(38100700002)(66476007)(8936002)(66946007)(6512007)(6486002)(316002)(186003)(66574015)(86362001)(6506007)(54906003)(4326008)(26005)(66556008)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anZ5SGVZb01RKzRwMEJwaWJML1lMUEVoRWg5V3RQWWpmcWxsQVE3Q1pvQlJJ?=
 =?utf-8?B?a3BtUXZLbHMyWTNIMVc2NDRodHhyMVZrSUpkMCtRaGJSQnFoTDN4eTdseG5Y?=
 =?utf-8?B?QmdUbDBVM3VpWEpEaU14cUo5bHVPQmhXVms5ejRELzMxcldSaXllckZQcHRC?=
 =?utf-8?B?Ty9rd0FtcHZkbW1kb0dESEtUWFYwWXpHT3F4dWxMSFdHcHU1SFZTYW14L1Uw?=
 =?utf-8?B?eXNvM3VpZ3lQdXRLREhvQVFYaUUxcEdKQ2JUbFZ1Z1RpK1VESjJQeUp2c29a?=
 =?utf-8?B?bGpmMEVYMU9BSG44Uzg1cGdZRWZUOEJmUkE2dmNIeDJPUHc4bUY0M21rMUZI?=
 =?utf-8?B?RTdRTFVXZzVhQkdpenBSd3JKYnY4SUI4Qys5R3V1RGVFWEMxWlMrZGk1a0Ux?=
 =?utf-8?B?Q3pRdU9xczUvSGJJcEx1QlBiSHRqTWVLWmw1eFF1citUTUVscFBRNytsNkhQ?=
 =?utf-8?B?Mm1CNUFEblJDK1ZMdzJJczdJckFKQ0syc2JXRmZXcHVSTWlpZ0U3dWZ0UUlX?=
 =?utf-8?B?dEZxS1Y4Q2FkSkxrc3lYLzVwZlpVTGxNc2xURHlSejNKSWlISHNhTWE1ekV5?=
 =?utf-8?B?K2F4Z1dEM2FiV1oraEs1YTlQTUcyajI1V0trOFNnbU9EQ3FFU1ZGZ25meFBi?=
 =?utf-8?B?R2YxRVh3NHFwNWNhVzY3dGkwekJaWUt3cmVMQXlPdFJtYVo5V3YxaFBaSUpE?=
 =?utf-8?B?cE92M2VENm4yNUtRaUxBbG84WUt0WnhURlJUVElkT0kyYkJsNzVWL1R5Q3dl?=
 =?utf-8?B?OGtuc2JjR1M4LzRnT3h1TzNvMFBxUGVia2JFOWVqMlM0VWJ1SkdxYW80b2hM?=
 =?utf-8?B?RFgzR0JFamdsWkgveTl6MUt5UEVJQU1US3pzRXlMRGJNbjl4ZjNqdmlOdzJi?=
 =?utf-8?B?cjIxdzlMZmY1eSszSkU4MENZeVlOZWduUk5YNXB4MnA2U2xnbDFIMFN5SmpM?=
 =?utf-8?B?UjY5c0ZrNmhIbS9DM2VMZEdKTnF4NVVWYWtOUUtRNmIwREp1c0hPWmVxVnNC?=
 =?utf-8?B?M0xMcmZTOFF5WmlFV2owaWF1NXFnMjRId21uMytmMXNRUkgzb3dqSC9lUHk3?=
 =?utf-8?B?YTVCaEpVWG5jeEFLODJockRxYmw2ZEVmODgrdEVIMU9MQ0VLTzFVeS96RGQw?=
 =?utf-8?B?UDNxVUpSOFpWak01YjA2a3FqRU1Gd0hselk2RHZnVkdiVTVoOXRqb2pkNFNV?=
 =?utf-8?B?REt4Y1Axb2U0WS9DTStwdmxaU2R5N0hvdmVVemR0bTZua0ZNOGdZSHZGUUZQ?=
 =?utf-8?B?dk5DbEtVQjNsM3dMT1dQQkVGaXhLUTIvNVdVZEtINGhpb1BiTERmWldRamRC?=
 =?utf-8?B?RHAwODVwVlpkZlZRUG1WQkk1N3FoS1JhNlVJUGlYbzZjWlhCekVxcm93elZw?=
 =?utf-8?B?WEs0VitJaEwzS2pHNXhhaEdEbjFKbHArT001SGVvN2E3d2x3Uks0UzB3UnJS?=
 =?utf-8?B?WWhwckhTREhMNUpSWEp0Y3MyeThKMGN0OGkxMTJLY2JMQ2MyY3h3UEpJNkl2?=
 =?utf-8?B?aXlxNGRleEx2M2FRVDFQTVVydDA3ZmRwYXlvOHBSZEN3Y0dmN3BaYTBRYlBx?=
 =?utf-8?B?QWFLcTY1bVJ1WEQyb2RuN0hjMlRvdVFBVXJXRXJ4YitpOTN5VGtqUTB6RXVz?=
 =?utf-8?B?R2wzbG9sT2pzamNZVUZaaDhrR1A3eXU0ai9xeXlSR1JBa2QzOGNydm1qRTh2?=
 =?utf-8?B?Wlg3RU1SYzhCZld6dURoVENZeWZJSzNBVk5ZeXdnWHlSYkZlMlM0eDFOVkVC?=
 =?utf-8?B?Y1BLdkU1N0h4VUZKblQ1MThwZVNjRUFnbjFPY3ZWMERmOTZDV2NFNm8rWHda?=
 =?utf-8?B?N2Exazh2MXFMM0tOWGUxdUtpWGJkbVRJVkpzQXF3eEgxbndXNzlENmtBOHFU?=
 =?utf-8?B?NUUyRkJKTDhCRUlSK1dleS82YXdPTm1weUw1ck1DU3JCZWxwd2M0R2ZSNkNE?=
 =?utf-8?B?SmF4MCtJTHhqRTRLREd3Zm5SVzhZU3ZiakEzRXA2RzJENjJGdEt6MU01bjdB?=
 =?utf-8?B?NXNwQ0R4SVZTcFBYRHFDV1BqUWVNcFNmQTdrTVVKYS9KSHRjMys2ajBVWERJ?=
 =?utf-8?B?QUFkSWVZSmlGY0REOUVWd29wK0hsZWh6MzZCQU93L0lYUGpaWlNiUDhDeWx1?=
 =?utf-8?Q?47gE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64bb33f6-e7de-4d59-2549-08d9d4f78e13
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 11:43:15.6828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yx4r9AxXTYaMCw+iCAg2AE1SWKkr7sUlN0f6cUONBdVnnaQVBX99nvvjbnzmx+zC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1407
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, keescook@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tjmercier@google.com, linaro-mm-sig@lists.linaro.org, kaleshsingh@google.com,
 Hridya Valsaraju <hridya@google.com>, surenb@google.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 11.01.22 um 12:16 schrieb Greg Kroah-Hartman:
> On Tue, Jan 11, 2022 at 11:58:07AM +0100, Christian König wrote:
>>>> This is also not a problem due to the high number of DMA-BUF
>>>> exports during launch time, as even a single export can be delayed for
>>>> an unpredictable amount of time. We cannot eliminate DMA-BUF exports
>>>> completely during app-launches and we are unfortunately seeing reports
>>>> of the exporting process occasionally sleeping long enough to cause
>>>> user-visible jankiness :(
>>>>
>>>> We also looked at whether any optimizations are possible from the
>>>> kernfs implementation side[1] but the semaphore is used quite extensively
>>>> and it looks like the best way forward would be to remove sysfs
>>>> creation/teardown from the DMA-BUF export/release path altogether. We
>>>> have some ideas on how we can reduce the code-complexity in the
>>>> current patch. If we manage to
>>>> simplify it considerably, would the approach of offloading sysfs
>>>> creation and teardown into a separate thread be acceptable Christian?
>> At bare minimum I suggest to use a work_struct instead of re-inventing that
>> with kthread.
>>
>> And then only put the exporting of buffers into the background and not the
>> teardown.
>>
>>>> Thank you for the guidance!
>>> One worry I have here with doing this async that now userspace might
>>> have a dma-buf, but the sysfs entry does not yet exist, or the dma-buf
>>> is gone, but the sysfs entry still exists. That's a bit awkward wrt
>>> semantics.
>>>
>>> Also I'm pretty sure that if we can hit this, then other subsystems
>>> using kernfs have similar problems, so trying to fix this in kernfs
>>> with slightly more fine-grained locking sounds like a much more solid
>>> approach. The linked patch talks about how the big delays happen due
>>> to direct reclaim, and that might be limited to specific code paths
>>> that we need to look at? As-is this feels a bit much like papering
>>> over kernfs issues in hackish ways in sysfs users, instead of tackling
>>> the problem at its root.
>> Which is exactly my feeling as well, yes.
> More and more people are using sysfs/kernfs now for things that it was
> never designed for (i.e. high-speed statistic gathering).  That's not
> the fault of kernfs, it's the fault of people thinking it can be used
> for stuff like that :)

I'm starting to get the feeling that we should maybe have questioned 
adding sysfs files for each exported DMA-buf a bit more. Anyway, to late 
for that. We have to live with the consequences.

> But delays like this is odd, tearing down sysfs attributes should
> normally _never_ be a fast-path that matters to system throughput.  So
> offloading it to a workqueue makes sense as the attributes here are for
> objects that are on the fast-path.

That's what is puzzling me as well. As far as I understood Hridya 
tearing down things is not the problem, because during teardown we 
usually have a dying task where it's usually not much of a problem if 
the corpse is around for another few milliseconds until everything is 
cleaned up.

The issue happens during creation of the sysfs attribute and that's 
extremely odd because if this waits for reclaim then drivers will 
certainly wait for reclaim as well. See we need a few bytes for the 
sysfs attribute, but drivers usually need a few megabytes for the 
DMA-buf backing store before they can even export the DMA-buf.

So something doesn't add up in the rational for this problem.

Regards,
Christian.

>
> thanks,
>
> greg k-h

