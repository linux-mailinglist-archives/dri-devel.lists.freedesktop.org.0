Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6379641616B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 16:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016556ED7C;
	Thu, 23 Sep 2021 14:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FEA6ED7C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 14:49:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mp7KqWpGSM/jQXHas4xvWhQ+uZ3xtZ0CJ8bQyMAAKB9wgePs8RwVvaRRrjPjzFJW56v7mcW8Zv+sSxa8QMXsZJQCWfWKuRfcfqhIhf/0Ej+kD1fhspX78oM9hBko1wJFX6lp3Mj70l9aQg+ylUKAcrb2QTsu/j1zLCG8uilen4xtMswQioPD6BhvQsPgKOiJ1QpP8KXxrwpnj/osUW3iBvrVCKsI5uiF6e960za488+6zMVyXBQbj5ZXdT/H5wHR+eLTCRsODNLdgcVPbfwJI5E26eFsDoWuS/TSNZVCaN8es18QbpJoufZs/43VUJTviIdCZ2JS5Zsx05llWv9xFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=8r/RLM83LxI0+ER16hB1RXwWhydN9rDUL5X0+JRXdqg=;
 b=bb7IFh1C6211Qsul3Eox/1NaktueZX1mXsH5R0QftdQf6drDI7Q+tClYONLoPjVFZt00yk39+kSmHOj3TUcYyTF7NRf54FPJa1P8Uf/YgKL74T5Q7mHJMkLuSRsaUkd4Oh7fkjSeOJJkDh1p+qX+Up7V6KIlg7MIsXbpuh1eE3Hj7hE1Ixtro2reaa61kWVhqEzZUjifWyqvsr2IULvZ4QNKh4W9qOf9Z6ZOxWky6Tr9oPifSlXX1vt9cMXXcFzdPZwpNwNMQom5cCoVU7hFB4SiuQUgztU3vldv7C3DDM+FqNs9wz2Xi/d3jc8zHY0dTlGYr61y3qy8IbmSJA6OCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8r/RLM83LxI0+ER16hB1RXwWhydN9rDUL5X0+JRXdqg=;
 b=x9ys7xVLlT7UxRxq5VD/o4gZZlEx1y+K39K035mWgIWT5SEYH2fIsnyTSSSWW6kfQtdKtFtw/ZxEx1DBxOZWUMH9bk9dDVf28+hmua0uZNXXt1aXY6iKho9cupkFZMOfRhpMFx9SXlOmL0ihQzQ5if/VAd/e/ko2HYc1ZbAyHuw=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4689.namprd12.prod.outlook.com (2603:10b6:208:8f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Thu, 23 Sep
 2021 14:49:11 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 14:49:10 +0000
Subject: Re: [PATCH] drm/ttm: Don't delete the system manager before the
 delayed delete
To: Zack Rusin <zackr@vmware.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210917175328.694429-1-zackr@vmware.com>
 <e9848031-39c9-235e-b811-3735bdf89689@amd.com>
 <6F174F23-797F-4106-BE54-E208FA7571B5@vmware.com>
 <d78057b6-d577-d908-8b87-baf980bd86fd@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <26b9009d-b3b3-73cc-435c-420e42085c14@amd.com>
Date: Thu, 23 Sep 2021 16:49:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d78057b6-d577-d908-8b87-baf980bd86fd@vmware.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM4PR0902CA0019.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:a75a:1e7e:91fd:64c3]
 (2a02:908:1252:fb60:a75a:1e7e:91fd:64c3) by
 AM4PR0902CA0019.eurprd09.prod.outlook.com (2603:10a6:200:9b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 14:49:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66f74c2b-fa15-40e6-9eb2-08d97ea14d9e
X-MS-TrafficTypeDiagnostic: BL0PR12MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4689FC47F053AB0A3F5246B883A39@BL0PR12MB4689.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o0xnB7Ux+J9ljiABYJ2rkdnfJyS5tHfG3o0mGxKylZkD1YLEoEHQGW4kNm4xaygpfB4GHCnDCfeuLVyzwUlHMHrs8cnaA1YAwr03fpoGrYnkJng9/AG7l1NBnqufBdwgb7Hi2RTBh+OSGpW8KniNxoujCpO6/5Ks+F9sUFwvFiJh3IGqfa6j9i8BAU/ilaiAXNApz09IBH3dT4HI8hjzV5IEDUjrcS8s4cmss8I0pO6je5wETWe+zm16S1KFCBt60EjlQxKU5wOht6DZbviu/eXbdPtQXlaX41Ad391PliGTCvxl/Ii7RQAxmfIr2oL5xsmbKtjlmNtejklkxVNmN8BfsS50PyjWcljeUwcPDCM5Av31hd6SUtii9y5M75q61O7j95Kt8o+vwmnz+iq6zIiiBd7Q8NH+kH0B1azy7eQY8DS9PD8i3WCXwAFbfjhHJA7gvPxAE1dYMsX9ccfbK43CmXo91sNWB1JY8XhrCEwJtc/2Wm2i+1gbI0APYzHgKy0y6ldpL5tx2BFaujo83VqvnVC4MnDNNvrrJa8lHKzTCWDmHlFmusL7pFD646uNNhvccekS13PAYdj6viX7YhybrEevR/SxHtq02JojO+28gCcDuM78fiO4BuFKvf6Penc30ItvhHZWm1CwmMCwdPMStfgvrE6lGAjTOJJuwnONPKJMqbUlYhhlLBYhfyK61aA89vvGYOgepYW3kaRhuvrCys5mnRWKx2RZHsJIeLs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(6486002)(2906002)(54906003)(38100700002)(31686004)(316002)(6666004)(508600001)(4326008)(66946007)(6916009)(186003)(53546011)(2616005)(36756003)(66574015)(86362001)(31696002)(66476007)(83380400001)(66556008)(8676002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek9SUG1lNDZJODR2MkJSUjV0Zysxa1RoV1VMWTgzR0E0ZzRsWlZIT2QwQlll?=
 =?utf-8?B?U2JSYjJRU0RtdVV2VXhHOGc1VFZ2UlpBRjU3d21PMEFaMnVheDgwT1ZaZkRv?=
 =?utf-8?B?Wmx4MjVIdFp2Q0t1Z1prZEFBRTlncUdpWHdBNEQ4WFpVR2s2RGlBOVZvajNW?=
 =?utf-8?B?QkIzYjVTclJGN2dzcDJNeDd0SjRSbUFmMVgzT3VyN3JyL3hjazJzY1BFb0J4?=
 =?utf-8?B?ZEdXSHlWMWlWR2p5b1I2SDFoZ1BtMGdUeVg5K1JROUlSOVdwbmlHUHJ2Y2Jv?=
 =?utf-8?B?dE8rNDJ5MmlRZGNCSFVDbkdEZWYyaStNYm9WOHVwUlN0d2VrdHd1SkdRcDQ2?=
 =?utf-8?B?My85d2dUOXZlSDd4U3pNQWpHdmxGVUZURDI5MnQyaHYwZ1NoRW9CTndaYURk?=
 =?utf-8?B?b3BEN1hZMGpUeHN3VHozNTFwWmxEZlFkeVBkMytjdGJSVGZsREIyRnJGdE5x?=
 =?utf-8?B?RythQUErQ1hxVzhiRkQ2eVV1NVlrRU14ejBxSUxQZ0xjYlRjelRST04yblZl?=
 =?utf-8?B?RWlFb0RjTEVIQS9iT2ZOaEN5OE5YOVJEQ1FiVzZuMkovNURjZzRxblRBUzgv?=
 =?utf-8?B?ZURwTFdGNXVOV2RSeWdjQW5MTlBOUHJIeFNKZ3JPU3J4ZkE2ZlhBaDR5YXhC?=
 =?utf-8?B?NkFiT0lCNG1EZW5DTEtEbDk2VkZIVHVJNTZhclNLZTJyQ3ozNXUxR3RWT21U?=
 =?utf-8?B?THBBU1lna0pjMVI0azVnb2pSd2I5a2tnVlR2bDgzSDA2ZEF5MXYweVlnSy9i?=
 =?utf-8?B?L3pITkR5Q2IyNGNqMFZMK2k2MEhJQXpGeVBKVTl5VmQweHdhMnhCdWJGQTBZ?=
 =?utf-8?B?T0FpT1VuNFVnUnBwNTNlNGVNVlplMWx5eVdHOXpkWU5Qc3MwU0EyS3RhVllD?=
 =?utf-8?B?anlFRkhVK09STE5QUTdOYkZNZjFlWkFvZkxiWTB2eXNFTEowWnZHZGd5TDdv?=
 =?utf-8?B?SGFnVFQxalVBMXE4TjdLY0NZbUFvVW1yZWVJVnhuMWtqL2dGbEwvcWR6cm94?=
 =?utf-8?B?NUJ0amFEd0RoS1l4MzY0akJkUkpvaFVrV3RZcWJGVms0Y0x6VnhUVnZ6WmF2?=
 =?utf-8?B?aHRFQ3ZXQUNYYXFUcFdLZy9QNVhFQ1JJZlZSdEV4WXZId3Z3TlRmZVJydHdr?=
 =?utf-8?B?VFBldEg1c3E2VVRHazYzTGQ4UDI2NmNTQlVrU2hUdGNRQ3dDOGdheld4L3VM?=
 =?utf-8?B?S3AwQWVybVIyTXFidzFUK2JmemZGZkZJYXhmQVNyVE9BNkxENGxtQTh4Yk15?=
 =?utf-8?B?K1kxcWZUWjh0NmlWSzljTko1Z2dnZFB0YUlGRWlSbjlBQ0NpNExBL042NE9D?=
 =?utf-8?B?cm1IL284VUttZURsSHRiVFpYckxMNkgrTjFHazc2cW11UGw0MkdkMHlhbUF2?=
 =?utf-8?B?TVcvOGdzVDRJamx1dVk1cDdqbUJlV0VBTytTa05jeVQxdVl4UmVSeEtXc2o3?=
 =?utf-8?B?VGhSWGVYekcvRHdWeG5MUjdBakM0cDFOWDBtUUQ4ZUJ4L1I2cUJTWEFrUkNl?=
 =?utf-8?B?Zkh5Vnc2RUxDQkhDc29YM2RMN25UZDV6QndxVGtackR0YTlNUDhHRlJxdmVx?=
 =?utf-8?B?RVRQbFJsTXNtVEc1eHZJWCt0NVRpeENDV2JjR0tLMTFQQmMzbDU2T0hFdVRE?=
 =?utf-8?B?SjFCU2o4Rmp2dEZ3RzJIVVlYdk9qTU9semRSYUQ0cjJzc1FObFhNTkFUR1Bq?=
 =?utf-8?B?UFNiSU55QWJZK0swR05JNmVvMWJmdlN0SUtxUVI3azRRR0t4MlVhaUFXM0hB?=
 =?utf-8?B?Mkg1TDFScUpDbVovSzlGNlcwRzBIQ3BrcElNbitnVnVyYmVWNUU4c3AyMVNR?=
 =?utf-8?B?WmY4L1ZFdmhwamNaWXR0S3hzaU9XRFdleG9WNXN1Q2prNFlNTmIxdFhiMlYw?=
 =?utf-8?Q?25h/pDy2RCK1q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f74c2b-fa15-40e6-9eb2-08d97ea14d9e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 14:49:10.8610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KKjSHo82q6HPNfADxKJDXfQxltPSXzK9wybuN285xLFQfvWn1yRt14/HYzRstOn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4689
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

Am 23.09.21 um 15:53 schrieb Zack Rusin:
> On 9/20/21 10:59 AM, Zack Rusin wrote:
>>> On Sep 20, 2021, at 02:30, Christian König 
>>> <christian.koenig@amd.com> wrote:
>>>
>>> Am 17.09.21 um 19:53 schrieb Zack Rusin:
>>>> On some hardware, in particular in virtualized environments, the
>>>> system memory can be shared with the "hardware". In those cases
>>>> the BO's allocated through the ttm system manager might be
>>>> busy during ttm_bo_put which results in them being scheduled
>>>> for a delayed deletion.
>>>
>>> While the patch itself is probably fine the reasoning here is a 
>>> clear NAK.
>>>
>>> Buffers in the system domain are not GPU accessible by definition, 
>>> even in a shared environment and so *must* be idle.
>>
>> I’m assuming that means they are not allowed to be ever fenced then, 
>> yes?
>
> Any thoughts on this? I'd love a confirmation because it would mean I 
> need to go and rewrite the vmwgfx_mob.c bits where we use 
> TTM_PL_SYSTEM memory (through vmw_bo_create_and_populate) for a page 
> table which is read by the host, and those bo's need to be fenced to 
> prevent destruction of the page tables while the memory they point to 
> is still used. So if those were never allowed to be fenced in the 
> first place we probably need to add a new memory type to hold those 
> page tables.

Yeah, as far as I can see that is pretty much illegal from a design 
point of view.

We could probably change that rule on the TTM side, but I think that 
keeping the design as it is and adding a placement in vmwgfx sounds like 
the cleaner approach.

Christian.

>
> z

