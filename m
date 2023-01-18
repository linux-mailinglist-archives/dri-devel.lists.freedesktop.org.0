Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5D76717C8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 10:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498B210E6EC;
	Wed, 18 Jan 2023 09:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0BC10E6E2;
 Wed, 18 Jan 2023 09:32:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWLYCaW42txofjgxkfvcmpuHnmnIcq3CQpyGdNY5l2y54DVrQN1G0cN+yFxpQqQNUfza/b216e495IXjLHn770Q3272sMJitK7A8bBnokHKe9BpCwVLSLA2Pejj21Sygwo2/O/uvb1xx9kUPEf8XGQ+tan6/JZcs/uGVveu6P27BUocCZ5hBJ+ZWjbQGb7l+xyohOMhETr8z5byXNAB+T6QddSd0zWPODdVKu03DCEiCIJZXa8PN9yy7U220rgiOXQtSgkudMOVFcSz165pj82SmfUhAyTqI/OepK06cTrOidGJQdnTUJsTRdGyXKKp8GgIcxLgw0KsVF0PITjF0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3c1bzNWPdUJUoYhBugRk5eHBqxOTxBXiaFPMVV4Vjp4=;
 b=NboJGPa73YT0H635RKYbxRYEFlA34bfvfWehrs+DUDRHCV9wj276PCf7H9NYrcDncC0kYruPrUAXG6Gma6X/d1eo8qXtNs6T13E6Z9HZtY0fBmKCOrFl2n21gBa9saTpOumCW5e84Vd7Xtb9lwJrcIiJWAP8FX02skKvWFWmfvghqo8WlKCLx6DHOUO0jn8Ce5hVY0R1/tKSoTsb3g2zfqPiA+JNYdkEi1kUm3v+96djt+5NAXOD9MCoBMy0WdkxInPQXtNcDRd/ivGVTSK+fQFYdt+2LAYJr5jXtYYVK85tO/K3lPrTMEOryAhOS1yJ64h5wfuAjYIl+IBtqzKxDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3c1bzNWPdUJUoYhBugRk5eHBqxOTxBXiaFPMVV4Vjp4=;
 b=MZE/bDvjYCAPdJ4Vp+C79OPNrNdTtelZPYCvszf6aJajc3CfXUD+IbQeDbgbBcp3t4ObkicNeAnRTJyQiKHhf1aqCciFUuBSGzhnOO3ZQTo/x2KZF/C2XVs0Gdr+VGCdhamUK7++xKOuP8bNUy/zwiIeJw9GTpAK5+JEK/BxvWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by DS7PR12MB6213.namprd12.prod.outlook.com (2603:10b6:8:97::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 09:32:43 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::500a:d02f:5ceb:4221]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::500a:d02f:5ceb:4221%7]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 09:32:43 +0000
