Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33C33CF883
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 13:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E74189C69;
	Tue, 20 Jul 2021 11:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2067.outbound.protection.outlook.com [40.107.102.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127EB89C69
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 11:00:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrIim88j1tuepynqupZvAXB0P+0UpaDyWK6VoQG3W8GknjlcqPLRcMrr0iF66kNz89w2EhD2uLdi0XvwWLl5Um+Yw/ADn6TIcFE8TjYfgPOmZOEgOIgV5pZyQ8hPumUzM44k0Npb20swye9hrv921hVFeyZxDoYXbRykTwYBrjIco6YA552vn0b2b881BbahyTC+rWEL0186xSJCB6I8QRbOL5NoGXqY7un3uDLQQImqJ0+xC3NWDdUv9tYA8FdaNPLKFoOYYOrKGgg0GkXLVHlSLwxPY6f0WtmSODhI11aGAD1Q7ijBeUZXwSNtPXOl3zHYd195vf7xlsZxuofoIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvaE8AtmHGcKjsyBBUGafXkOuJRv4aBKMcqGzECqITY=;
 b=fx6rw7GifFdK5Q8sxkfF2WXrB4Jv31W45J+ag/gFWYXfTzvCxNaTmh571svXRnWNVk8Pz8wii/8OGYq2sieTF6A4W3Vo2zrV3UijxvLJEtLStYRIC/WIMN4umqA1dNcPIF8/iEk0uqLlr2TB36QyjYaCtXoSkRW3aljtx5vBFAap+45enDjLAmwDww2fMk8iIaFaFAMam7VYE7lqyWF9lwIJJsxkKR8qvuJmmdqEAm9iyicOPym0rUQVhmpdt8BEHCiO12UOMFV5V2xntnPIhBW16AhXUvEvCjLZv3cGRFh/4nUfxDukdWBg5kHb+jhwWIRtnQ4l3xR+20I0D97+Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvaE8AtmHGcKjsyBBUGafXkOuJRv4aBKMcqGzECqITY=;
 b=0gfxrXBh5PnYOaIB7d+MKhnK3LUcvPpoN6E6vCIGK9AG60iitW+gc/0hXWGssDueNkOAget9BsMpiXn6ruvSWdrSQDoAAJK6w2BHMlBIzXI0srys+XohSU8eF4zwT7vnX3JHKIGpsx8Fj2QmtOMfNLiyarNPeY2X/tuZnB/ks5E=
Authentication-Results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3902.namprd12.prod.outlook.com (2603:10b6:208:169::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Tue, 20 Jul
 2021 11:00:51 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:00:50 +0000
Subject: Re: [PATCH v2] dma_buf: remove dmabuf sysfs teardown before release
To: guangming.cao@mediatek.com
References: <8d7dfc78-aa85-48b5-2828-21ec6b463ac3@amd.com>
 <20210720103158.83439-1-guangming.cao@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a12fc0c7-ed60-0724-fa56-097cb9a694ee@amd.com>
Date: Tue, 20 Jul 2021 13:00:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210720103158.83439-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0238.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::34) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8651:5b5e:8648:2fd0]
 (2a02:908:1252:fb60:8651:5b5e:8648:2fd0) by
 PR0P264CA0238.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.23 via Frontend Transport; Tue, 20 Jul 2021 11:00:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3769e975-0835-47ec-af06-08d94b6da2a0
