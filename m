Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3CE78268D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 11:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0731E10E21E;
	Mon, 21 Aug 2023 09:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F259610E21F;
 Mon, 21 Aug 2023 09:50:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmZ/sW56kdUra0K9LmJQMdw5qhN6JgXeigqMQf0J7hYzopMunqPWKPuzXc4Yuch/nGfnn15ygU3NlLLwnhLuc+j7BtULuzaqSBN55D1WaXtGbp619L6xHOIP4v2kZuG3Gr5TbUskWG8ih8SwK/aOBKLVZoNyQins2FAX4M82mskyzBB1GX+O/m78f7aEcCsPrGlNLZ4gvGgKAB0cwGyfjMnoPBuHLmRe//iaB9PPwUPOg6+5xG89boOda6dAOs0f6bQ9X5NII+wJLKmDACXxtRXls4pJE0sJcGDJYfcWqBtwurbZuCizuoA/ycYGXSRBA1ZOwc4TJUtvHT1hHK2toQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtIp+Q0KJ8NwWHkyttWfsLR4YGRYuR9FMvBcNTC5kgs=;
 b=jsvOIFi6NJC7/x68MLPyf8F0j8giko4XfsA7GayPjAzwvOxitvzNKQ3cLDqY8QrjoWg9/lOYpcavB+sIg1xtnr8wVjJOwIR1GG9p5oTuswyHZn/QhwqZm5LjdJNq2r66Z/JmTQiLldqqK38aFR5d1wHG6AIBfBQyA3GfQm5RxC5cFwUXjnrktqM66ONsiCjBCq2Ltqwo9X0lUgSNVFTO+PnUqQNfYquDIIxLORKOtfekSsAswAQ+8u5OI2380ufqZVLnCk1yemZjHH0vlZBnkBCoEPGmBwdDs0WxwwUj9Vd/Mzz3EyOGXnlM7QUm7T4PdyK1uKXGFAT3GtqmCe8yJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtIp+Q0KJ8NwWHkyttWfsLR4YGRYuR9FMvBcNTC5kgs=;
 b=S4YevzBEOWm/sZei76jKszIA8pIDGzPNKFxeaqILlF04zGudVnuwNXiWnbdZldBgB3daVyMM9qDwtZpykktGPF5bpR/Pi2MSvX3S8Fn9NpZJeJjdgwMKSHiTp1EwtYt8ViDbaeFqifRLzijhKtKERrfaL+jzPbk686kCh5W/VQc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB6638.namprd12.prod.outlook.com (2603:10b6:8:b5::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.24; Mon, 21 Aug 2023 09:50:02 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 09:50:02 +0000
Message-ID: <3462dfaa-96a4-61fd-b31b-fb8d8eb6104c@amd.com>
Date: Mon, 21 Aug 2023 11:49:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next 1/3] drm: drm_exec: build always builtin
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, faith.ekstrand@collabora.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com
References: <20230820215320.4187-1-dakr@redhat.com>
 <20230820215320.4187-2-dakr@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230820215320.4187-2-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: 9edd55bb-b5f2-45e1-af69-08dba22bfd2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 50FH/3YoybkItKZreTFnGSmYoHBphx1fDMLRL+45pvKe1RgmT7Lkb1DQ1z6cHtV9OCM3DY1qc63SeeFLTatrUu2DyUEp/PJ5YbU0Aw6gRQd2UrUAVGv1r8y0+dGWVqjhpZzYRqsZHrw+t/H1MhvFx8C5hZtG8LmAPBz8q93PX4ipth3We4ZDTOLt3Kb83u8SClKoIkpGnjM5EYPdwnn+3lNnFvOZsBpsZ80PktM9w8Kv4fU506UdPb9dxIJphHbg+61gtKC4Ymzl8eL6PcjJJ5L0B8NfZqqehPFhfPp80Iv3uT1l5cLDlB/PIGqt8al8EIEEJFHrsFICfhG6+zdEFlKeGiU1r8OV8aaCtdaYLUi+IXBouBz6cT1GGxO9kY6R9OCWOxDUmSmODXVf17ir4eui26zJo0ZJ8WpmFCMskXfu5LuTsSd56F2MI7SYB1BRcggUEga0e9t8FeKHAuu9kzutWE0nZF22y0NGZgkD0t8H+igxLUIXvda+OX8k1DU+eiSugUN13h7ncwaPrqILf8H/BWiD+sYhAIvlpA4fB+7MDo42L+tdL5lI6RXpu5qEPNfTleq4RFgP10ibdBqJNudxtq1ndyFjUiKNSockl7jZ8m0BF32V6WjHuRaqjTR82o+HoYgzeQkYuCTwwe/et7ptutIBSHGL+xkwgO7R80Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(346002)(366004)(376002)(186009)(1800799009)(451199024)(66476007)(66556008)(6512007)(316002)(66946007)(8676002)(2616005)(8936002)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(38100700002)(6506007)(6486002)(83380400001)(2906002)(7416002)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TThaV0ZYYlZUd2V4ZTZzbGlzOWd2cy95Nkx6dkV4U2pXZUFoYjBpcWVjZlRZ?=
 =?utf-8?B?Yk9XR2d4SU5oTFd5WVZ4aVE4VXo2b1ExRURWeXYwRG55ZGEyaytSNTVmSG1q?=
 =?utf-8?B?ZUo3dlo4QmxESTFmTWYxRzB0UzdrL1BnTlg5ZDM1NnpvaTNITjh6TXhTRjl3?=
 =?utf-8?B?N0RDZk9INkJpNUJHTmEweTlOQjlNbzRxRUJoalFZakpZMGN3WXo2MFNXUG4z?=
 =?utf-8?B?amJ2UEJlVENSQkluSE43eEF6RWErbXVCNWpBZEVmZkhIVWt4WTBvOGVSd2FI?=
 =?utf-8?B?SGVEZW5ubzNSNXl5dTFnSWNkOGx6Nlg5dWlERmJNUkxGQ1NTWURqc1IrcW11?=
 =?utf-8?B?aUgvMVZuejRXY1BtODVpWDJtQ3FOQmZYbktOb1pzM1ZCMDBVbHk1cVRsVm5C?=
 =?utf-8?B?dEk2UW1vNzFoM1NJTmN6V3VtOUUraEZCTmY3bi9TZW16MFV2Zk5SODZCcTd5?=
 =?utf-8?B?RXlxa2pVelV0YzlvVFhOdG9zK2lOcm1EeVA1YmJ2bUxBTU01VmJOalU1ZERN?=
 =?utf-8?B?TUROWmwwUkNZbEVhT1BxZkJGVUk5a25YaEdCK01WMEtlSVpaNDQ5WEFKb3Fh?=
 =?utf-8?B?eXlmQkJ6dFRsbFhJR2tDODBBVkVrTDVBK2YyZ3ZDVVZxWFZHY0ljVThOMVVC?=
 =?utf-8?B?VGdFVEcxLzRJSm9BLzMxY1ZOL2dIVG1JbUpGeFpHK1NrN0xrR1U2VWtMR2J2?=
 =?utf-8?B?U2VHckczcG1kV3Q0Qjllb3V1eUJ4UUhjT3IrSUlUYlZPZ0xlZjJ0ZXRRdDhL?=
 =?utf-8?B?TElPYldWRU0wcnlwbXdrMDBGK3RLMDcvOHhRTDhMSWUzQWRTYjVFRUFLaVNI?=
 =?utf-8?B?RmY0TTM0NzNseWdSY0hVcEhZdVBnb3ZORTBPMFpHOE01WnQ2NWV0dEsyTmNJ?=
 =?utf-8?B?K0t4bWRINERlTHM3TTVmRlR1cnkxSFVhUDZFN2ZoQ01lNldmUlRob3dZUy9s?=
 =?utf-8?B?T3pjc01SR1RzelRMUGNhQjhUYkhQMVBlR3ljSytLNVN5WGtJZG12U0g3SzUr?=
 =?utf-8?B?ajZybzg1aEZJM1BQWER3L1pTMHE0RWEwWmh4N3VmMUhJWXRWd1RJRUR5OG9U?=
 =?utf-8?B?VHBUOFJ5OGtvWW1LNFhGOTJnYnR5TEFaeFgxQ2Z6dXdiRGdLeVlRMFBGMFdx?=
 =?utf-8?B?cDAwNDZpOHZTWnU3U0tuSGxPMHhncTFoRzI2ek9iTDM2M1ZnbE1WdEk2WmpU?=
 =?utf-8?B?c2JFdXFqVGxVektwZTArOWVXa3pmS0V1MExrQlhiMUxhM09EcCtTRThDYkZL?=
 =?utf-8?B?bEhxeGpsUkNiSi9ReHFLdnZCM0l1cm4wNTFSczZFS3JhWk9MUFJqRFl1eHlH?=
 =?utf-8?B?Zlo5S0FDNEFrdVF5ZllBTnVUWE9Bc0Zad1dpaE1NbHpKeUwrWnJsSjhTYVpa?=
 =?utf-8?B?Z0hpVWltUTNOSDNGRVdvRVlDSEE2eXBFSncySWVJMUk2bnFtNWhXNmliSWUz?=
 =?utf-8?B?RFpCd3hHeTQ3YitHbEhHT0IrdkszV2daOGJYT1lMQnZGT2FwYmNOVkd2Y1BW?=
 =?utf-8?B?Nk81Q3VMemRjQzNvUTR5K1VCcTgxMlIxbHFUNjNzem9iNUhvZVkyMFU2N1Ru?=
 =?utf-8?B?dTQwS1YzUW85bVFqZWwzSllrZERzNjc5eUV1RG5xYmxkV2tRRXdDZVpuclVS?=
 =?utf-8?B?U3EzYkxYdUNvbVM1MkRZTEh1UjlXTzI3TzYrUDBSbCtMZ2ZJN3ZXMisraDlR?=
 =?utf-8?B?Q3BwR3dtUkhZQ1ZGMnJQeXdKalJXUjB6WkFSc0FqWURwZ09pQXVLbEg4MXJz?=
 =?utf-8?B?bFloWTN5Y3pacFRGK2hiZFhha1l3UzgvOEs3aXVUU2toZnRIK09LTlJ2V1px?=
 =?utf-8?B?TlI0RTR1YWtQaHJXeFdodmp3TEltNWI4VXd4eFZlbnBVdWJuczRLVUMrbVdl?=
 =?utf-8?B?Wkd4UUtJK08xSkUvVmVmQkV6QkFmbTYyVDlOSzcvOWdhRDBzQStvb0VtanM1?=
 =?utf-8?B?SGY0cnlxNkdSYzJPaUtPL2dXNitRUEs3aCtHZUwvc3FXeHF4SEwzYTNPYWoz?=
 =?utf-8?B?U3Y2RCtyaXVLL0wzdXNQckdjZk5vVEV4NnBGZ3E2UUcrdUMyWm80eXk0YjdM?=
 =?utf-8?B?YXFhVFJVYmJLRW9iRHVhd0wzdzN4UkNvRnM5VUF6aTA0dlc5dG92dHBNaVRS?=
 =?utf-8?Q?Kex/PYHfwJagi0Q982lV7Uvk6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9edd55bb-b5f2-45e1-af69-08dba22bfd2d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 09:50:02.0193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VqNuDfowTQH9eLQbkXDPVfldXvmtw7dgKO/mcbCycxOdXXSirL+ad7o5DQeJRlBP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6638
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.08.23 um 23:53 schrieb Danilo Krummrich:
> drm_exec must always be builtin for the DRM GPUVA manager to depend on
> it.

