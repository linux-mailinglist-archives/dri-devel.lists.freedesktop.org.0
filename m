Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1169739F849
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 16:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BE26E182;
	Tue,  8 Jun 2021 14:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2046.outbound.protection.outlook.com [40.107.100.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A60A6E0E7;
 Tue,  8 Jun 2021 14:00:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2FyAaYJhvbgAYn3z8gigCWLJNzIoLSb8U4iGt/78h5eox+QGrsptnBJGNgQRtDsvDTmtEryp0P67UoPVKTQqOnnf3Mv257Oxernai6Rxqrik77RwQU4Qwgjm3X05MgAgKg00CzXOzt3bDNjey/fQun39LQ/eLE/bF/rJMBs36mumI2uPMxBJXlVoDqqaNfNzrJygsDOTZBEKxKNmCWqLFujyrRn9Gm0LSvv9gTUF1T4oyz/YhxqiQx70r3T6PwiUYAzPCXUEQVdzV5ZI+cJrmIpo5aK6nCRygQBZziFdOBBnLOC1Pniy/jw+58u50jUgLOkmSj/bl8EHRLpEmjTPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYpJBAMZ0dVwJvSnfKbBOMbd4AJhUbdNbAiz7vX049w=;
 b=mDRO22CaHvU/Hx0USfY2mvOjkhkVYqXWyxAf4GkKaNGCxMOLHLkwfAm7bFyBaEiE4IsH98hUp6QAWIsrzga3eQkk07PzB/XOu9N1GIRGF1WOK7eEleVe+X40/wBdqSnIjnJlDRV+IJKUg6oidmhFEodjhG6Snk+8qYqKlDzxJvhOAguj1c2bEWIFCjC1/pFIJR2LEJxOYIOCFJYyAHtkU2N6tqrg61Z+MszyYHHdq+5qayJilFWQ5KUPZniLGWiNzHuCxO4JpbiUMaDseczBCUBRD47KAtxEz8nW7rd0+S0zrbSlhTjeOG/skAseH1ZFnhLAUMfbtk4LHPlTTR5KLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYpJBAMZ0dVwJvSnfKbBOMbd4AJhUbdNbAiz7vX049w=;
 b=FTxnPZPkmUbmjCLZA+zN1zjVoTagN0/n4Ic0ap+SZNz4Bud5OcyR49S7SY62IU6dloLqSbpKq8dM6ZFU/ct8nRJ324Ksk475AR9/WoImXwk12x56wu0Zvfz4PDLi5drIkqSzlk/rmNbMFikE/PlkvaowRNcQizyEVb5vGhyiU3s=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5395.namprd12.prod.outlook.com (2603:10b6:303:13a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Tue, 8 Jun
 2021 14:00:05 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f455:b0b4:439:2753]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f455:b0b4:439:2753%3]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 14:00:04 +0000
Subject: Re: [PATCH] drm/amd/display: Fix error code on failure to set
 brightness
