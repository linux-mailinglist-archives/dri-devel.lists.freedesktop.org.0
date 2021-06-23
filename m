Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B70D3B1A9D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 14:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7BA6E8D4;
	Wed, 23 Jun 2021 12:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719FB6E0E9;
 Wed, 23 Jun 2021 12:59:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7BRFHWn1jOioeEniE1oQJ+Bn3lsIowkqS7dBAeBYsbZnQ5TZEeDsaHotAj15Y2e3uLWcbaPg5TjiQsebBuE2G9OOC7KylSql/BD4XSVNY7mjeFNnC2P5BPyd/dD71h116JOK1Z6Gbs6OuySVCapJL7Q0/tWEgS+gvw5CZaDial2WzOJwq/1BYH6DlY0HLvYYMs9HxeHUtxAY7KoRedXUTCoxknj3Bek0iCw5SxVNmlOgFZoi8v7xJWnsW9ZdSQ2p1FHEpPA+gy44/bzECThPty+MrpRL12/0PDc0BXulazYjPn35qF6fylu6HLBfy261TwuN9D6r7gFK/h1pZqw9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0poL/xck/F+X6ASXMufxMmar/+nD5KtqcU6yt4hGGOY=;
 b=fjbp07Z6otmkDps0XSGfy/73X8s+PZcnfzr6bzeFZMGgyD2VImymEEWjPWSqNl1rQ8xwwdbKSExaaRyXGEy14erheMBG+Pasux4dZ+E2FFyFj7mJBbrSB6cyTb6beMsdyEgz6BM7dahJclFUvPd07iqyCeWtdZPvnCD7qvWBUsjY7qLLKZQT0f5oPEaR3ZzsKUH4BpyzJGP+Yp1efb634h9R8soPGuMAgBHs4eki9Yti8cWDiiayuK4098GGIWR3Bau7NZWTMTzuD01y+7TR8BYs112Mlr3R4Y4NFVeWtiM6b6CX4x4g3ihVqKAMhMNXd+sjKzQsivp/hEu8SxuY8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0poL/xck/F+X6ASXMufxMmar/+nD5KtqcU6yt4hGGOY=;
 b=rFb8kEa8NgwbKSevBcfA8DNOXvDkqzU1NMorkKNVhFv260t3ginFax3+lhBR5tEds9fQ+o3YYbL2wjrrs/ngsTH8xnJ1CQZJhpJXvIhDqQLqFD6onSR//6HeW73dFd6iXj6+e3NVYQRRBjyxIkuj0JcCsVYIkLkYadtDrZnEI9o=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4961.namprd12.prod.outlook.com (2603:10b6:208:1c9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 23 Jun
 2021 12:59:08 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 12:59:08 +0000
Subject: Re: [PATCH 15/15] RFC: drm/amdgpu: Implement a proper implicit
 fencing uapi
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-16-daniel.vetter@ffwll.ch>
 <CAP+8YyHPLpe6jM7gz3ZNL3QqdHiCdL0P5cVMS7ddNgBSJmutSA@mail.gmail.com>
 <CAKMK7uGOrro7-2+OVJse3CcuZO66kreq-XjL45Ay5vhL=2TZvQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3bf45006-4256-763d-601b-3a25a7057820@amd.com>
Date: Wed, 23 Jun 2021 14:59:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAKMK7uGOrro7-2+OVJse3CcuZO66kreq-XjL45Ay5vhL=2TZvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:871f:87e2:f394:e667]
X-ClientProxiedBy: PR3P189CA0050.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:871f:87e2:f394:e667]
 (2a02:908:1252:fb60:871f:87e2:f394:e667) by
 PR3P189CA0050.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 12:59:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d828fe0-edc1-4ea0-0775-08d93646b01b