X-MS-TrafficTypeDiagnostic: MN2PR12MB3902:
X-Microsoft-Antispam-PRVS: <MN2PR12MB390202C74762B2AF6D2F8EBE83E29@MN2PR12MB3902.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MWS337TOR35i1gKd05DkAsSvzaE+7nsunCre3xgmLBHuka6WFh/4N+ac3ymqcY82I+qGWXCmoIz1b3/dcJjnpOXl7y2/a0InZnN03SoesbRom+dfkkG+PLInmbWEej3FGpsxwKKlAIHk/WdWLv2edLbMdgL9QcDgYVhRVaqX4rD3Rnq/w67h/HHfCtiU3AeLWCIJ5EOMMWIYtOnnd865acEEU0Ve0KGNntEiSHjLrG0ZzTlz/LgQ/3xKVJdCE9OfUXg4f5vcZ8C/rtLuxqbcnFLUM0o78R53AfK+TV36eHZKKPy1XoWzvvNL3JdT+5JKOvqQ2ngx9nKgMnD8+w4qRAS9XGDaprfo3QjOiV4HOumMrXmN9kb8Qq3XgletmX66zcJdyHwFDcnDBdkyGCKgBltMooBUjXjUsPc5Jeph8vB1V8r0LaXPwQu5vr87VM9pr2hGuL4DQljwySpRdWzG9f+VP8OYxs5lTDQ42vzvcEGXUqOXY3fb5xDvqh+hNX0oys7bxF5KsGK0guljqNh1FaG+XGfpiQ/eWdyoNfcebW9zTN3jh3Iiw0+aghcqsv9DXqNIfz0TAzs+xTHCjRreP8EECCpOGimDen7DGS8oFV9yALq3GcrBbd8ehXhdYoYxiwUrWoU/ZMhRXxcw0GMir7q2cKtqfIZEDLswwKn6lib88wmd/JKDFzRJKAK7lL4KDRnAhKdt7U5VAS9MV2bTALXxG5Mv9fNO6YbbWxqb87I6irMG2FtjLYFbgFwtl6nE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(6486002)(31696002)(36756003)(5660300002)(86362001)(508600001)(83380400001)(8936002)(2906002)(6916009)(6666004)(2616005)(66556008)(4326008)(66476007)(8676002)(66946007)(38100700002)(7416002)(186003)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnRmK254azhVaklWMHJKTkQzOUcwS2ErVXNuVlo3YkxkTzNGZmRsSGpTQjNR?=
 =?utf-8?B?UE1rZU1xa25nT2R6ak1aeGY5NGdvVFJ4eHExM25ENjFsenBsc2g3NW5UTVg4?=
 =?utf-8?B?djZTazhYRnozbm4yU3pIYmtKUnlTZHFOYkZKMTloU2p5YksvU3dvM0dZQXhn?=
 =?utf-8?B?dFROWTJXNFcvWFlyblB0SFFnZ2p2S2VtSUl4WDdmaFpHTlIyTXlOL3JIU0w0?=
 =?utf-8?B?dmRZWjA2RFByeW1EOURrNjNwbmVIWmhGVGlDYWtDcHpjWDl5WEVNdVAyYkt3?=
 =?utf-8?B?OUNnNGtPRTlBcHh1bEpqcThveGFtdnBCdzZXWWJ2Mk92bysxak9YNGQ0cFNk?=
 =?utf-8?B?N2p1ckdZaEUrTTB1MU5VWHRoMGFjcmMyK0RYTEY3Z0tPMVFGSE1yckY2bkJu?=
 =?utf-8?B?OFRWWmdtNFlVdWhrWDhWWGsvd0dFMUdQbW9IUmdqL3NBZnFIS0lWeWRyVTZq?=
 =?utf-8?B?WmN3cmVFVkhQOGlleXk0WXhjWGhYRUFaMEdwNjNOa1h4bDJWN0l2QUQrTGxz?=
 =?utf-8?B?clRRV3FnWUhvcmFHUUdvdUc4SklYSTNKQ3pPbitSOUpSN2gzQ1Rvbmw1dzBQ?=
 =?utf-8?B?ZkIrR0ZONjJiTmluWnRMUDVjbzdnc2orNGJDUEhaKzNJMExOTjd3ZVNjSHlZ?=
 =?utf-8?B?TTVEV01rMTNIK2VVYTdCOXhiR1grTVAyTmhISVhmMHZCMnlrSzQ5NVVPbWl6?=
 =?utf-8?B?bGlhQ2gxNmFxejJOWmttMUlLRDRuNXdmZ2w0SlBOaHhRMU9wM1gzcldKd3hF?=
 =?utf-8?B?aUhZTzBIQWk3di95WmllblNBa3czOHg1Tyt1Q1U0MDQzYTJkdWVUSUFzWGF6?=
 =?utf-8?B?S2F2QXN2NGd0dlpncTRMUVZaWlVLaHplMWttTzMxanFTVFZ0dzJSc2FlaVFH?=
 =?utf-8?B?cTBIQ1lYUnU4Rml0OFg0RVZrTlVwS1A2T09sRUIwSkpsN0R6V3VWOW0xbFJo?=
 =?utf-8?B?OVA4cUovMkpIZjF1ZDBkNEU1VUJLK2Z5ZlJtOFRlMmpWc2FCQWh2S21VYjNq?=
 =?utf-8?B?c3VYbmo1eHErWldmQm1TOGhKZGdXL2taV3k1RDdYblhFSGFXdWFrNU5lT2tO?=
 =?utf-8?B?eG0rSTUzKzVYc2dJc0JjQnBSUkZCNzBWMjJUVUY5dWtDdXQ5eGFwbDR5TVBX?=
 =?utf-8?B?OXRqSWNpTVI3U1Fjb1hZcEl0c3pjZ1M5dEpnTmxpNW15b1RET3FBRzdQM0U5?=
 =?utf-8?B?Y3FEUDhwUVFPbWR6RnBpNktIdFdrOTA4Tit3RUJVSE02WnJHSlZFdUlBRkcx?=
 =?utf-8?B?VVl6bXh3YW95QWtkM21SZm5wWFRhYVA4M1RtMVhxTnpsc25vYTVDRW5FQ3BR?=
 =?utf-8?B?UU50ZjRSV3kzYzJuYzF0bDZ6UXhLa01HR3RqQ1MvZjJZZmZ2ZzQ0TEs3MENR?=
 =?utf-8?B?ZUdEaXdQNWxpTUdGYXlTaWN0WDFmKzh1S2ZvY251MjVPOEg1Qkh1Yi9DYjBW?=
 =?utf-8?B?bjQ3L2xaZ1AzTU85NjFMT0E2R2E5QzZwM2RKeHFML2lQVVY0Wll3Z0ZXc0xx?=
 =?utf-8?B?RzZraGhwelpoa0F4UXNYc2N6VzlTTkpNN2hvYyszVW1QY3FHbVA1WG5ubFRB?=
 =?utf-8?B?THZUVTB1NG9GLzB0SU1sZm0rYU9XdVZkQllVeUhCOU1iUXYwYkNpdUVLNXR1?=
 =?utf-8?B?bU1yQTZCVVFSeEpZYnpjZk5VMmlnVmpEcjFXTkVyKzQzVjhJVVBXTTk3V1RI?=
 =?utf-8?B?U1hXeDNXRmxPZGxuVEgyQ0VDT29NOXpSYlNCTDM5WGd2Y0dnK1V3NWlnYjF2?=
 =?utf-8?B?ZVIrbnRBUUtQVGtIOG1HQ3ArQTdMYWZnSnZiTHB2ZUJtUGc5anQ3ek1mNWJI?=
 =?utf-8?B?QUNuUjFoeW92dE5Nb3p2QlRoWDdOZ3FQWE5oaDQxaGZzZ3doVEJxYWNvd1Fu?=
 =?utf-8?Q?gmGJnlbc3bSry?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3769e975-0835-47ec-af06-08d94b6da2a0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 11:00:50.8749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1T3tPMMO0eankp8XxZQOepBzbmmKhlVGdxrVHa3JV+WclUpGlEGz4f53ZPyJqHJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3902
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.07.21 um 12:31 schrieb guangming.cao@mediatek.com:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
>
> Dmabuf sysfs stat is used for dmabuf info track.
> But these file maybe still in use after buffer released,
> should clear it before buffer release.
>
> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>

Reviewed and pushed to drm-misc-next.

Thanks,
Christian.

> ---
>   drivers/dma-buf/dma-buf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index b1a6db71c656..63d32261b63f 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -76,12 +76,12 @@ static void dma_buf_release(struct dentry *dentry)
>   	 */
>   	BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
>   
> +	dma_buf_stats_teardown(dmabuf);
>   	dmabuf->ops->release(dmabuf);
>   
>   	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
>   		dma_resv_fini(dmabuf->resv);
>   
> -	dma_buf_stats_teardown(dmabuf);
>   	module_put(dmabuf->owner);
>   	kfree(dmabuf->name);
>   	kfree(dmabuf);

