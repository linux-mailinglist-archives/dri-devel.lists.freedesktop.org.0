Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F20262F201
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 10:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2998C10E21A;
	Fri, 18 Nov 2022 09:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2072.outbound.protection.outlook.com [40.107.96.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D47710E21A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 09:58:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1Rs3D+RrL08/4JqZi/w3dKJw+2pcg8ukar6gnHeS/ogxtyzlc9HXV2wXzB+9fl3BQQCwU8zv0A8K+cfeM0vIaOy4jw1IneTTXcyV+oq4RbxBfySfm8jb9fwrKGIPecSzXpBzvReo4JGs/RAXPUo6CYjMWshcRXftK8ht2P2bUvgmdyNuSxYzMEUeOiQQfsQXddYrxAPHE1PMxXZLtmMFqf9ahQ2wxpHeD5OJPL/txojewrn/VlEvoFOnve8IVDTvl6akqLWay0MiijQs0HV3FQGhJM7zkmSu211REsVPO5+o4vltzc3rDDDzfQdbUzDvzofSA5Dkrd3LPd1AyZnOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJF/IU7uZQzyCaWWiq8jwaowTN85bSbrM0A9GtwRBao=;
 b=VDjJVEmFaA+BUAny5qQovG+Hb2o4kKqpJg9yGIO7307s9d/E84gSPetHKM95WhjCXEzf4sgQM05NBrcn4JvAbU8m2adDe3dyKrWR1wQCYhylzsPH3rTk7+9N+UcHmfxWeCbrpTHVZhNjTPZj5k/kW6EsUU3c29TY2ovEOLefowAHurHfa2Hc1vETO938RIhEKJyXKYm0/tBL1dr3TDomhQN2Zo5tkD3mQYJAyXV+i8KM5ZfJ06fqc1Nk/M8WbDKXim4CwRSaMr/yn7/vIFKuYMJtjqX+ILf4VF2GaAZQTZT6Len1b8N95AWC++8YekPb4u/7MSwEAEPkFjVOXMJDYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJF/IU7uZQzyCaWWiq8jwaowTN85bSbrM0A9GtwRBao=;
 b=Fth/zx0qDmQ8NUbbigXZ63nOTI/3gzRo0SNwLpgHUe1wcygX/Nh4EknkjyqQ2/zZ2tiB87SuBWZVIeMe1odt0u2nv6XBwGbo4Hwg4EXqT27rsbxLf5nH7UkYIhug7EYsk5tXuNKkNe4w1/3GFHaGl+Os5SQqWZxfXNAQcoDvaYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH0PR12MB5140.namprd12.prod.outlook.com (2603:10b6:610:bf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 09:58:33 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5813.017; Fri, 18 Nov 2022
 09:58:32 +0000
Message-ID: <b31fc44a-5827-5213-2a8f-9f0529155542@amd.com>
Date: Fri, 18 Nov 2022 10:58:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5] udmabuf: add vmap and vunmap methods to udmabuf_ops
Content-Language: en-US
To: Lukasz Wiecaszek <lukasz.wiecaszek@googlemail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20221117171810.75637-1-lukasz.wiecaszek@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221117171810.75637-1-lukasz.wiecaszek@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH0PR12MB5140:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b1c632-0298-484f-fe22-08dac94b73a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EBIZXCEzSr6CwGImqN49TCA/TQI1U0Nz1AqZqqcBEVJl7k6ZtU6aaRWXNfYjn2LuN4Bt83/kfkH0Q92a0wFL9jdXWnl6tUFjJbyLTfeMTu2gDCZ0yhrw6gDKwP48uysw3FO8OfiHT36vT4DV/Zi9/bPe/njtChwgiJcHC6iN8yJ044OQNrYxfn4PWCC+g87jU5t3jye4ffnE+C3fIt9o89BoQty6VFHJiSE/C+4AgcIuCszdHGKiJw6ZdAmwv19lBbJAqK4ZTy9MofxtjxIM7s/X5EyiVErIpPwH+eCZXoA5J3oCxxJkcpXU/CNhn5BMbgOClFxnIbRpx/3ABZCDZ/SJCvs3VbQ65UPDGVeWQegp4KChaylrpt9eot/neeE7L/xwBkbWKbHFNIAfFOYezwRd6dsAMAAQ3YqhbTqzlB1IfQX1onSAoV/BBgM1zsniZ1X64sutKaA7cIBxDvJF6UQf1pr3fI7LNEGaeK66cXjmcAkGse5dmYW7FWZ4qY5BRBFl/YIuv31S9YK8C/Eqk3HqcPb8/8sBZiQ0uH4gLb7T9Lw6pNMMDf3j2Zn5BrrftbEtd9PUHYLS0a52yL04K8C6FQZ/LgK/gziNG51RWOu9bmICs7W1AO9Lmqk1jVasH97hr1vomuY2w9sFKEcGE3Zcjm7/wO6jQcAwIunLqjTfS2gMLSxCB4LOspInjuaS1XHC9lZe/kiYVRAw0uH9aL5RR+v5Ym0zQROb/4U7iYgVABC2kVM58NMA4yeE11VKcrKuvKO22jDX8P8GuF2yadrgn8vqRWPOf1hpCYthgdM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(451199015)(45080400002)(6666004)(6506007)(66574015)(316002)(6512007)(110136005)(66899015)(31686004)(54906003)(2616005)(66946007)(8676002)(4326008)(66476007)(41300700001)(6486002)(966005)(66556008)(5660300002)(186003)(8936002)(478600001)(2906002)(83380400001)(36756003)(31696002)(86362001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2FxTWM4SERvUE9CT1VmMzVPanoyTWNla2tGbDNXcCs0c0RUMlE1bzdIenFv?=
 =?utf-8?B?Zyt6TjJxaEMxQnYvUUs1SllNUkgrY3VRL3FlRjZ4R09tVk0wa2dVV1hCdVg5?=
 =?utf-8?B?S1g3aUQxcEFFWkFheVBMT1AzcGY0WTA2TmtPeStMWUd2LzJ0VEJzSWFSWGhM?=
 =?utf-8?B?V0w2TW5KSFZna3kwaEUyK1l5M1dndzc3ZzFpcjNtT0h4OUg1dkdyM1BVZmtH?=
 =?utf-8?B?eS9mWFNkYkZ0YzBqTTJPTFdFcEtXcjV5UGkzMi9STUZ5VjI1TVZGVUF4NXll?=
 =?utf-8?B?SXlsMEZQcGZKTVRwbHZmbzhJK2NESk03UVdnWXozQWYyeW91YXZhMFJSdGg3?=
 =?utf-8?B?NmVKa3Y1eTVvekowTzRBYmN0bGVWbmtQR2x6ZFdiWDlYVmZ1am9XU28zOU9u?=
 =?utf-8?B?a283VmVRVnBVRHpKY0FPV24yV0czNG1RQW4zMEJXUHV2VVgvc2dYZ0ZxZ0tU?=
 =?utf-8?B?eUpDUTJzSENBdFI1MHVhZU9YM0gzTUduNHBaNDJPcVJIeFBneXpNY2kyTW1I?=
 =?utf-8?B?QmRxb0xpWUUyV1ZzNStMMDFsVXBIYlVsQ082TlNJZ2xVN3lOcnV5U3FHclJE?=
 =?utf-8?B?NGFwVUsxKzU0VGc1SHJqSHp5T3h6aDc3amo4MkJpWlhCN2MrT0tESGM1bEN4?=
 =?utf-8?B?NHRIWHZWZFhsQTQ3ZG1tQk1CUnU0QXZHanl3eTQ2c3BZZXRycVBFOGFYN1Nv?=
 =?utf-8?B?NG9HZEtxcWhETDRoVnNlK2FMNkVSSjlEcWpQLzNDTW1TWExxTmx4bTRoMzEr?=
 =?utf-8?B?TjZUelVXajdUL1czbk15dmhLQ0VaSXEwYjN3ak54Ly9qSjVSTXpHeGtjVGtv?=
 =?utf-8?B?dHY3VE1ZWnN2bVNRSWQxcWZGbWpOeksvb25tM3d3UTNTeVk0azBnUXVrOERH?=
 =?utf-8?B?ZlBFZHRzK2VNTVlwRTlRVkdCeEpPVnhJR3liY3JkNUhEM2d1QkpnL1BMdDJs?=
 =?utf-8?B?bkxlYVhkRHhSbFZMdTB3TFpkOEtZVTVKYnNiaERTZHNxSEFJaFJHZllsL3Rz?=
 =?utf-8?B?bXRXZWlRQ2ZGRUMrdWpibHdkd3BkNTVRZVZETzdYU3JJamZmYzdvS3hZSkhN?=
 =?utf-8?B?Qi9CQ2MvZlpEdVJqSXVOUXZBbW43MWpldGY0cXg4bGFBSDN4Smo4SFo4elZa?=
 =?utf-8?B?OFdqZnFnRWlGUE1rdUVKcW1kMkRCdjd2L1ZZQ3Rrakl3WE5uYW92dE9sTysw?=
 =?utf-8?B?Z2FQRlMxZ1A1endObU9vU2pUczFEOTBNQTF6TFAwOHJJNzlTS05nTXVqRklo?=
 =?utf-8?B?WmpNUUhVTnZtQlRWQUN4Mk83eVBXalU2Q3R1bFYxMGR4cTBNdnlldmhxNWl2?=
 =?utf-8?B?Q2ZKdzVIYTdoejhjYVdDNVU2NlorQ1VnNTk1QVdrajR0dG92R1h3UlAzb1Zl?=
 =?utf-8?B?VHZ2NDRlUC9mNTNRZHlsQUlIbG9qS1p2Q0FBN1I0MnAvRG1yNmk5R1M5ZUVx?=
 =?utf-8?B?N2ZGTlEwNjBCbVVzVG9GbzlWOXE5ei83RnpNVjBXNUZoUEw1UTFpODdmVU8z?=
 =?utf-8?B?U0YzbGFGWHhkS0J5dXh5VVAxYnFZeDVGNGs4VWN5U3NqNEdjbXZlYmVmLzIv?=
 =?utf-8?B?M09tWlZlVk1NRmVlT1ozWmY0bkk5N09DTHo2M0FIV3lTUFY5UlZ2U1Fxc3FP?=
 =?utf-8?B?V3J4SDBDRWc1ZndFN2lhVkVJMEh4VnZwdjhwYnk5bmNXMG1JSEN1TWNTbnU0?=
 =?utf-8?B?d2g1SUNsQW5Qb2M4TlZKZ25KOXNEY3J1YzJHaEVWRDQvZWpMbG1wMmQvNGtZ?=
 =?utf-8?B?eWJ0Yjdib2VyU2EvcnRPTjhLTjRlb2o5em9tcmREZXBQeExNL1BaVjJDZEdx?=
 =?utf-8?B?Q0Izb094dkIxc3Y4U0RPQndxL1AxL2FxTmpFRG5JRHlZWWdWNkdhd3hjUHdI?=
 =?utf-8?B?M0F0MkxLTFZONlhLa0FrVTZMUlZ5aHdvUU9DdFlYV0ROSk5pa2xiWUVRY2l0?=
 =?utf-8?B?OFQ4aVpLVUV4RDczRDZvekFCSVFTZFE4a1VrdDZtcGxjVXdhYTFSWnhLamlP?=
 =?utf-8?B?TmM3M3dzdml0aEZmSFZKMFp4VjVkQ3lNNlVhbXp4VDViKzZDRnhVTWEvQTJS?=
 =?utf-8?B?Qkh4Ym9lL1l3U0hzQVJ0M1UxcE1qc1pJeE4zd1F0YkMzeDA3K1dtL3ZKYVk0?=
 =?utf-8?B?TDlpM3ZsMkU0MzE5S1A3Q2x2OFV4T3AwTDB4bDFrVjFWT2lOTEZ4bTlldWJk?=
 =?utf-8?Q?6Q8ag+yHZik1EaQpGbnUMrrzEeSYovmgZH7eDjawgQqS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b1c632-0298-484f-fe22-08dac94b73a6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 09:58:32.8119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ishwQu9LVjOPABzrB1BgVbi9yhk0pgISx7RQE8DM5YMsBo8fi0LRFTD/ZQ5h3Wdf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5140
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed this one here to drm-misc-next.

Thanks,
Christian.

Am 17.11.22 um 18:18 schrieb Lukasz Wiecaszek:
> The reason behind that patch is associated with videobuf2 subsystem
> (or more genrally with v4l2 framework) and user created
> dma buffers (udmabuf). In some circumstances
> when dealing with V4L2_MEMORY_DMABUF buffers videobuf2 subsystem
> wants to use dma_buf_vmap() method on the attached dma buffer.
> As udmabuf does not have .vmap operation implemented,
> such dma_buf_vmap() natually fails.
>
> videobuf2_common: __vb2_queue_alloc: allocated 3 buffers, 1 plane(s) each
> videobuf2_common: __prepare_dmabuf: buffer for plane 0 changed
> videobuf2_common: __prepare_dmabuf: failed to map dmabuf for plane 0
> videobuf2_common: __buf_prepare: buffer preparation failed: -14
>
> The patch itself seems to be strighforward.
> It adds implementation of .vmap and .vunmap methods
> to 'struct dma_buf_ops udmabuf_ops'.
> .vmap method itself uses vm_map_ram() to map pages linearly
> into the kernel virtual address space.
> .vunmap removes mapping created earlier by .vmap.
> All locking and 'vmapping counting' is done in dma_buf.c
> so it seems to be redundant/unnecessary in .vmap/.vunmap.
>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Acked-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>
> ---
> v1: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flinux-media%2F202211120352.G7WPASoP-lkp%40intel.com%2FT%2F%23t&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C9ef170d657a94849986f08dac8bfeb0f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638043023852257558%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=yml6LFzivvU1Vv4cHRf47BEeqRN%2BkH1Sy%2FN4h%2BMpRxU%3D&amp;reserved=0
> v2: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flinux-media%2F20221114052944.GA7264%40thinkpad-p72%2FT%2F%23t&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C9ef170d657a94849986f08dac8bfeb0f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638043023852257558%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=mBEfWp7w8wTIhO2qF7ad9GrfMyX29EM3neHNHm0i2Zc%3D&amp;reserved=0
> v3: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flinux-media%2F4f92e95f-a0dc-4eac-4c08-0df85de78ae7%40collabora.com%2FT%2F%23t&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C9ef170d657a94849986f08dac8bfeb0f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638043023852257558%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=2LTn8lzg48%2B%2BTK4w3vctyQ6PjUva%2BZKS8eZeLG%2FWR7I%3D&amp;reserved=0
> v4: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flinux-media%2F970e798d-ea26-5e1e-ace8-7915a866f7c7%40collabora.com%2FT%2F%23t&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C9ef170d657a94849986f08dac8bfeb0f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638043023852257558%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=tO4Tgd5jPeu6%2BNuWSl%2BSqF%2FEh4dI7vaah4%2FICimHvgo%3D&amp;reserved=0
>
> v4 -> v5: Added Acked-by and Reviewed-by to the commit message
> v3 -> v4: Removed line/info 'reported by kernel test robot'
> v2 -> v3: Added .vunmap to 'struct dma_buf_ops udmabuf_ops'
> v1 -> v2: Patch prepared and tested against 6.1.0-rc2+
>
>   drivers/dma-buf/udmabuf.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
>
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 283816fbd72f..740d6e426ee9 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -13,6 +13,8 @@
>   #include <linux/slab.h>
>   #include <linux/udmabuf.h>
>   #include <linux/hugetlb.h>
> +#include <linux/vmalloc.h>
> +#include <linux/iosys-map.h>
>   
>   static int list_limit = 1024;
>   module_param(list_limit, int, 0644);
> @@ -60,6 +62,30 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
>   	return 0;
>   }
>   
> +static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
> +{
> +	struct udmabuf *ubuf = buf->priv;
> +	void *vaddr;
> +
> +	dma_resv_assert_held(buf->resv);
> +
> +	vaddr = vm_map_ram(ubuf->pages, ubuf->pagecount, -1);
> +	if (!vaddr)
> +		return -EINVAL;
> +
> +	iosys_map_set_vaddr(map, vaddr);
> +	return 0;
> +}
> +
> +static void vunmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
> +{
> +	struct udmabuf *ubuf = buf->priv;
> +
> +	dma_resv_assert_held(buf->resv);
> +
> +	vm_unmap_ram(map->vaddr, ubuf->pagecount);
> +}
> +
>   static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
>   				     enum dma_data_direction direction)
>   {
> @@ -162,6 +188,8 @@ static const struct dma_buf_ops udmabuf_ops = {
>   	.unmap_dma_buf	   = unmap_udmabuf,
>   	.release	   = release_udmabuf,
>   	.mmap		   = mmap_udmabuf,
> +	.vmap		   = vmap_udmabuf,
> +	.vunmap		   = vunmap_udmabuf,
>   	.begin_cpu_access  = begin_cpu_udmabuf,
>   	.end_cpu_access    = end_cpu_udmabuf,
>   };