Message-ID: <d431c824-bfc5-07e6-143b-ed33a3f68aea@amd.com>
Date: Wed, 18 Jan 2023 10:32:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Ongoing failure for "dim rebuild-tip"
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
References: <b1605ab2-7f60-1e2d-de21-a6eb94afdbc7@amd.com>
 <b5192a65-274c-4541-e162-cead3339decc@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <b5192a65-274c-4541-e162-cead3339decc@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::10) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|DS7PR12MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d40109d-c3f0-484a-71f2-08daf936f302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9jOOOssJEFifcZ78PVk9FFWLhUeNu/GZRR/QdY9d4stZNWOcRNMQaLcnblL6K9ecowsZc3LdG4cTEWGtZovzdN+GqqBeBXdmeOiH93hN+qjIcwVWXtVFKrUONXdJ68bAg+MLxv9ZNhPWT9CYsHo/E4Jn86u8QsNSq+Hb74hIKsJkeRUFY5gBEjO1DTxpSRgcUfxa1m4L8SDa/tG7l1In8XvD7TgIzunkyXVLmSrhB3dYRrbABXEMhWrJ7HG5flR3/lkr78rK85kIfaIda6bT5Spv9GUJ9epuptRnFDQRpe1OA6kk/FqC+CH5/LP+hAQNqTdNAcY64ML9KCvQRfWVirDgKPngMgMvKwO2R0tEULJ5ERb1qZ4S8Z+iny0K5lIquGnvr9lFMzZfui0jkGsDWC/fgKdSOPVxY6atL6BrCSeYJdptqExd4UKwDq5VxqXIiGJAzQuF3bd8MNn4G8TpFWSY/5yLoVQWMnUQaA3pH+NCg55TUAAmqARqbLCNKaeJQbuX56tL7h1oBfIeD81shsnpqvRqdBKyHuKQybHss+6w93Urb0H3HMBXFAhbbmI0N0BtssbvK2z8wkOF941QFOfxXiOQC14VD83Z8D8vNgZUk40PTLZKaxZikQOa4bcKjVOb9iA+41rE0xrkqTaGsf6aOzdMaZuLKUwfEGbIFqlIeq4duesCMdMBBmV5JejSYnA2C+nF6R5YJe++PLsfWT37T6OGzisrzI7PpwPkFWE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(39860400002)(136003)(376002)(396003)(451199015)(83380400001)(86362001)(38100700002)(5660300002)(2906002)(8676002)(66556008)(8936002)(66476007)(66946007)(31696002)(41300700001)(186003)(6512007)(2616005)(6506007)(66574015)(110136005)(6486002)(316002)(6666004)(478600001)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWYwZ1o2Z29GNVhhVTRZM09hZ3praGNyZmxwZ2U5V0tCbXMyOWZ4bkdyNHFT?=
 =?utf-8?B?RWVJUVhxemcxTmdNL2JuRmZpdzY1dmdCckxPQVJLK1N4S0RHQ2hmSnVhdVRU?=
 =?utf-8?B?cG9obTFQbjRQQzduMTUvdWJMUGhEQ283Yi91Uk9mMEhud3NIdWQ0OTJPSk5B?=
 =?utf-8?B?S0svTTRZUVVvSndDUGtGVUI0Y1RKa3hHV1pVempFK0NYN0tKMlhDNmQvajU5?=
 =?utf-8?B?MEtlYnJlaXV1S1lLYjB3bitBSHIyaEJlTDZQQ01kNEJnZlNDOFZ2MkNjSVdj?=
 =?utf-8?B?cTBtT01QSnhtNVZkVWxYay9Bc0V1TW1iOTdrNkVjQ1dBVEh2bnBhQTFHOFpX?=
 =?utf-8?B?b25CN3RNdWpLazhZemg0Mmp4RjMwTm9oTG94Q0h3blB4K2NURGlndSs1czVR?=
 =?utf-8?B?YUlMS21Mem8yeCtuZmpQaU1kaHBVTkdXb0tleEFMOUd2Q0RCVU9JTDkxdWo4?=
 =?utf-8?B?YVhxV0FPd1FtTjVhbHljblFPaDZnRDk5cEsvOU9lN3Q2UU1NRitmUlFpLzd2?=
 =?utf-8?B?MWVROThBeVlsNE1iSVZCYjFSNDl5dzA4NFRydm81eEdscHN6Nk1pdFJjcG8y?=
 =?utf-8?B?RndyaUlIQ25Xdk16TDRydTEzaVg3NmxnZHVxUmhsNGRDM3JPc2QvOG00UjhG?=
 =?utf-8?B?bFJvYjlKdndvTkxvU240U0FtOENGZzY5RkMyVFV6YSt4WVMvV25ObXBIL2dv?=
 =?utf-8?B?cFppVDhvNERYQ01FR2ozR0dEa2QrOG53QXE0SjFQN2RkYnNCVVJsQVVSMnp5?=
 =?utf-8?B?aCt5MWJ4OG9ralArWlExNUpPZXNWSHgzWTVxY0YycTZzZHVYbkdWNjdab1R0?=
 =?utf-8?B?UktJaGtMdFFSRVVoZWdoaS9oS1o3UXhpcUZpdFNGcVJ5Z1JiUGgxbmMvWGo2?=
 =?utf-8?B?M2o2WXJrVHlQcldoc3djV1FGZVB1blQzMm12L2pSOFNxc3RaRWdVcTZKUS9r?=
 =?utf-8?B?T1RMMjQrNFZERk9pVi92ZHhZcStKak9hN2hMYWViMnRrTGNzZTRDeEd0TTZV?=
 =?utf-8?B?ODJiU1JhYm5vOEkvbXVMZ3FHKy95RUN5ZWZUTi9OUlovVEZyVklvdkx1SlUx?=
 =?utf-8?B?cVF1Mk5MWnBNY29GK20yZlR1eHI3Vi9Nd3N1RVhVY2RaU0Q0bjRKSnF5UjNV?=
 =?utf-8?B?NUNnLzFWeGtpV1NFL21CSE5QY0YwYy9BYWhUZVdwVDhwYkZkNkRYcGVuTDRR?=
 =?utf-8?B?a0Qzd3VwRmdxZlFzOTh1bjFsR094SGdWN01MT1lmbkRkQWFkTHpoSEJnQkhj?=
 =?utf-8?B?blh1VTE3b0s5SGlCNUZJU05XTndmQzl0TkZxRFJTN1loUW4wdGd3QVVSVHAx?=
 =?utf-8?B?KzFhVXhKSVRFblVlMkVtd3N1WFBzaWt3ZEgwNVZPdnBXR0FHeHJQbjNoR01m?=
 =?utf-8?B?OHhCWVBYbjBtaXVlNUgyVWxuQXBNUldLYTZPbEFBZ24yYkM4WXJ6bFMvRDB4?=
 =?utf-8?B?S3M5ZHM0Y3huZGxxcEhPTERSMVE1NDg1eGZGbW4xaVN2MGYwalBvN2FkcThR?=
 =?utf-8?B?M3FJN2VMWHQyNnRBZjNLaGd5UDVsWmcrYWdDSHM0U0ZLcUE5QmVEaXo5aWcz?=
 =?utf-8?B?OGdRdDBlZW9OZDl0OUZFZEI3dm5mRERIS0xaQW1PcjNJYnZyZmtlQkwzUzJ2?=
 =?utf-8?B?cmxQTnFxSk14TDhISytLWUNZWUs4TVFmNk1kRGt4ZEU0MHdBeC9wQlNPMDl0?=
 =?utf-8?B?L2FGRlJQV2o1MDVaNEp6WllDS0c5Nkxha3dOOWFZd3RJZ3pBc2VTMm1YbHdj?=
 =?utf-8?B?amY2SzYxKyszL3lERWhzMStvbG1vUEFxazRlM2VGY2hTbFQ5ZlFaZWcwRS9J?=
 =?utf-8?B?VEEvU0Rxb2FXUVJsQmlHaGdjaWtRTytsWVBGN3ZTNDBKTFo1ek0raE4zZEdw?=
 =?utf-8?B?SG1HczhFNXFFTVA2N1ZlSmVtUWt5dFVRclUxbWFoL0k1bTViQnJkdUhGODhF?=
 =?utf-8?B?QXJnUmpyVlhRQlN6NGMwcWU2dHhWamMyQjl6NStwSWdlV0tRWGMrN09XOGxx?=
 =?utf-8?B?Tm1aakdkcVpmZ1piWG91V0ZESjd2T1c4TGU1Z0JDaVFTWm9mUmw1U05BYU1o?=
 =?utf-8?B?T3FkWE93SkRaL1RjQ2Q5SDZ5UzI5U0ZtM24rVEZTNHFQUEZBOGlpMitXcVdD?=
 =?utf-8?B?Yk8yNnZFZE5hTHdHbU1sMVVXS0lGVUs5SnJYTXVOTlB4bGlpQlJkWFk4ZHhU?=
 =?utf-8?Q?0c13Iw5xe/7bVqN6dYCRkdP+pI5Ps0vLFrz2kIeBsiWZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d40109d-c3f0-484a-71f2-08daf936f302
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 09:32:43.0357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQlnQcnODNjW8RtZ0qLfOTdRkIuCal/qdIrT5p54RARedZF/OPWcsj5ORXceKXfU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6213
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