To: Anand K Mistry <amistry@google.com>, amd-gfx@lists.freedesktop.org
References: <20210608143159.1.I230026301243fbcee23d408c75aa468c1fec58f7@changeid>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <e599ffb5-da5c-e4bb-a7d6-c2208a48868d@amd.com>
Date: Tue, 8 Jun 2021 09:59:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210608143159.1.I230026301243fbcee23d408c75aa468c1fec58f7@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [198.200.67.154]
X-ClientProxiedBy: YQBPR01CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::39) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQBPR01CA0067.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:2::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.27 via Frontend Transport; Tue, 8 Jun 2021 14:00:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ecc17c2-40c9-4cfe-d13e-08d92a85b753
X-MS-TrafficTypeDiagnostic: CO6PR12MB5395:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB5395E4BD34E4C350959E04C78C379@CO6PR12MB5395.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3/zwRRa1H3NJEfG5QP1u7HeO5zbFNtEDoEHXpaifOElWc3ko821LauP+4icVmYg2rxM73OkU9mIWnxl2TYLTZgbW+z9k6sZuFdBvcrmVYYogm+X4XitHHzootGbu+Wy+ia/bXGcpIu4Mg8unj7SJuYKl1HbjurIJ6DlZrm42Mn5On0GUDK4YDmI76VLQnsLrGA5nlfn3zzFUK3jYMe4Ci9RY+jOeEHaaV24o5R8QZPUCF+HsDlhCeEKDbGSBEN2bY2hj/NY/t7DH1ur233YY9ej7gB4Q70jD7GBEYU89RGbfLyYPfJVNowTAsiXKWFXO1mHXxTalq5Qkkk3oM8LBToUl+vDVHJZmmz+F5745T+8bm/cLGoCxVE4cjvDqxXDc156VC4P6uMHH6akAI+6wfZEIO62gw5HSjPUGqJ7G6LkVSJvtLpBv4EUkUZGLJgQh7kEtS2TcVirQGck9Xw2GewKWDNY+BgM0HirjndcdbJIf6+BcwpIdjxep7FUNQQQ6nFEU7chisLN4wzh/zMP3v8Hx0pyKlL/ywgxyw5GF1D6+LEiJEwjNSG7DefnVPX1KnUQ7aEo/26DIV9L8kwpU4iJB+XqnPlWUDKNY8Ut68A0e10F/hWEWSAkiMixZ6Djn22eSVYGO1L3Do+Hb00KpPi/EbIKieKUJUv6vGXOWNGTKLwBS2Ab5bU1subujdbE6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(366004)(396003)(376002)(66946007)(66476007)(66556008)(5660300002)(8676002)(2616005)(38100700002)(83380400001)(44832011)(6666004)(16576012)(8936002)(36756003)(54906003)(86362001)(16526019)(31686004)(26005)(31696002)(6486002)(186003)(956004)(4326008)(2906002)(53546011)(478600001)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlNBSUx5aGRZa2xUd3ptbmFiZC8xcjk3MGpMeVdyY3ZTMHgvWEZrUGx0UERD?=
 =?utf-8?B?MDl4UEExclpNZExNOTJ6OHpqUGx0LzNGcXhkOHo0cEJxSkJKNGU3ZE5hYWdo?=
 =?utf-8?B?YU9laEhnSWk1VUhzMVRZdFY3WWxTblVIZ3JhbzRXenBESFgxUXpSUEo1N2tN?=
 =?utf-8?B?N3dJai9aY01VRG4rWDZYc25PR0VTbFRJU3VObmg3Tzd1T0VlNm5QSDdXTFNP?=
 =?utf-8?B?MTBaMnRQaUlIdTJlUmFRY0lBZVNLbjJDZDRHOCtlTFNFUUlKRlhyVUNUb3Z4?=
 =?utf-8?B?RVlRVTlOc3B2cjNidW5zNGVhV0tZTnZOWGhEVHRMWG1xMU5Sa3RNS0luL1Vs?=
 =?utf-8?B?MUdmdDFpYnMxQXdjaVRHL0NPMlpnM0JNcWhaRzZyRVBTVTVNRlA4R1BTbDRl?=
 =?utf-8?B?SzRia3lqTVA0cjlWWjNVUzkzM1VpNHdDUG9pcDBMQ3QrNHN2U2VNbGdWZitT?=
 =?utf-8?B?UlpLY291NG9QV29vVEJiZWFKOEVBOCtoeGtpZEFZdHdLd2F5Wm9VYXNZVzdm?=
 =?utf-8?B?bE1TNW42Sjdjc3dhVTgrMnAyeFFyWEFtNEFIYXBGeXpsYUlPNFRrQW9QdkNK?=
 =?utf-8?B?ZnBnaXNnMSt1VTJiamxaL0o5emFmQ0lLazBVeGErV3laUHNwTVpNajZvUytk?=
 =?utf-8?B?bTBocWZUMUhxNVNCMXNQeTZmRThKeGVFa3VQRFBDd2dWa2UzK0xYYWswQ204?=
 =?utf-8?B?Y0xCVjBxSTF5T2ZRZ2lQSnNUenFJZXlmMGEvY0QwWUhwTm5xUDY3YVRFNEU3?=
 =?utf-8?B?bFk2Yll4UTY4QzFaK3NNbUllVDl4K2c2Nk9mYXhoRkUwWGJBTGJTVUJ1akNo?=
 =?utf-8?B?WWo0WVNLcTNhN1RHWENwMzdjV2EvYmx0bkl3WUlCT0NrMUw4SXUxQkd4citL?=
 =?utf-8?B?Ym9MckV6dGRva0F4Y284MmozMUd1RDVDdmlraTk3T3V6TllYNWJISGNUdkFF?=
 =?utf-8?B?K1liMHcyT3VweEJIZEpOcjRXSDBubDBGZnZ5RVFpSkZuZU10V1pzQVd4bUxl?=
 =?utf-8?B?RDlOV29rMU1FUUhBdXdML0ZYejVuZ21MbDF3WlJ0Njd4WkpFNVRJdzZnY1dv?=
 =?utf-8?B?eHprZjFXT3VhL09xcDVCenppM0RYcjJrMGV1Z0REY1I1ZGZMaVVHQy81WWJY?=
 =?utf-8?B?QW1vc3VYeDJxUWk1VDR4c20vUVZjQWwwY05PcklWZDhhRWVWNzBhbDZkb3Zs?=
 =?utf-8?B?bHBZeHB5VTRQWTl2NmJLSkJOa0Y2a2d3ek1xQVNQUURMUWx4VzFzOW5EUTJ3?=
 =?utf-8?B?bXUyUWx1MHJiWW90emQ4ZmlDTVlMRzVGMGpkbm0zYWJQc1g4bkJXemw4bnk3?=
 =?utf-8?B?SDcrT0luSTFOMHEyOXJ5dlpHYmY2VVpPaTYwZGZGVFFwQlQ3ckFmN1J1Wkx2?=
 =?utf-8?B?ZlMyUk1KdTE5WGVVWlRlSmFCRlkrYjQwQU1rUXZZUEZiNk9ya0JURjg1U08z?=
 =?utf-8?B?TmpoQUw5WnRuUStheW83WGpVRTJOemxhU2h3azFtMEpaY1hWekxlazhRQjU4?=
 =?utf-8?B?SU1VRTNJU0p1T1FHd3g5cmUxVTM2V3E5NldoTHNJcUdpMElYellieVZGZ1FZ?=
 =?utf-8?B?czczTk4wL0NzVGJqbzRVNnJFUkV4TUJGME1jMzNmbWhxL0JxdWlmeUM5NHl6?=
 =?utf-8?B?T2d0V2tQRHJLbzhCZTM0WW9OTnRSemdJQUtRK2tyTUNaWE5PSFBpTENjVzZV?=
 =?utf-8?B?bUdScGNCQlhzQUFGdFFTZkx4Y2ZNQnNJYm43WFVkUVhRK3FCdDg4UkNRRWxV?=
 =?utf-8?Q?RjJiCUnr3pLIF7xjD+yluhW1zI2g5wb2/oAqnc/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ecc17c2-40c9-4cfe-d13e-08d92a85b753
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 14:00:04.7422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMvKZjrErV9XHY3biBUigqpi9Adkn024RI+LmbXki5Iw6a3xsmQ0BjY07tQMe5ewXcUdn8R4IZ++QSSn13i6Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5395
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
Cc: Eryk Brol <eryk.brol@amd.com>, David Airlie <airlied@linux.ie>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nikola Cornij <nikola.cornij@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-08 12:32 a.m., Anand K Mistry wrote:
> The backlight_ops.update_status function is required to return a
> negative error code on failure. Returning a positive code may be
> interpreted as a success. This is true for the 'brightness' sysfs file,
> which passes through a non-zero value as the return value of the write()
> syscall. This is interpreted in user-space as a successful write of 1
> character, which is obviously wrong.
> 
> It's not clear exactly what error code to use, but EINVAL should be
> reasonable.
> 
> Signed-off-by: Anand K Mistry <amistry@google.com>

Thanks for your patch but this code has changed on amd-staging-drm-next.

Can you try with the latest? The new backlight_update_status will always
return 0 now.

Harry

> ---
> 
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 652cc1a0e450..ad322613390d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3431,7 +3431,7 @@ static int amdgpu_dm_backlight_update_status(struct backlight_device *bd)
>  	else
>  		rc = dc_link_set_backlight_level(dm->backlight_link, brightness, 0);
>  
> -	return rc ? 0 : 1;
> +	return rc ? 0 : -EINVAL;
>  }
>  
>  static int amdgpu_dm_backlight_get_brightness(struct backlight_device *bd)
> 

