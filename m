Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA5C6BC6E1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 08:18:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8084310EC1C;
	Thu, 16 Mar 2023 07:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2047.outbound.protection.outlook.com [40.107.96.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870F910EA5D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 07:18:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmgF+OPbkpDcxYEPAr2Hy4aYBxfFgBpF+jw+9NBunnvkmmojAVNF+P1Wzr86EHB/JFlTWSFFn++7L5PxL5m4znnXBflVeHimptKfRO6bxoxA2ZG2qcrUZsnHTNSXNBRDxuqjOWeanIouUZglYYCrr6eXatpStglOTTHLjGu1muY8oStxuJ0XKD6o+z00bnHGZXRNNy3NNy63nc+pFSMfQ3fArhX4CQD5hOl14E2y022sccVcLeTADaYrN0R3OBSSCM9q70HMrLXx0aDjuGm5DrhgKMkYKM2g9w0BURvwTclngVScEwlBiUztwkWy3JuvsO50mrZKWIflzxIIsYah6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsgXCsEQruP4GT3+9xiP1Dnq1tZlwOuzJ9237Cdukb0=;
 b=BS7yxySC8tmG4PubcjKl5yOU0JaEmeinhHiMZ9/cVWyghEe3oeuDmccC64rMs1m9LqORmSVjzjCHa13f7A9Saa5s0d/2cZ3Yn3dLrYc1ptCfUJUBZPPcQVrCtsZ2XcFeNYIJJDMfvv3L6bzaxec6M201kzmcbCtNQBpZdzeZGnksbSpFQtBQSdd0UcU2hlxMIo+hg65HilDviWalLNm8M/A/WpeVO6a4FTbtbcfyg8/MjCjKvF1Y4XF1XRCkno2kRNo3v/JmblntCF0btJF/yBWLkbtMZySVbwXqdS2RmvOxbftExqxK4kXw7eblPDWaX9l0a19KUk76GtJmHV76yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsgXCsEQruP4GT3+9xiP1Dnq1tZlwOuzJ9237Cdukb0=;
 b=v64ER0Gne1EdG3t7M9SHIrIUfCu8Skl745kaLZiSABJ4hgzO4TJq43GZZmPg2dnuCzJBte59dgTVZYsM3W9Fcucq/FJQM06BigcRoIoiicMhVpxS6gXnmpptT+442QnzWkmIaj4XAbfP7orFqaJN2XAK5QEzAWW2gX4LPpLpfHE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA1PR12MB6774.namprd12.prod.outlook.com (2603:10b6:806:259::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 07:18:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.024; Thu, 16 Mar 2023
 07:18:19 +0000
Message-ID: <efcc3a66-78ca-4e0a-c0fb-527da376fc06@amd.com>
Date: Thu, 16 Mar 2023 08:18:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 2/2] drm: add kms driver for loongson display controller
Content-Language: en-US
To: Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 suijingfeng <suijingfeng@loongson.cn>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20230315211550.2620818-1-15330273260@189.cn>
 <20230315211550.2620818-3-15330273260@189.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230315211550.2620818-3-15330273260@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA1PR12MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: e7816308-f93c-485c-e3ac-08db25ee9e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PZYO3CIXIl6+vJpPyQUbwwoqavitu8KnKoLbLcJRbF6X0VRi3yCHBjam1ShEl5FF9BUdI5PWFDk5SEzRnMuc1ccf/RptIcjtyeOV3PoQRdT9jvRwxkgRHR1TwdqBnzakvJf3vxUC6A1VQso7eAWsRG8p1SMPpcl2JeShr0sBruWP2o7V+W9hzMai0J/PNJKSIf+/fZi9oQQBaCY83tyKC5GG+w9925/C0I93QAZ5CFeYn2P+KdWO+zU+N8yo6SxOmf0FTTOoXhXw2rh3Yn+FUR9k/z7U1TXEoe3VtMizMay0uSOriyqpZz4WiCFcFVoTtDarDhJ8r5mrrN137zItnRsG5kte8oh+dH8vgVJl5K/UNlzA8pqF0ZCAE0piTeVXmXgIQ9NbSWCG8TYoFt4gVIFkG8JEfAHOboSjJxhtk6xS3j4Rpf2IXBPTtjvebTfU6qsbDQaHlxhyAJVwTeV0R7tlsIbSV1db8bwCSUjr9KM3vQNN5rPpzla6Eb5W/Unya/E73CRryRbG/g6UQRFRATj5PUIICU9BgxvPy1oOiupmgVzbxyHafzy/kO6stdYgDWvbdCqevlfVZf0fBgFx7shPi6MVAjoXQ4Z2salmTm3HFYYzoP14S2pUiHf1OJPkpXY5oaa5XE85V/AcQn8FLFJpF9wWx5ih0kYoFVxJJVgTWTzikiLoL1bvRElN3pqRAlaYQcl0nFlbVnJifBzrBYYQZ7GEIPlyzlFVRCMLrzM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(451199018)(31686004)(83380400001)(2616005)(38100700002)(7416002)(5660300002)(186003)(66946007)(8676002)(66476007)(66556008)(41300700001)(6666004)(2906002)(6512007)(36756003)(6506007)(26005)(4326008)(478600001)(31696002)(6486002)(8936002)(86362001)(316002)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V28zL05DTTZYcG52R2tvbHZ0a2svL2hPY0l4K3owY3I3NGQ5Q2t1eENKSld6?=
 =?utf-8?B?UGtSb1lFbEFmeXpnTm1SMDRSaTNxZWJ0RE5GWnJzQ0lPZndlVTB3OUJSSWsz?=
 =?utf-8?B?ZENuV2JmNXlOaElVWHh0V3hzOXNNREtjRlR5RHg2M2tCMVZWY29iUU9xNXZo?=
 =?utf-8?B?ZjlIWWFDMHpQSzl3NXVONytOWmpSRzBjUzZDVWNnaDU0WWdocGpoYTFxYUNY?=
 =?utf-8?B?ak00a3NRMnR4cU03cE13aTd4TTVGSGdJMzdFcFVxMGxSMnpxbXgxTHdoWTB5?=
 =?utf-8?B?RDc1RlRvVFhNU3cxZnIzWTBWeHNYai9hUjF5NzlZWU0rd0w4cEdqMXcxakJj?=
 =?utf-8?B?Vmo2RXJHYzQ0Y2U5ZnMwVDhkNDIvZkNMWEZoME9xZ0NodlAyazhRS3lIRkdN?=
 =?utf-8?B?Y0ZtV3FWMi9GM3h2TjZlVjAxTktZbWtpYVZ6YmhWZGRKY3JEaS9DUGxqS0xq?=
 =?utf-8?B?RHNkTVIxM25xRVFTeFZrUUIrKzZYMk5vYzhwczVVaGhXYWJWRjYwZndxTWs2?=
 =?utf-8?B?eGY2QkZqZHpoZW1XUlM1RWFJdm5abnVvOFgwMCs5eEk2VFg4M1RyVGxiQS9X?=
 =?utf-8?B?RjlKcGcyVXZwdWVQWUNtNmgxZ05RVnJGMGk0T2lXWjZFeWliUlZVZXF3akh2?=
 =?utf-8?B?SWpHNXo1QXR2UFlRdlZEdXdGVmd1MklTYzY1dkJtWm42RytlTFkybE1UaFZY?=
 =?utf-8?B?UEc0cGFZcGhqbGJCaXd4eGxacmlpbEtMTUE2NDNBdVg4YXBCbWlIT3FlaUNT?=
 =?utf-8?B?TG1IUTNtUDlqdFY3NGFyS0VTYnNRcG5MQlRsYjdkQjJnL3hNK2grT05CeC9p?=
 =?utf-8?B?cGZveURBTi9pYko3a01FL0ZubnVYSklUVkhYSXJqQVpaaFdXS3BuTEhYMnNx?=
 =?utf-8?B?L2RJNnRLb0NCUzdJODRtNkVRNXdKMzVJVXZmS3RjQzNhbGk3aTdXNE5LY0tW?=
 =?utf-8?B?cTFpNkNQcHdzalByaXVqZCtRTWxJRW5MdXJkK2p5c25YVTZwWFl0b2ZBMXds?=
 =?utf-8?B?Tm9za2ZGdTY3dDBEQ2hOcE0wWTQ4NjNFVnZTUkhjRXp5MWlLNVdmYk9jdUVR?=
 =?utf-8?B?cE1oNm5lckNwdWpoWlJNQ0RwUFA4U1NZMGl2RXRGVGU4Q0szdHZVaGJFMmhx?=
 =?utf-8?B?Rm1KMFZpazQ5Sk8vcVZwOUYyTUlDU0N1YjR0MHNJdzJkTkVjVE1YeVFYVG51?=
 =?utf-8?B?Y0lCZFlyU29lZGFOaU81TDF6RUZpZFZLbUc1MzcvR3hTTXB5SkJ2WklLZnBk?=
 =?utf-8?B?S04vWlFxK05WeEVXY2N6SC9iYnlLRGNZa0svSGhPaSt6RkZLTU5rWFhGUWlN?=
 =?utf-8?B?VENYWjltSjlRSHlydDROTXU2VGJXVW10Zit5bkFTL1NrK0RhcUVLZEpZblpu?=
 =?utf-8?B?d3RTVm9DR1hVU1dlOXhnY0xRQTQyRURKU040aFhoNm5hcXZMWE1Lc0lUM1pL?=
 =?utf-8?B?S20yWUdKUEpMNUxvNWJqKzY1YzBEVjNJeDl1M3JMUFZuZmR2aVVRbnk2cTNi?=
 =?utf-8?B?cndGdlZ6SEIyL1U0Y1Jjb2JLS3BLbGRSWVltWGY4MDB6WEozN0MyVXZkR1p3?=
 =?utf-8?B?cnViQXhKY21GdGFITzRYaERQMDdIOXkrR0RGdGFJRURyYng3bDRxampSeWxo?=
 =?utf-8?B?R0lOOGtWd3FWMDlRZ2Y3bzdWNkpMRmxJczBQL2paL1NUSFBwUElOT2xBajRm?=
 =?utf-8?B?NzV3NVhpRmVCNi9UYndTZlplWHNkMlQwU203SmNqRCtUSnBhaUhDVm1KbzVK?=
 =?utf-8?B?VW0yZzR0OUoyMWFmZnJZazQwM0tUbmZNby85RXFWekZRRWVPMVRWWHgrTUdN?=
 =?utf-8?B?Y09Fc2VpemhxcTNSQmppK2ZyeGVXL3FkTnlBaXljRU9qVytZeFZmZnBPS0p2?=
 =?utf-8?B?WmpXdlU3K21hOW9LV041V1pyem5rZ0dESHo5RTNHcjJnVU5zbmpDZFhESWo4?=
 =?utf-8?B?VWw1R3hsSmlDMDNvNFBRRUltTk1Nb2JocytTTnBrV09MS2NLa0NnTGZYY3dF?=
 =?utf-8?B?a3NQanpLUUdaWXMrUlZpRkNrVzNrbnVDajA4M0xZRGFhTzVsTStYZmN2NGpk?=
 =?utf-8?B?Z2w0RzV3eUpWWlQvUDNzVDhwZWpRNWtUT2lIdHViTFlWWUJlUG5iYVZyL2lq?=
 =?utf-8?Q?FZGy/8uDEgAUGInfXz9Iod0Tr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7816308-f93c-485c-e3ac-08db25ee9e18
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 07:18:19.0901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ONDbNlZZs4/ajhD0BFcng/30/P4S88cWKsmk3niEOWLWvKWBWlsZaXRpWQ56n9LS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6774
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
Cc: linaro-mm-sig@lists.linaro.org, Li Yi <liyi@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 15.03.23 um 22:15 schrieb Sui Jingfeng:
> From: suijingfeng <suijingfeng@loongson.cn>
>
> Loongson display controller IP has been integrated in both Loongson
> North Bridge chipset(ls7a1000 and ls7a2000) and Loongson SoCs(ls2k1000
> and ls2k2000 etc), it even has been included in Loongson BMC products.
>
> This display controller is a PCI device, it has two display pipe. For
> the DC in LS7A1000 and LS2K1000 each way has a DVO output interface
> which provide RGB888 signals, vertical & horizontal synchronisations,
> and the pixel clock. Each CRTC is able to support 1920x1080@60Hz,
> the maximum resolution is 2048x2048 according to the hardware spec.
>
> For the DC in LS7A2000, each display pipe is equipped with a built-in
> HDMI encoder which is compliant with HDMI 1.4 specification, thus it
> support 3840x2160@30Hz. The first display pipe is also equipped with
> a transparent vga encoder which is parallel with the HDMI encoder.
> The DC in LS7A2000 is more complete, besides above feature, it has
> two hardware cursors, two hardware vblank counter and two scanout
> position recorders.
>
>   v1 -> v2:
>    1) Use hpd status reg when polling for ls7a2000
>    2) Fix all warnings emerged when compile with W=1
>
>   v2 -> v3:
>    1) Add COMPILE_TEST in Kconfig and make the driver off by default
>    2) Alphabetical sorting headers (Thomas)
>    3) Untangle register access functions as much as possible (Thomas)
>    4) Switch to TTM based memory manager and prefer cached mapping
>       for Loongson SoC (Thomas)
>    5) Add chip id detection method, now all models are distinguishable.
>    6) Revise builtin HDMI phy driver, nearly all main stream mode
>       below 4K@30Hz is tested, this driver supported these mode very
>       well including clone display mode and extend display mode.
>
>   v3 -> v4:
>    1) Quickly fix a small mistake.
>
>   v4 -> v5:
>    1) Drop potential support for Loongson 2K series SoC temporary,
>       this part should be resend with the DT binding patch in the future.
>    2) Add per display pipe debugfs support to the builtin HDMI encoder.
>    3) Rewrite atomic_update() for hardware cursors plane(Thomas)
>    4) Rewrite encoder and connector initialization part, untangle it
>       according to the chip(Thomas).
>
>   v5 -> v6:
>    1) Remove stray code which didn't get used, say lsdc_of_get_reserved_ram
>    2) Fix all typos I could found, make sentences and code more readable
>    3) Untange lsdc_hdmi*_connector_detect() function according to the pipe
>    4) After a serious consideration, we rename this driver as loongson.
>       Because we also have drivers toward the LoongGPU IP in LS7A2000 and
>       LS2K2000. Besides, there are also drivers about the external encoder,
>       HDMI audio driver and vbios support etc. This patch only provide DC
>       driver part, my teammate Li Yi believe that loongson will be more
>       suitable for loongson graphics than lsdc in the long run.
>
>       loongson.ko = LSDC + LoongGPU + encoders driver + vbios/DT ...
>
>    v6 -> v7:
>    1) Add prime support, self-sharing is works. sharing buffer with etnaviv
>       is also tested, and its works with limitation.
>    2) Implement buffer objects tracking with list_head.
>    3) S3(sleep to RAM) is tested on ls3a5000+ls7a2000 evb and it works.
>    4) Rewrite lsdc_bo_move, since ttm core stop allocating resources
>       during BO creation. Patch V1 ~ V6 of this series no longer works
>       on latest kernel. Thus, we send V7.
>
> Signed-off-by: Li Yi <liyi@loongson.cn>
> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
> Signed-off-by: Sui Jingfeng <15330273260@189.cn>

[SNIP]

> +u64 lsdc_bo_gpu_offset(struct ttm_buffer_object *tbo)
> +{
> +	struct drm_device *ddev = tbo->base.dev;
> +	struct ttm_resource *resource = tbo->resource;
> +
> +	if (drm_WARN_ON(ddev, !tbo->pin_count))
> +		return -ENODEV;

Returning -ENODEV when the function return value is unsigned doesn't 
make much sense. I would also use 0 here.

Apart from that I briefly skimmed over the prime and TTM handling and 
couldn't find anything obviously wrong.

I obviously can't review the hw specific stuff, but over all looks 
pretty good to me.

Regards,
Christian.