X-MS-TrafficTypeDiagnostic: BL0PR12MB4961:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49613A58394E5919CA525F9C83089@BL0PR12MB4961.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EOg6G0Rmymmk2PuyDbe0mP7P4sjc7tMrLAc6CTvGZHGz1aRCQjFO9L4VRypUas8huTi4IpqKEkCUo2FNrEWDOaWJbL1G9I7OE9XebY1j0EbIlcxV1kiU0Qf0xJ6S62BgtM3hTtJCLZwVSudLSY4gFGXlHM0Ori2oiU1qeFuC09SZQiOt/ueIDXm+oxuZz2k6nUDaSBWPLjTCKURxNRy6gF3Z6dGp5iWhnD3vK/EvPNQu54lqszpFyPUpk3UBVpV751rnjvTPfJ/3HsVKLRyul1Yn+WfyEXMWxqdydKLis55L2Wxoa0s++rcaijDgFOdDlA80X3a7HTpZAxtxe4tWM7IOLgWZITM+tgwrP0YaT/JNHNtQRNKJOhQzOLd6z1a4wyJ4Zix0hRRaYiFkp2C2dCnH50rlpczpBGahMAifRfkMTnMwss9TuxcR/f8cQ9V67x9awFeToLOv4xBOHBwi/w01zvTU7S+FGNnO151JuSKWlzbE3PZgqPZYzzO01Z5xOXsstYlFRcafSXi12iIDtXY/+V6WVsq9RslKGHBBXluX5l0gXWoDe2uJrhuR6gFWc6u4+X23dIYpt52Y6IMEH+dfgQFKlGJihHFIVVnOhUfO2qSVdUPRi0QgPiHKuDeM4gJDfN5tlKDpGblWxhCGE1WmQr+sroTH8WxvQS+I1sjCTxOULQLehRFnrS6YbjP0u45Blb095mADVRuNyONryzazTri7eoTUYTB07TL98oY05QlGyApyMcKnL/5YO41VFdE9KNxI3rJFCeuwy8I3hSF9pgKoGhI9UDS3X7bxLj4m456j+p2uBxU1UfTutwdhlC/JumVi/6DLZt4xRmiDyi8v7crE1Fx6QVp3FYKk3t4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(5660300002)(8936002)(8676002)(66946007)(66556008)(66476007)(966005)(83380400001)(66574015)(30864003)(31696002)(110136005)(36756003)(86362001)(478600001)(45080400002)(6486002)(7416002)(2616005)(31686004)(54906003)(53546011)(16526019)(186003)(316002)(6666004)(4326008)(2906002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDhhakZoMDF2d0hqWGV5K0t2YzM3Qm93U3BjTk5IRTF0Vmp5YitYdVUyUkkx?=
 =?utf-8?B?T0ZNYjVHMzhZTTNyeGUyRXU5SXhmb081aUxKTG9QdUI4K1hMT1F1NmZUU2Z2?=
 =?utf-8?B?ellhM3oyWlZaeTA3aGxvS0pWZldzcE0xYVB1TnhibTVEdVNVQS8wQWEyQWdn?=
 =?utf-8?B?VnAzNGhlb01CS0Q4SW5yMWx2am9Da29BN01raWtXQWhrR3dDakR6aDBjMlVV?=
 =?utf-8?B?Ykw4Rkk0YUZuTTZ1OVM5eGlIRkxicHRVWVFtNlQ5ZjFtckxFZng1NXNMdnNP?=
 =?utf-8?B?ZWh5anRXQXp5QjFZVXFwS01telJYMnN0ajdlQjVWdm5ZWW5LSUcvbHlPS09u?=
 =?utf-8?B?SFZKekVvdmtZcU9wVXkzaHZNaEdKQmgrM0V4cmFRc3VSdSs2SU83SlJNOGly?=
 =?utf-8?B?R0tYNS9td3JZK2R1VUpySWhwVXd5U2J4NzZEQUREeUx3VFFaN2x3TmJ5NFdQ?=
 =?utf-8?B?TDJNaVlBd1FVR29Ka1ZqSytWbkM3akZtZVpNVjhzcStML21jbWREL2cyc0ox?=
 =?utf-8?B?VUwyZ0hRaSs4ZE04eUUxWkltMWRhMUtRVmEwYThKWkxCaVJobFlVL2tnSkkx?=
 =?utf-8?B?elE5T0FhNExXdkNtSzdkS3o0d0V3eFF5TVlNQjBkMTE5NUl5ZnQ1VDFqRHJ3?=
 =?utf-8?B?QnRlQUZNeGpWR0tiZ01ZYTlPYkJuczVONUpNMXp0dG9zaG9vRVMyR2dGS1RR?=
 =?utf-8?B?d0NQY0Nod3dBbG1HVG5STyt0QVJwMUNYV1RBUGJWZnpObHFtUWZBRWdLa2Zv?=
 =?utf-8?B?Q1RpVTJOcFo3OHZpZ0lNVE9BS3ZPenJKaUZBcXJzUllicVRsL292QlFPdEVQ?=
 =?utf-8?B?TSt4MllTdWNDR1laUzNMTGpIUWtyRVVQdERVM0VMSmFxeFQ2VzZxcWY1NVQ0?=
 =?utf-8?B?MlpkbjlDU1J0NHZKYU1QcWtxaFBETnpvSHBWV3UyeUcxNU83SWNUU2QxWGVh?=
 =?utf-8?B?Z0RpM1pVcFc3N3ExakdqTmVuem9IS2VKaGJCbzl1NzJFbFp4cHZ3czRaNHRk?=
 =?utf-8?B?QVBOMUpJeXpWZys3SmZJd080TG9QSUNUY3g1anFNeUVUSmVJWDhIQS82ZlBN?=
 =?utf-8?B?RTFDbjlWcGJJZS9wYmNDSkhIa1pwNVZmR0tyMVdzUmtRZC8vVHV5aVNyQkVI?=
 =?utf-8?B?ZEVncXB5S0dzNitDRTZLdUJobGRWVVJwVWYzVXQvTG9CelN5MERNY0N2RGV0?=
 =?utf-8?B?S1RvWGsvNFJyWVFvR0llYnRyZUJMTXE5VmZBbVl0dUJIR2J0Mkg3UmRGdzB0?=
 =?utf-8?B?MHRRQ1p5VW91UkpYNURVOE5tNEorN3poR2Nhd1d5V3J6NjFoRjZ2TldOQ3NW?=
 =?utf-8?B?bmxTMzdzWG5KeDVvTTNjYjRkUjFXcFpsTVEwUGZuRTV0a3hNYVRtaXZmclNv?=
 =?utf-8?B?N3VFTExBK3c5bzhiVWIveTRlQ0dCZkZnZFFiNXNSczF6aTJjUEh0aXNkVjZD?=
 =?utf-8?B?d0o1YWJmOXVLQ0lQek1ERHE0S21vMDhLMERFOElzSVhyS0xKMmhUbC9KSVB1?=
 =?utf-8?B?UDZYZ3ZRYUlEeVpvbGs4Mmh3Mm56NmhNMmhOdzR5YU15N25yM2ZWc29ZZTFW?=
 =?utf-8?B?M0l5dDEvOGFoeHFtTWJJenpIVHVqMUdrejA4K3ovQjBDREplSFYxS1Bydlhv?=
 =?utf-8?B?NG9FQ2JGVzBwMGVRTWFLcXVwZjFzTHNacWI3RVJVY2QxR2ZVbmlnY0VaRWZh?=
 =?utf-8?B?emhVdVRvT04zUTNyV01aREFpTDNEb1h1Rk5rNDVFR1lnclhHUTFXNTVyWW1S?=
 =?utf-8?B?U2UzNDFYVm03bzRzWk03WjZrSVBsYmY3WEJUekNYOSs2dFVLeFZvOGg4RmpC?=
 =?utf-8?B?TlBYRktwTllJZG5IcWdLRVp4UG9pS0dtNkdURDlKc3lpUkVLUVZwZHJxbkcr?=
 =?utf-8?Q?GghELAqFnnDsE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d828fe0-edc1-4ea0-0775-08d93646b01b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 12:59:08.1886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORbxC8mc2TGoQ9KzoUAFLrB4PcIdJJj/RsVMHl3FSpWzoIpmVJ67edN2bf6JjnRn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4961
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.06.21 um 14:18 schrieb Daniel Vetter:
> On Wed, Jun 23, 2021 at 11:45 AM Bas Nieuwenhuizen
> <bas@basnieuwenhuizen.nl> wrote:
>> On Tue, Jun 22, 2021 at 6:55 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>> WARNING: Absolutely untested beyond "gcc isn't dying in agony".
>>>
>>> Implicit fencing done properly needs to treat the implicit fencing
>>> slots like a funny kind of IPC mailbox. In other words it needs to be
>>> explicitly. This is the only way it will mesh well with explicit
>>> fencing userspace like vk, and it's also the bare minimum required to
>>> be able to manage anything else that wants to use the same buffer on
>>> multiple engines in parallel, and still be able to share it through
>>> implicit sync.
>>>
>>> amdgpu completely lacks such an uapi. Fix this.
>>>
>>> Luckily the concept of ignoring implicit fences exists already, and
>>> takes care of all the complexities of making sure that non-optional
>>> fences (like bo moves) are not ignored. This support was added in
>>>
>>> commit 177ae09b5d699a5ebd1cafcee78889db968abf54
>>> Author: Andres Rodriguez <andresx7@gmail.com>
>>> Date:   Fri Sep 15 20:44:06 2017 -0400
>>>
>>>      drm/amdgpu: introduce AMDGPU_GEM_CREATE_EXPLICIT_SYNC v2
>>>
>>> Unfortuantely it's the wrong semantics, because it's a bo flag and
>>> disables implicit sync on an allocated buffer completely.
>>>
>>> We _do_ want implicit sync, but control it explicitly. For this we
>>> need a flag on the drm_file, so that a given userspace (like vulkan)
>>> can manage the implicit sync slots explicitly. The other side of the
>>> pipeline (compositor, other process or just different stage in a media
>>> pipeline in the same process) can then either do the same, or fully
>>> participate in the implicit sync as implemented by the kernel by
>>> default.
>>>
>>> By building on the existing flag for buffers we avoid any issues with
>>> opening up additional security concerns - anything this new flag here
>>> allows is already.
>>>
>>> All drivers which supports this concept of a userspace-specific
>>> opt-out of implicit sync have a flag in their CS ioctl, but in reality
>>> that turned out to be a bit too inflexible. See the discussion below,
>>> let's try to do a bit better for amdgpu.
>>>
>>> This alone only allows us to completely avoid any stalls due to
>>> implicit sync, it does not yet allow us to use implicit sync as a
>>> strange form of IPC for sync_file.
>>>
>>> For that we need two more pieces:
>>>
>>> - a way to get the current implicit sync fences out of a buffer. Could
>>>    be done in a driver ioctl, but everyone needs this, and generally a
>>>    dma-buf is involved anyway to establish the sharing. So an ioctl on
>>>    the dma-buf makes a ton more sense:
>>>
>>>    https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210520190007.534046-4-jason%40jlekstrand.net%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cf026055f523d4e4df95b08d936410e39%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637600475351085536%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=gUnM8%2Fulx%2B%2BDLxByO%2F0V3cLqt%2Fc2unWjizEpptQqM8g%3D&amp;reserved=0
>>>
>>>    Current drivers in upstream solves this by having the opt-out flag
>>>    on their CS ioctl. This has the downside that very often the CS
>>>    which must actually stall for the implicit fence is run a while
>>>    after the implicit fence point was logically sampled per the api
>>>    spec (vk passes an explicit syncobj around for that afaiui), and so
>>>    results in oversync. Converting the implicit sync fences into a
>>>    snap-shot sync_file is actually accurate.
>>>
>>> - Simillar we need to be able to set the exclusive implicit fence.
>>>    Current drivers again do this with a CS ioctl flag, with again the
>>>    same problems that the time the CS happens additional dependencies
>>>    have been added. An explicit ioctl to only insert a sync_file (while
>>>    respecting the rules for how exclusive and shared fence slots must
>>>    be update in struct dma_resv) is much better. This is proposed here:
>>>
>>>    https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210520190007.534046-5-jason%40jlekstrand.net%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cf026055f523d4e4df95b08d936410e39%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637600475351085536%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=wFGNyeL1YSpkebf1L1DDb2euihf1fvmR9G8cfywrpVU%3D&amp;reserved=0
>>>
>>> These three pieces together allow userspace to fully control implicit
>>> fencing and remove all unecessary stall points due to them.
>>>
>>> Well, as much as the implicit fencing model fundamentally allows:
>>> There is only one set of fences, you can only choose to sync against
>>> only writers (exclusive slot), or everyone. Hence suballocating
>>> multiple buffers or anything else like this is fundamentally not
>>> possible, and can only be fixed by a proper explicit fencing model.
>>>
>>> Aside from that caveat this model gets implicit fencing as closely to
>>> explicit fencing semantics as possible:
>>>
>>> On the actual implementation I opted for a simple setparam ioctl, no
>>> locking (just atomic reads/writes) for simplicity. There is a nice
>>> flag parameter in the VM ioctl which we could use, except:
>>> - it's not checked, so userspace likely passes garbage
>>> - there's already a comment that userspace _does_ pass garbage in the
>>>    priority field
>>> So yeah unfortunately this flag parameter for setting vm flags is
>>> useless, and we need to hack up a new one.
>>>
>>> v2: Explain why a new SETPARAM (Jason)
>>>
>>> v3: Bas noticed I forgot to hook up the dependency-side shortcut. We
>>> need both, or this doesn't do much.
>>>
>>> v4: Rebase over the amdgpu patch to always set the implicit sync
>>> fences.
>> So I think there is still a case missing in this implementation.
>> Consider these 3 cases
>>
>> (format: a->b: b waits on a. Yes, I know arrows are hard)
>>
>> explicit->explicit: This doesn't wait now, which is good
>> Implicit->explicit: This doesn't wait now, which is good
>> explicit->implicit : This still waits as the explicit submission still
>> adds shared fences and most things that set an exclusive fence for
>> implicit sync will hence wait on it.
>>
>> This is probably good enough for what radv needs now but also sounds
>> like a risk wrt baking in new uapi behavior that we don't want to be
>> the end result.
>>
>> Within AMDGPU this is probably solvable in two ways:
>>
>> 1) Downgrade AMDGPU_SYNC_NE_OWNER to AMDGPU_SYNC_EXPLICIT for shared fences.
> I'm not sure that works. I think the right fix is that radeonsi also
> switches to this model, with maybe a per-bo CS flag to set indicate
> write access, to cut down on the number of ioctls that are needed
> otherwise on shared buffers. This per-bo flag would essentially select
> between SYNC_NE_OWNER and SYNC_EXPLICIT on a per-buffer basis.