You should probably go the other way around and not always build in the 
GPUVA manager.

We have intentionally and with quite a bit of work moved the DRM_EXEC 
and DRM_BUDDY into separate modules.

Regards,
Christian.

>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>   drivers/gpu/drm/Kconfig         | 6 ------
>   drivers/gpu/drm/Makefile        | 3 +--
>   drivers/gpu/drm/nouveau/Kconfig | 1 -
>   3 files changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index ab9ef1c20349..85122d4bb1e7 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -210,12 +210,6 @@ config DRM_TTM_KUNIT_TEST
>   
>             If in doubt, say "N".
>   
> -config DRM_EXEC
> -	tristate
> -	depends on DRM
> -	help
> -	  Execution context for command submissions
> -
>   config DRM_BUDDY
>   	tristate
>   	depends on DRM
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 215e78e79125..388e0964a875 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -23,6 +23,7 @@ drm-y := \
>   	drm_dumb_buffers.o \
>   	drm_edid.o \
>   	drm_encoder.o \
> +	drm_exec.o \
>   	drm_file.o \
>   	drm_fourcc.o \
>   	drm_framebuffer.o \
> @@ -80,8 +81,6 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
>   # Memory-management helpers
>   #
>   #
> -obj-$(CONFIG_DRM_EXEC) += drm_exec.o
> -
>   obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
>   
>   drm_dma_helper-y := drm_gem_dma_helper.o
> diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
> index c52e8096cca4..2dddedac125b 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -10,7 +10,6 @@ config DRM_NOUVEAU
>   	select DRM_KMS_HELPER
>   	select DRM_TTM
>   	select DRM_TTM_HELPER
> -	select DRM_EXEC
>   	select DRM_SCHED
>   	select I2C
>   	select I2C_ALGOBIT

