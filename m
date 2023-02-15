Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB3369876A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 22:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFFD10E2AC;
	Wed, 15 Feb 2023 21:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060.outbound.protection.outlook.com [40.107.102.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BC810E2AC;
 Wed, 15 Feb 2023 21:34:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQOd+2S2faj4hca5yPAsDSDeymVJMHrKkNzCATrHaH5Kxwj5fm7AmXtXKtvvSHmQvWFd3aI5PQOeXQdpWeLMni6hVB6FZ7AzpRgluj7kn/3e5XJTc/le/lzSi1uQvAexUGeH2LGzn4t4ZuFBl5rGUSXRhQX70AuKZO8uI1WkPgoLIaRKKfVPPW5He/J3+08WAksxDViqSLGLhYyAqM2PIztXB2HDIc+lJlhN2UveRejUoP8asE+X1Y6yOPPS6tKKNegJGYI20aVQNeRtOQjsTTe62itRijVwwpYfI2VuGRsDtlfywkxya6wGucq8KkrrWmVVb/Si9AKMxXTFEUmykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0DJx+oKrYFmZYTMQiY43ffEUZIFaSoj/e/nfesL16Y=;
 b=ICUrZifCd+oo+2+rIX0+vGMOr2ASwRn5KbtYYJQ0oh0yAmyOwxWLFOBqvmlTqZuqyw68dTU7B8f4vUHC3z2mqEwQPNcE7HrcJxeENClMcbB98W5mFQ4rf7d0ys5xRrTXDB8oruNaxW5qBk/2HljD+vlZvSf+I/b75jadUcg+tb5Ymc6sa4SwcUFiKBiI29u4cs+uLxMmKqSaneBCOi91klEWWu5znol/0GpPT+j+Wfy9XV/3b8IR4ATS+dr0B3WhfgzWpL+GpOe2zKaYm2I1x0CdhHCo8l75RvvMSCkmwFphkht54WBOfRFDbVJyHQw2WXAMgU1PTb+8kZZfu8rvrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0DJx+oKrYFmZYTMQiY43ffEUZIFaSoj/e/nfesL16Y=;
 b=v0YVzgcVEFo1B9RsCDqPeU8cn+VvoL5ygt9XdPGrz6nu/v0aGcLwy39VRRntucC5z5OJ31GuZn58WW51o7RvPxL/GrxTbWSJb85kAPgeteQhn85RE6t4zaqeeVthqV4icX/1a02rX/3iFEkhRNPpHojFT4SSgzxi01VKxJC7zYw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH2PR12MB4119.namprd12.prod.outlook.com (2603:10b6:610:aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 21:34:57 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%9]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 21:34:57 +0000
Message-ID: <a0934601-3a7c-dcb5-8d23-81a3cdfc2c4d@amd.com>
Date: Wed, 15 Feb 2023 16:34:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] drm/amd/display: only warn once in
 dce110_edp_wait_for_hpd_ready()
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230214211254.233468-1-hamza.mahfooz@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230214211254.233468-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0115.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::15) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH2PR12MB4119:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f602e9-758f-44fd-073e-08db0f9c7bac
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fWcb3VU2r9yCIPjbMUHzO/CzvNrwbGSC4I1XqghTJs8M3CzSiCvJJF5jP7cNeDUmLDOFBkyQFyyBnHRQSbfHE5LuN5WLguo6AGqrywZf0HPMATsKntYAChWn5BwKunh7VZ7mZJPdVwS/2ublMdVHO9z5oZtY16jTMoVpp1Cemo3fVBEiDiSiAcpq3p2JIn7SAUXS6tt62yleEKX9AzznTYkIfAYq164k+0GDNk3Cirl3fDO4YV+9a5S2uH/yr/73c2JjFmeHsg44Vy801ZWTNm94p1oIa+YA4eq8XXO2hleSilf4No8CynVtNCD/2zgyEXbdZNVnv8pAAKoXmgDNR84fQhByXmeO7td02L16QMWB08Kqy5L88Fv9F26qy6zkKde0OhpiQbwGMWFy7alS9PA7sr/q55oZKw/eUc1avtqroiU2CESaladcJA5pHwWLuNL9Ep83LYRICwQDtwGRzi0DgJseMQhHSSik2zio5qOuY5E+N/AFCYcLabizjwWpexaYihP4sx3O6tWFV6pg7CRTRm1jL2EXJ9xk1wBZPZ0lP7ssCd1BGoioHyBII0bGBExw2W6iE27xdXh5de1K7JVpU50VG0SzKadQ8/43UJ2Y2yGgkBY9eC5ShJdSeTfrBDrMvZuBSxI2vQOx0sWbrMAXzCyqmBpXu7t/WXNtitIWSt0J2p4I+nAGxeNQPXmR2jPxY1eHjm2VKwJ99vjQFGfTltdidWMefnP5R/mEFak=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199018)(8676002)(316002)(66476007)(66556008)(8936002)(66946007)(4326008)(54906003)(5660300002)(44832011)(2906002)(31686004)(41300700001)(6486002)(478600001)(186003)(6506007)(6512007)(53546011)(2616005)(26005)(36756003)(6666004)(83380400001)(38100700002)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUFMdGlRdTBqeUdMMVVseUF5WVYzdWsyVGpPN1pQOHRNd0s3ZHlYZzVNZjg4?=
 =?utf-8?B?TlVOZElZdll4bHlZdzR0cUl3aVZZdlJsWC9ENzJFZVNoSmF2WnhjTi9BTExp?=
 =?utf-8?B?VGcybzBzWmJodjdtT1Mwd2JRZEluZXAzMm9XeXNlbXRmYjJDalJHaWhvOERG?=
 =?utf-8?B?Nm9LWlNHODZOcWJOaG9OVkVJb2Vub3YwNW9LaHY1QTYwbzJqT2xYRXczS0VP?=
 =?utf-8?B?L0RnMzhJVENRK1VOYVhXSTAzNDNoNVZ6bHpCN0w2Ty91SWdYeitOOTlKcmxD?=
 =?utf-8?B?ajJ6QkZFa2wrbkVla2FYbTBRbzBPdXYxQUJ2OWt3M0FvV2pXOGVUQUlxdFQr?=
 =?utf-8?B?Wm41YktldFF6MVI4bG42aWdMUWpDYXcwUjBTY1RKTytiNGd5QStXclBsVHNU?=
 =?utf-8?B?eWtkZ210amIrbi9KdmM1WmFaejNLK2RtM2FzNVRNNS9TeXM4TDVpUlRGVTJt?=
 =?utf-8?B?ZFVHWW5QenJnUEYydUVLeWxXcFhqTEMyQTIyMHFsMVF0N25La1BEdCswck5L?=
 =?utf-8?B?RVRtQ0h4M0tXY0ROOXh6Q05OVjBzbGRlVkZHUno2RlB0bzhvajFZWnFtOXpm?=
 =?utf-8?B?ZjA2OFNKS2ZhTFQzMUlsWXo1VFFibDhYVkhxdDBzOGR6SFU0YmJWL2l3WlZv?=
 =?utf-8?B?b3NDZXVrSUh6S1VEK1h3SVVzdzhoOE42NFg0NUk2M2lrQXpqZGdSS3VWamVa?=
 =?utf-8?B?YnltRFJYZDhCNnhLODBGeGVDOGwrU0RuNEh3cDh1T3A0MndxYzE5cHc5eXZS?=
 =?utf-8?B?bVRzcTBKUmxLQXJGelJ4ckVZUHRyL0tXeHRBMVh1c2xzRU9xeWp1MUNzTldk?=
 =?utf-8?B?UDRicm1XWlBPWm05ZHliaHgrU2JDM2c1MzlIUE83QlQvQ3hUYVhrbzhNQzFz?=
 =?utf-8?B?RDltczRwS3REbkJzZzJURHVvcnQ1M3F3QW5IMlQ1YWV3YkVCRlluRW9YWFJE?=
 =?utf-8?B?QmdnZWhKaW96b2U5bzJDWjNpZnlLQTlueUN4WGhnUEd5dU4vMk9PS0tCVU96?=
 =?utf-8?B?RjhLNyswa1RHV2FETWl1elRRWnZVUjN2SGxSVG5RZ3BRSGg2VG05WTJYcWJ2?=
 =?utf-8?B?NSsvSU9HSnFDZWtFTTJwZHoxRGc2L3k0QVViRlBCNmkrajBqTldzZVI3WVRJ?=
 =?utf-8?B?VHRhQVF0ckpQbHMwZGZHdzA3NzNMT0RyVkV0NVMvKytNdGQzUVNwTEhBZFdK?=
 =?utf-8?B?Rk5Ed2hZZStCbVdTSU9vNGltOWNUSGwrVlVsMDQ1RVlCanAyR1JEZ3dnYmY0?=
 =?utf-8?B?akJpejVSZk1zMC94bnI1VTdIdnB3dFhSMjR3RXNxc2RkakVCbldPSUZjR1d4?=
 =?utf-8?B?ZFZnQ1dwRk5oUnRrM2lTQnE1dElleXV4N29sTjRkRS9BaFdFT0VBbnIwaTFr?=
 =?utf-8?B?S2djWWVhNXRkeExQTUFXUUM0SkZKaVlMOFlvcGlWcE96RHFlUDYzL2hlZHRs?=
 =?utf-8?B?OXExcThMd25IenQyRkJYL0dIeW1oQThDdXhXSlMvN1cyN01QbXI0ZVdTaXh6?=
 =?utf-8?B?QUlodk9pbmVTTVRXdjY3b1JWaHlrRWFod25ETGxtL0xsTUswQjhoZStiZk9z?=
 =?utf-8?B?U0E1dkNGVDhDU0pWT3czbllUMTgxc2V0YzZhYWVYT3FqUzdvQ255c2FTWHIy?=
 =?utf-8?B?YnhHdnZ0TGhxZlRrK2hiZ1pJRUljaGtGbG4zUUIybm1oR09jVGlENlpYSTFH?=
 =?utf-8?B?ZkpEa2VUZVlrRmxaMGhMMzVQOHhvNjB3NnRQSFhSaXhQYmlVWXRKV25XVmsx?=
 =?utf-8?B?T3VLaXlCVWEyTXc1OHFJUkFjVlF5MlR5VU1tUDQwL3U4RVo2VUFqWGJ1VkxH?=
 =?utf-8?B?Tnhlb3dmSjhFblZ5S0FqY2JYNkZ1SW9GcTM2NzQxMHBGRlZQSW5XMEoxOEE5?=
 =?utf-8?B?R2FhL3JhTG5IcEJ0NTdTbTZjZDdqbTdKWmwrOXNKeEhkay95N2VaajZ4djEx?=
 =?utf-8?B?MWl4KzQ0RVJEYVc1NWZ0RTh4Z2dBSjVlU1JFc0lubGwzL2JlalZlUVVsSGEw?=
 =?utf-8?B?QUptcnNuNVRoT3NqUUNlRm04T2VJMEdMN1BFTC9ybEdHY2F6T2ZkQ1FWNnRV?=
 =?utf-8?B?OFY1bmtpZU1aTmFsNHlPWVNDd3JXSEZlRWJ3djJBOFVRNENkakRVWVd5TFVY?=
 =?utf-8?Q?L16Jbd0CMjY55rEPsgjebvgEp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f602e9-758f-44fd-073e-08db0f9c7bac
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 21:34:57.0999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ty7RB9oJfqBEQ193o/0EUyDcXgH+UrC0NCqTQdSWCi0feasySkU5klGXKrgEtbeJ0a78oRkx5WUTmAb4dODETw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4119
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
Cc: Charlene Liu <Charlene.Liu@amd.com>, zhikzhai <zhikai.zhai@amd.com>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>, "Nagulendran,
 Iswara" <Iswara.Nagulendran@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tony Tascioglu <tony.tascioglu@amd.com>,
 Alvin Lee <Alvin.Lee2@amd.com>, "Leung, Martin" <Martin.Leung@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Leo \(Hanghong\) Ma" <hanghong.ma@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/14/23 16:12, Hamza Mahfooz wrote:
> Since, hot plugging eDP displays isn't supported, it is sufficient for
> us to warn about the lack of a connected display once. So, use ASSERT()
> in dce110_edp_wait_for_hpd_ready() instead of DC_LOG_WARNING().
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>   drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> index fb3fd5b7c78b..0d4d3d586166 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> @@ -779,10 +779,8 @@ void dce110_edp_wait_for_hpd_ready(
>   
>   	dal_gpio_destroy_irq(&hpd);
>   
> -	if (false == edp_hpd_high) {
> -		DC_LOG_WARNING(
> -				"%s: wait timed out!\n", __func__);
> -	}
> +	/* ensure that the panel is detected */
> +	ASSERT(edp_hpd_high >   }
>   
>   void dce110_edp_power_control(