Yeah, but I'm still not entirely sure why that approach isn't sufficient?

Problem with the per context or per vm flag is that you then don't get 
any implicit synchronization any more when another process starts using 
the buffer.

> The current amdgpu uapi just doesn't allow any other model without an
> explicit opt-in. So current implicit sync userspace just has to
> oversync, there's not much choice.
>
>> 2) Have an EXPLICIT fence owner that is used for explicit submissions
>> that is ignored by AMDGPU_SYNC_NE_OWNER.
>>
>> But this doesn't solve cross-driver interactions here.
> Yeah cross-driver is still entirely unsolved, because
> amdgpu_bo_explicit_sync() on the bo didn't solve that either.

Hui? You have lost me. Why is that still unsolved?

Regards,
Christian.

> -Daniel
>
>>> Cc: mesa-dev@lists.freedesktop.org
>>> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>>> Cc: Dave Airlie <airlied@gmail.com>
>>> Cc: Rob Clark <robdclark@chromium.org>
>>> Cc: Kristian H. Kristensen <hoegsberg@google.com>
>>> Cc: Michel Dänzer <michel@daenzer.net>
>>> Cc: Daniel Stone <daniels@collabora.com>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: Deepak R Varma <mh12gx2825@gmail.com>
>>> Cc: Chen Li <chenli@uniontech.com>
>>> Cc: Kevin Wang <kevin1.wang@amd.com>
>>> Cc: Dennis Li <Dennis.Li@amd.com>
>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>> Cc: linaro-mm-sig@lists.linaro.org
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  7 +++++--
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 21 +++++++++++++++++++++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  6 ++++++
>>>   include/uapi/drm/amdgpu_drm.h           | 10 ++++++++++
>>>   4 files changed, 42 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> index 65df34c17264..c5386d13eb4a 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> @@ -498,6 +498,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>>          struct amdgpu_bo *gds;
>>>          struct amdgpu_bo *gws;
>>>          struct amdgpu_bo *oa;
>>> +       bool no_implicit_sync = READ_ONCE(fpriv->vm.no_implicit_sync);
>>>          int r;
>>>
>>>          INIT_LIST_HEAD(&p->validated);
>>> @@ -577,7 +578,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>>
>>>                  e->bo_va = amdgpu_vm_bo_find(vm, bo);
>>>
>>> -               if (bo->tbo.base.dma_buf && !amdgpu_bo_explicit_sync(bo)) {
>>> +               if (bo->tbo.base.dma_buf &&
>>> +                   !(no_implicit_sync || amdgpu_bo_explicit_sync(bo))) {
>>>                          e->chain = dma_fence_chain_alloc();
>>>                          if (!e->chain) {
>>>                                  r = -ENOMEM;
>>> @@ -649,6 +651,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
>>>   {
>>>          struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
>>>          struct amdgpu_bo_list_entry *e;
>>> +       bool no_implicit_sync = READ_ONCE(fpriv->vm.no_implicit_sync);
>>>          int r;
>>>
>>>          list_for_each_entry(e, &p->validated, tv.head) {
>>> @@ -656,7 +659,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
>>>                  struct dma_resv *resv = bo->tbo.base.resv;
>>>                  enum amdgpu_sync_mode sync_mode;
>>>
>>> -               sync_mode = amdgpu_bo_explicit_sync(bo) ?
>>> +               sync_mode = no_implicit_sync || amdgpu_bo_explicit_sync(bo) ?
>>>                          AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
>>>                  r = amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode,
>>>                                       &fpriv->vm);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> index c080ba15ae77..f982626b5328 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> @@ -1724,6 +1724,26 @@ int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv)
>>>          return 0;
>>>   }
>>>
>>> +int amdgpu_setparam_ioctl(struct drm_device *dev, void *data,
>>> +                         struct drm_file *filp)
>>> +{
>>> +       struct drm_amdgpu_setparam *setparam = data;
>>> +       struct amdgpu_fpriv *fpriv = filp->driver_priv;
>>> +
>>> +       switch (setparam->param) {
>>> +       case AMDGPU_SETPARAM_NO_IMPLICIT_SYNC:
>>> +               if (setparam->value)
>>> +                       WRITE_ONCE(fpriv->vm.no_implicit_sync, true);
>>> +               else
>>> +                       WRITE_ONCE(fpriv->vm.no_implicit_sync, false);
>>> +               break;
>>> +       default:
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       return 0;
>>> +}
>>> +
>>>   const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
>>>          DRM_IOCTL_DEF_DRV(AMDGPU_GEM_CREATE, amdgpu_gem_create_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>          DRM_IOCTL_DEF_DRV(AMDGPU_CTX, amdgpu_ctx_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>> @@ -1742,6 +1762,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
>>>          DRM_IOCTL_DEF_DRV(AMDGPU_GEM_VA, amdgpu_gem_va_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>          DRM_IOCTL_DEF_DRV(AMDGPU_GEM_OP, amdgpu_gem_op_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>          DRM_IOCTL_DEF_DRV(AMDGPU_GEM_USERPTR, amdgpu_gem_userptr_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>> +       DRM_IOCTL_DEF_DRV(AMDGPU_SETPARAM, amdgpu_setparam_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>   };
>>>
>>>   static const struct drm_driver amdgpu_kms_driver = {
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> index ddb85a85cbba..0e8c440c6303 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> @@ -321,6 +321,12 @@ struct amdgpu_vm {
>>>          bool                    bulk_moveable;
>>>          /* Flag to indicate if VM is used for compute */
>>>          bool                    is_compute_context;
>>> +       /*
>>> +        * Flag to indicate whether implicit sync should always be skipped on
>>> +        * this context. We do not care about races at all, userspace is allowed
>>> +        * to shoot itself with implicit sync to its fullest liking.
>>> +        */
>>> +       bool no_implicit_sync;
>>>   };
>>>
>>>   struct amdgpu_vm_manager {
>>> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
>>> index 0cbd1540aeac..9eae245c14d6 100644
>>> --- a/include/uapi/drm/amdgpu_drm.h
>>> +++ b/include/uapi/drm/amdgpu_drm.h
>>> @@ -54,6 +54,7 @@ extern "C" {
>>>   #define DRM_AMDGPU_VM                  0x13
>>>   #define DRM_AMDGPU_FENCE_TO_HANDLE     0x14
>>>   #define DRM_AMDGPU_SCHED               0x15
>>> +#define DRM_AMDGPU_SETPARAM            0x16
>>>
>>>   #define DRM_IOCTL_AMDGPU_GEM_CREATE    DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
>>>   #define DRM_IOCTL_AMDGPU_GEM_MMAP      DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
>>> @@ -71,6 +72,7 @@ extern "C" {
>>>   #define DRM_IOCTL_AMDGPU_VM            DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_VM, union drm_amdgpu_vm)
>>>   #define DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_FENCE_TO_HANDLE, union drm_amdgpu_fence_to_handle)
>>>   #define DRM_IOCTL_AMDGPU_SCHED         DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SCHED, union drm_amdgpu_sched)
>>> +#define DRM_IOCTL_AMDGPU_SETPARAM      DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SETPARAM, struct drm_amdgpu_setparam)
>>>
>>>   /**
>>>    * DOC: memory domains
>>> @@ -306,6 +308,14 @@ union drm_amdgpu_sched {
>>>          struct drm_amdgpu_sched_in in;
>>>   };
>>>
>>> +#define AMDGPU_SETPARAM_NO_IMPLICIT_SYNC       1
>>> +
>>> +struct drm_amdgpu_setparam {
>>> +       /* AMDGPU_SETPARAM_* */
>>> +       __u32   param;
>>> +       __u32   value;
>>> +};
>>> +
>>>   /*
>>>    * This is not a reliable API and you should expect it to fail for any
>>>    * number of reasons and have fallback path that do not use userptr to
>>> --
>>> 2.32.0.rc2
>>>
>
>

