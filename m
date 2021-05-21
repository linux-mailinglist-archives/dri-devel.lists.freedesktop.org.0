Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E862B38C77B
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 15:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5586F62F;
	Fri, 21 May 2021 13:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2054.outbound.protection.outlook.com [40.107.96.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A6F6E508;
 Fri, 21 May 2021 13:09:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBIr3TCNuKUhNilN8hbVyRHWIw83yU5mw7F3RI1UZOParBwixKSOIGYptfrS6RMb3I+T6C6N98rn505aKvUKBcinJ7I28GnwIk2KreS/o2WvQ8N70ROEut1vhw2rgffvRt4NI7gjONIw9xvIEPK1TwD0Ja0uD8O60E9tLLERp4hqxGUirt89wE18w6EVou/CT5tfToT71NnpmqBbdn5qdvF1XR104vMnqwd0WlNSjGkcVCFB1J59cCvFddZN6IJOVqVSQCsOAyA9ZR90nG8kNBE0bmsM+ABIJhWNXc5NNQsgnbewx0fYBIb/qcSF/1ZdONI9UbtvoVgf6KOdH2M7qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbRZaj/4Jb0idyVSWktJo/xFBoynGW3ld5WSyKFK/IU=;
 b=mBabFsaxPaaOF4w7daqRreTysyYbGhU+rNXUxPBPq7y8QqTiTNYlgkxj7hn8z/+L8Tpmy6AR22kkpoQk6uxz6BXWSuMHccWV6EEScAwJpxQICGEOrgRsdKtF9bNrChIl5pIw+//tkGmOEuj/FIAR34VWq7LGMA9BvfDicG0/Z1CnYg4zkmA7FZm1vBxiGie0+vXkVhQrr/yWcU9BCXnqSWKt5uGfV85f+Z1RlGON3wCcX681A4BYQrcO8n6WSvAOzOJ1enzCCFyW/ewDnUCsRLmU0PVR9+C6JMf6XSxtQ0Xlgi/ybqunX5CNw8Wo/iE/wMAY3I1ASN93GbRQGJS7pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbRZaj/4Jb0idyVSWktJo/xFBoynGW3ld5WSyKFK/IU=;
 b=jFF8DThRE/RBiItz4D4tI9kjs22y74uFrWwoFFsJSN1VbzItbYazGHFxNrCU/PG0BRFuDGMY//BTxCct7e1Yit2/r8IOgrwVubeJ1T79g2Kc9j/Xn49bNCuo0mh7W+93uUVu8qqgZxmyTUF3o1wiC39wc5uCZe4QfDnQ0yCgX3c=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4660.namprd12.prod.outlook.com (2603:10b6:207:34::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Fri, 21 May
 2021 13:09:19 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Fri, 21 May 2021
 13:09:19 +0000
Subject: Re: [Linaro-mm-sig] [PATCH 04/11] drm/panfrost: Fix implicit sync
To: Daniel Stone <daniel@fooishbar.org>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-4-daniel.vetter@ffwll.ch>
 <CAPj87rMBVRamT+VAVUaUnq3C1KFVqzABi99RKs=1_vyb4YWDnQ@mail.gmail.com>
 <d1ef10e8-b774-06e5-92ab-047c58e1ea41@amd.com>
 <CAPj87rOzV1mC=Nv2zfsYXrD4ARV7cmmJmkUCSwRSw1Ksy0k-aA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <39aa30e4-2726-a0ba-3537-3be609dbc0b5@amd.com>
Date: Fri, 21 May 2021 15:09:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAPj87rOzV1mC=Nv2zfsYXrD4ARV7cmmJmkUCSwRSw1Ksy0k-aA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
X-ClientProxiedBy: AM8P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
 (2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d) by
 AM8P190CA0023.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 13:09:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4404f984-66a1-42b3-a129-08d91c59a4f4
X-MS-TrafficTypeDiagnostic: BL0PR12MB4660:
X-Microsoft-Antispam-PRVS: <BL0PR12MB466089DBC5AE41E12717508F83299@BL0PR12MB4660.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nYfAEqb3x+Cp4KTLnCizF8e4qVljuUGAFUHRZ0wAHDptnJK3cdo/coJ0TGIS29p7iufNiI7FFFwTpeaozq+R8AzjtiC3MooSwTS8kUpETKBSk88IUFeW+nBsmIXH79s11myB3vJIDWua2l2psgslOC9+FanNPytxD+GwTE39J6OdX44gti8xCYU4KW8xwuAIbFRebLlyOCq0TzfE84lhw6xmcGODvuc0661u7sv5o3NBWCHd8FOm2a+77Cpj0hPaZU9uY5NXkYt4VWFvCIeqNgnBmHsRc04aYg+sHfcvNn3fNlbQZ6x9XT/GTWt1u0lbLn578mSU6dBNyJctQbcT35s+lqqajyDmxRgghhK4IG2uiKFgyIfkXv735k0ilV9gCM/YK8iFlQbTTeQQDWtj9kc+8fP1kBIQrTjmyclWuTWvFT20U4axBXZFPvwco0rHFLjJq4IyOBD8e7zH0gboIHGoJW78kH/vuSmwBnEo/lh7+nusALNPmcq0MZwMyzVlF01ffL/0uwTrroHg11No9Uq9KwiXyvkuqrmnvScK3z9SxVpvBQXQLDDesPC9dFiStHygLe/C6/6rjLtRAZXwaiq7UVpWmcd5nBd+iRnpCpwDaLB0c8+9qVHD+sfP6WI0ovlF65As8ku8M1NdJ4FWduup/yKa6NMaAzqjSGa5LmdtYgr9LHkK/qlgfhUC6mBW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(83380400001)(66574015)(7416002)(2616005)(16526019)(38100700002)(186003)(6486002)(6916009)(8936002)(6666004)(4326008)(478600001)(54906003)(31686004)(86362001)(31696002)(8676002)(66556008)(66476007)(5660300002)(66946007)(36756003)(52116002)(316002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dWRkRGVUMEVaOVBuODlqSk1DeE1FRkptZnMwTnUwc0xOZm0xZDBCTFV3T05a?=
 =?utf-8?B?UExPN0xNeGpMZFVaTWVYd2Q4SWZwbmhWdDZ4MDdIbGZDVldKT1lqcGxTQmtL?=
 =?utf-8?B?L1RzdG5VenFNRjFuQ1NaRk5abFhGUE1wMW4rUVl6ZUFNWU5lUkhoQnBCQVBH?=
 =?utf-8?B?OU8zRmRWVjIrdUFCL0o3RFFGQUh5T21xMWhmbTZHRDVaemFLeE95VzlxT1lj?=
 =?utf-8?B?aDZWSVZiVlljRjhoNTRxZ2JRZmR3SGNlN045S3BQUEZFL29uektqM01LbTFh?=
 =?utf-8?B?M3N3eElJMGtCNTA1TURiTFBMSE1yVVp1R0luU1R3aXQzOGlQbUg1emlleTNR?=
 =?utf-8?B?Z0k3STV3eUdGMWY1L29MZ0FZNi9KRzBFUmF2WGpTblZtZ3ZvV0RNK2JaOGlW?=
 =?utf-8?B?bzBDNjZzMm9NNWM3VldUTTZCZ3JtNHUrUWMvc2tjR3BCQVJIdU5uVFBSNHVX?=
 =?utf-8?B?L2ZKS000bWJLc2cwRTQ1Zk96MGN0Y0RFK2hxNGRjdmpRUHg4K3NQRDdYczZD?=
 =?utf-8?B?OFl2dmhHL2lkSzdGbUFSWmNDZWN5TFlxcEttWHJ0TklONzVnYS9wYzhvU0lU?=
 =?utf-8?B?TmFjWktuRkR5L2tqdVhQU2VCT0xHbWJteEVoTGNMem1UMmxZbXJmRnhua1JY?=
 =?utf-8?B?OFp2cUlrREl6VEgvNmU0ZjVhSUd2WXdjbGxpcEtPSTFTWGhFQ2NMSjNSbk1p?=
 =?utf-8?B?bHduaTVYT0tkNSsveGcwN2pySGJvSHhvTUVGZ2M2YzlqSmhtd3hUSlYwa1Bp?=
 =?utf-8?B?c0RaUVpFbjMrL0NLbkhEeCtRZThuSkNWN0MvdEZSK0d6UmpuVmhxdHlxVUZE?=
 =?utf-8?B?YzZ1SnFHYkRRT24vSWNlcVhNUjRER256Uk1LV3I1Vm5LL2F2TXRqallnbmNT?=
 =?utf-8?B?TkR0UzNQNTZadyttemFITnNrVERKNHRoWnd2ZUpBK0FCcVIrSmZPRmNXUmNm?=
 =?utf-8?B?VXJ0UU9kbXB3cnRxbVpFcTV6ZHM0Y2RRRkFGUDdUbkU2Z3lQVExGWkpZVzVC?=
 =?utf-8?B?bFI0b1NlaWw0dVVYdjQ2YzZpL292bEp6ZWtwUTFXUGozbXFaS3VKU1NDSDYx?=
 =?utf-8?B?ajN4b3BuTytiNlpSNlU2bVZCb1Z4T1Z0N2wwRndDamlwSTREL0FSZFZkVW1Y?=
 =?utf-8?B?MStxaUp3TUc0cVZUa1dyS2ZweDlxNkdvRjRaSFRRZ2RudVVjbHZJQ3JNTlFk?=
 =?utf-8?B?N01scHFKelBSWkhmM2d2V3R2KzhJaVFTcmNvMXBKb2pCSFF6eHkrMWRXUG9s?=
 =?utf-8?B?T0MrVXBFSUEzMS9TYUZPTlhITTBYT0doK3dxcGZmNjVRNVA1OTdjeHNWaVRu?=
 =?utf-8?B?VVlIL3NOZXEvOVk1c2R4aEQza2s2UkZ2c2dqY0JLOEtiUmdVTUVMdTd3MWNi?=
 =?utf-8?B?QzZDb1U4V0g3S2NHU1RsNWZyZzE3dDhKQVVNSCtrL2YrOTRDY3ZVcXZQeWti?=
 =?utf-8?B?OWMxUUNOZ3QyWjJUVGI3OGo0WjdvQkg4VGVMMWFtalViSDI3cDFyWDNpK1hQ?=
 =?utf-8?B?V2x4eUtNdXVlL3g1YVB4VGU4QkU0NjBHcFozM2VxQVBMMG4zUE9IOFlaUzBQ?=
 =?utf-8?B?MVEzY1RRdDhxMkF1WnphNFFmTVQ4NXJxemFhSG1tb055d2pzcVRZNHZRUlFH?=
 =?utf-8?B?V3RGdThOLys1ZWRUcG1vcFRGL0Nja0xJdERORzBJV2x5M2pEM3BPYXNmb0JO?=
 =?utf-8?B?UXpKQit0d0NvZE9vUFE3RjIrUFJRaTU1Tys0Nkt2WWxYaXMrOWFyQ21jdkNW?=
 =?utf-8?B?Ny8yR3VPTS9JTWZsZHFBYkkrOEIxNk1hR3ZVQVhWQkJXWlZyOG5WbU5DQkhz?=
 =?utf-8?B?bUlSSytiYkxaZXJiVHRIVjRrY0c1TmVlY2hjejJ3ODE3UFd4TllhekRhV1hZ?=
 =?utf-8?Q?vXYyzgFL5dOK+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4404f984-66a1-42b3-a129-08d91c59a4f4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 13:09:19.6497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEODstndMRQQO+K7AXNs5RacV5SAMsEGroHCHieEoPDvfjfmuzfD+s06BTCUgyH+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4660
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.05.21 um 14:54 schrieb Daniel Stone:
> On Fri, 21 May 2021 at 13:28, Christian König <christian.koenig@amd.com> wrote:
>> Am 21.05.21 um 14:22 schrieb Daniel Stone:
>>> Yeah, the 'second-generation Valhall' GPUs coming later this year /
>>> early next year are starting to get pretty weird. Firmware-mediated
>>> job scheduling out of multiple queues, userspace having direct access
>>> to the queues and can do inter-queue synchronisation (at least I think
>>> so), etc. For bonus points, synchronisation is based on $addr = $val
>>> to signal and $addr == $val to wait, with a separate fence primitive
>>> as well.
>> Well that sounds familiar :)
> I laughed when I first saw it, because it was better than crying I guess.

In Germany we say "Ich freue mich drauf wie auf Zahnschmerzen".

> If you're curious, the interface definitions are in the csf/ directory
> in the 'Bifrost kernel driver' r30p0 download you can get from the Arm
> developer site. Unfortunately the exact semantics aren't completely
> clear.

Well it is actually relatively simple. Take a look at the timeline 
semaphores from Vulkan, everybody is basically implementing the same 
semantics now.

When you queued up a bunch of commands on your hardware, the first one 
will write value 1 to a 64bit memory location, the second one will write 
value 2, the third value 3 and so on. After writing the value the 
hardware raises and interrupt signal to everybody interested.

In other words pretty standard memory fence behavior.

When you now have a second queue which depends on work of the first one 
you look at the memory location and do a compare. If you depend on the 
third submission you just wait for the value to be >3 and are done.

Regards,
Christian.

>
>>> Obviously Arm should be part of this conversation here, but I guess
>>> we'll have to wait for a while yet to see how everything's shaken out
>>> with this new gen, and hope that whatever's been designed upstream in
>>> the meantime is actually vaguely compatible ...
>> Yeah, going to keep you in CC when we start to code and review user fences.
> Awesome, thanks Christian. Appreciate it. :)
>
> Cheers,
> Daniel