Am 18.01.23 um 10:29 schrieb Thomas Zimmermann:
> Hi
>
> Am 18.01.23 um 10:13 schrieb Christian König:
>> Hi guys,
>>
>> for a couple of weeks now the command "dim rebuild-tip" fails for me. 
>> The error message is:
>>
>> Merging drm-intel/drm-intel-gt-next... Applying manual fixup patch 
>> for drm-tip merge... patching file 
>> drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> dim:
>> dim: FAILURE: Could not merge drm-intel/drm-intel-gt-next
>> dim: See the section "Resolving Conflicts when Rebuilding drm-tip"
>> dim: in the drm-tip.rst documentation for how to handle this situation.
>>
>> This also happens on a fresh clean install of dim, so I'm pretty sure 
>> that this isn't a problem on my side.
>>
>> What can we do?
>
> Just blindly guessing:
>
> Are you sure you don't have any old fix-up patches somewhere?

I don't think so.

>
> I've not seen this problem. But I've found a fix-up patch in my tree. 
> Maybe the attachment fixes the problem for you? (goes into 
> drm-rerere/fixups/).

Yeah, I have that one under drm-rerere/fixups/ as well and it's the only 
file there (except for .gitkeep).

I will try a fresh install once more.

Thanks,
Christian.

>
> Best regards
> Thomas
>
>>
>> Thanks,
>> Christian.
>

