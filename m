Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B9569A88E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 10:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6945A10E807;
	Fri, 17 Feb 2023 09:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2046.outbound.protection.outlook.com [40.107.96.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BE510EF3B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 09:47:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mqni6B98cvZqyC2xas9AgQiu6HdO/b5c8bkqThE9zE6CCKggTcwc39tlY97GTGnQ82fj9k5HNULpi8ugC+n0mWtH7Hv+ruBZOqxH1Jeb9HUmtwmVW2P4ViXbQdrzT880xBWSdqOC/0DPwqATYCH34e9ShntOYYcQfvK/VOCtkqquNQ0aqmQYnZocPWxtw2uw0KSOie7hozNG365Owz447iUia9CPB+sCeQQy5ZEfQoxCAWULBaOX+/pfIFKpBwUdYbO5tpmKPF64jAa4aDC4hBZPqBh7htLoLlwJ+msJ/oe9BlfgHDx2yfS2Jy2ldmbPlp9IXgJTXzu/AWMFYW7B6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jrn/0EE9gd0AWa3R1I6j2qJ9knmQ8RF9AE1bCIwlTPg=;
 b=a3woX/Zqh4DfZRW2A47QKAxI9ZT/sYe2jSMfjAR4Z/uVDOuhwUW3qbExFxilCVLNEzhk8EoihjDsJAQ1up9wux0E0Ikoglxeuti1zt4spitxfVWr2o0B5qdFtq4CNQZMzjjUxNif1nsQfgb1RvQLMx525SHKBYdCqZbd1wAJyfQPRZFDydpY9zalZ8OrDpA7N7a1RgxdhriD7A97xKWDG4Uqr0Oc9lGdGBb6KXC/RRMY9ou+C0wj5UNOM6k5l/NYBOB9J2JlWBy/9jK6I5CK6OQdVaedHxMAwZ25OB8rGqu7PJzHZj+Yi8c14AD1VvTvAPqFKNeZtDm2xgCXDggXUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jrn/0EE9gd0AWa3R1I6j2qJ9knmQ8RF9AE1bCIwlTPg=;
 b=JRZxlOAKMsFScloqaD8Ty2DK/TqPiPU987XkniwNNWPWkfwfe2X1wzImSen1r0LT6q4d2ivma8wJbxt6ZJAeipIPVSw1JazMwHgqDIgidLfHREgFNCh1Ge5PbO912XwZt3tA7lCspbE474GR/XuEFzBCsa7ggRaCXb8mRSDfo4Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB7956.namprd12.prod.outlook.com (2603:10b6:806:328::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Fri, 17 Feb
 2023 09:47:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 09:47:25 +0000
Message-ID: <9efa30b4-5a6d-91b3-617c-853f0ac0b22e@amd.com>
Date: Fri, 17 Feb 2023 10:47:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dma-buf: make kobj_type structure constant
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20230217-kobj_type-dma-buf-v1-1-b84a3616522c@weissschuh.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230217-kobj_type-dma-buf-v1-1-b84a3616522c@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: a91e2dea-3241-45f1-e361-08db10cbf97d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2WsyeKPUNWJ/Hr+DZ3HeS1yMhdT9eQmgRpms/2aJ4/DuV0fN8wSKzWOFyNbUHH7jddugFEwgU21DOfGEZyZU6XFUCLtrVTX/OmDsnqw08wIGOx+nUwWUP4+4fTH0aCDK0g5AXNTbb+jrIFtmr9J8+FXTIh3Q9vzVgeRHuQL3sCiDHqymXts9m3YDPw284vVFVqo0qFeU0Hs7zGftJVSdnwmo6Yejk/hvf/F/05GIIe6m1s77aWKvvsMsiSF1UVwra/aJCUstE13py6L805p/O+JPRNemiIGJXT8GgcEGpVh+DdFKK06sa3hiE8SyiTWRg6xBxn7aecDdnePAo5KKZGeGqUAQC7E5J3jTSOZWEo/nfhzLaRuc55keHMU3lvwHxJnDcoggH8iIno7m1XH7UktdbqZC+crsmMe9vCgETQaGzUC/oQnyep1Fi9NUVDwoUNTIJ5ECFLlWxoQdiZszuL7edVdljO41a7PW38Vo+LD+So2WjIUEegJMau7h5+xelRJj5q6QcxIIfbnvdvNVdJ8iSBmAeBzFSfAncuGkzAfgbfvScUKfB1RzE1L+fitcAFJzy9gtO34XLsDZOd0knnetS+a9ntcngfcvC2Lg7lXuguHazW+OV7LOysPB/zG5zaJR/2Sj7n5wdgJz6juebSVtxUSMq44t15BrMH1SVOkzqRjMfVTkRTm3wOxf0+BbHu7pfyXyzCHd8h/bpVpzbC6ET5w1RMTB9jY/IgBRQeQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199018)(2906002)(6666004)(8936002)(31686004)(41300700001)(66556008)(4326008)(66476007)(66946007)(8676002)(316002)(110136005)(5660300002)(6512007)(6486002)(478600001)(36756003)(6506007)(186003)(38100700002)(66574015)(83380400001)(86362001)(31696002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?My9MV3R1aWlOMi9hTlpRYU1iWVE3U0pKN2dMNTlzZ1VlZmFyY3o0Zk9TV1g2?=
 =?utf-8?B?K3QveU5CMXNCRElYNmQyVkJCYVI1K1hpTUhpWnNtL3JYb2J3TDRROGZqTUox?=
 =?utf-8?B?NHkvVFJiUk1oZGJ4cFk1ODhNZ2o0UFB0NHZucTBCNU9EOC84ZGRueEtaN3J3?=
 =?utf-8?B?cHF5R0pUa0tlbjdWMTFXMkpyRlo2dml6RnVHam9TRUliTlBxNStKQUlmSWVo?=
 =?utf-8?B?ejhkM09DVGprNnBqNHBZK1p4eHQyYWVPZjZGZ0JldlJodVZoSjc5Y2VicFpC?=
 =?utf-8?B?N0x0NkVCRDg3NVIvRTduQlBkWG5MZURrTmRQa0xuS0FIcmU0Z0xEOEZ5Wlo1?=
 =?utf-8?B?ckVXS1M5cHRIZnZSL0ZmWVl2UDk2TVpwL2FyclBUb0RPQk51RkQwd3Z1TGR1?=
 =?utf-8?B?OUtjUUJ3bjBZbjNGSmd6a2srWjRhV2hEbmNUaHhuVzhnS0FkMGdPMkRSSkNM?=
 =?utf-8?B?bUtBTGI0ZEJNa0JEMGRCdUorVGlTQ0o5dFVGbGtCazQrcWtUckhsdDVWeXpN?=
 =?utf-8?B?ZFhqWElaQzVpcEVwMEZpS2ZsTGV4TlIxeHliL0liK3dtYmRHUG02YXd6dXRk?=
 =?utf-8?B?SUJSN1hZWnkxR1RML2ErdFlyNkU5bDJTcTU5OXV2L09EKytHWUwrd2tyQ25E?=
 =?utf-8?B?YmQ0OEJuSHpoRXczc3g0b292V0gzS0wyd25tMm91MklRMnhTeGtqMTZYMk03?=
 =?utf-8?B?V1VybVYrbzBUMGlzcUxUQ0VWajh3MGthK0xjbzB1czlWbjFMMnMrMUJjOU9I?=
 =?utf-8?B?a3VMbHh4OGZTUDgrdDFtTmFIdC9xVUs1aDEyaWh6dTAvWGRoZkVJM0hVUFhM?=
 =?utf-8?B?OUFraXY1cUxuZi9MWUNRVk00NzFYdHQ2MmQwU3NOTFVkY0RGSHQwUU5MZGJy?=
 =?utf-8?B?SkluRDl2R1hsRkxXbml5dU10K0dSQmtyaWJHQy9qa0Jya05PNWdkQ21GRXY5?=
 =?utf-8?B?Y2o1YS9QR2Z4bHVpemFtc0tGandNRndaMXdEQzNyenhYczFQNXgyTGxvWVhK?=
 =?utf-8?B?aDFDY2hxLzZrc0l5VnNYV1FIb0tWeFNUci9MQTM1MXkzWHFlVjI4QkdvVWdE?=
 =?utf-8?B?M0VhMHNQWlp0dDR3VCtOYkhHODh3em1MODRFNXFoY1NJQnVDWU0yaWpWeGFH?=
 =?utf-8?B?WmhoYWdFdkpmdjBWZy82dGFvdGNOMGhsSTNSQkcvWmFwU0xIT1RvZ3VuYXhE?=
 =?utf-8?B?bzljL3FHTHY0VlFSVERNMVFzbmpzNkFlR3FoVUpYcHllUVVNakwyZ1ZURFFq?=
 =?utf-8?B?RmNneU9uZzJ4Sm9WNXI5eUlWSVFJbXo4aGNEZTM2bTBrc1JqSHpGR05vRjVq?=
 =?utf-8?B?Wlg0eHpkSWJuWjRUNW9CU3ZlOWJLK25pcG4zdGRZS2laUWNsRHpCazNWdG5l?=
 =?utf-8?B?KzFsdVFhMmd6OGovSm1hUnJyYlhZSG9TYU55MWRWNm15RzJiT3BlVE1ydnZu?=
 =?utf-8?B?V3lYcktHbjV4ZDF3ampET2ZuUm10ZTE1c2VxdC9UOHREclhPRFhJQ3Y3bTVa?=
 =?utf-8?B?QTVPZlBBYit2Szlhc2tpOGpSNFluV1YwUEFab2VVaFZlV1Fpa2hvSGFoS1pY?=
 =?utf-8?B?RzFML3dnaVJvVXFjV0s2bVA5TVc4aXU0VkoycWdka1BYWEdCdlBmaU4zOEhM?=
 =?utf-8?B?T0RCYU16K3I5TWRrQ0JWQlUxZWJ0UnlKbkd1UHBwQlN3d2FRbTNaRndCWGNm?=
 =?utf-8?B?ZUFqRVc0TzQrNkZDcmUzK1VhaTNOU1B1ZFQxSWZKV0ZockwrdEN5K2NlaHlJ?=
 =?utf-8?B?dHhLanVvaHdOSEdGV3FaMERxcVNDb2ZMNi9YTEpPR25xcExvc05SaVZxN2NS?=
 =?utf-8?B?Y0lhenZwU0liWE1DUGl5cEFhSmNmMVE5OHEyVFRubnFxUVlKRDQ4YitGTVpp?=
 =?utf-8?B?ZVRpRjFBNGhZYTBXV3RyaHl5NGpkWGRYWE5POG5SY1VxTThmaElKUDkrV3U5?=
 =?utf-8?B?RCswbkNNTjllcHdrcTJYblFzekY2MHU5SitJTVdydTdEcXhXZWJHZFJZbDQ3?=
 =?utf-8?B?M0tiMXFucjNqOE4rNlo0YnQ3d2hwb0xWUmhJVDlVOERCUVRiY29Wdml2anFM?=
 =?utf-8?B?M2pLZG1MYzNhdDFYL2lZa2hnM2Y0RUFGVWxMK0J4UXV6L0pXcVBVbkNMbjJx?=
 =?utf-8?B?bnlVVFg4UUhLcXBpWnlZS25MSkFBMUlvL1A4aUkxNXB6Ui8vVzdyS3NKSisr?=
 =?utf-8?Q?tYcki4r2bbt+qgP39Y/qvB9uvujY80Uygfw8UihmHF9m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a91e2dea-3241-45f1-e361-08db10cbf97d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 09:47:25.5583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BgEiSPYFuZkpqQ5n1eLFRCL6WzPcbBW7nkoKlPIU3Dbh9BaLF28zcPEe2cvwMFIK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7956
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.02.23 um 04:13 schrieb Thomas Weißschuh:
> Since commit ee6d3dd4ed48 ("driver core: make kobj_type constant.")
> the driver core allows the usage of const struct kobj_type.
>
> Take advantage of this to constify the structure definition to prevent
> modification at runtime.
>
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Reviewed-by: Christian König <christian.koenig@amd.com>

I will pick this up for upstreaming through drm-misc-next.

Thanks,
Christian.

> ---
>   drivers/dma-buf/dma-buf-sysfs-stats.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
> index fbf725fae7c1..6cfbbf0720bd 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> @@ -112,7 +112,7 @@ static void dma_buf_sysfs_release(struct kobject *kobj)
>   	kfree(sysfs_entry);
>   }
>   
> -static struct kobj_type dma_buf_ktype = {
> +static const struct kobj_type dma_buf_ktype = {
>   	.sysfs_ops = &dma_buf_stats_sysfs_ops,
>   	.release = dma_buf_sysfs_release,
>   	.default_groups = dma_buf_stats_default_groups,
>
> ---
> base-commit: 3ac88fa4605ec98e545fb3ad0154f575fda2de5f
> change-id: 20230217-kobj_type-dma-buf-a2ea6a8a1de3
>
> Best regards,

