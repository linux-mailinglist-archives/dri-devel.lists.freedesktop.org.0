Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D31406743
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 08:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CE86E97A;
	Fri, 10 Sep 2021 06:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7B56E976;
 Fri, 10 Sep 2021 06:36:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMv8i6k7Ku0kkLiFGX25SUI2DzNbGy2ZqGPGOhg2h384BGAKAhOs7EhYndH2IWJ5h3A8cHQoposSjQGRKY/RJjV7yQNV5RW+D1F7j0Z1J0mkcIGoeDLCS3ZOeZW7Pp5sjTjn1HQaLlFeM/AM2DUoWo/WeRqlZ4IcAd0tNti5mD+sc512skSJEzFjcTU6Y9zvLjmuTRqSnuOgpdMwXm+3+TE686bjo2iR/nc0CxmoSasxFdnuQ3aVyUkgsfCnTAJ1B6jmyKO1r3PvWPjx08C4/90f/4dJSEsAxCwpVWI4cuPM/+mOrcrxdMe2pihnQ0rT5Q5qVRNHfyIIfv9j5jQhuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ZB5MhS/2JXRZ+vzCSaM/yVkm9fX00ubq8QQY4PcerS0=;
 b=XOSTWsvScMab7sL9S9CykcEZseXqZW4FJmE62foY5oBOsP2BmIBYjabMeKp/vvVPberlHRM2FkiS/mUdQByw2cH7d9ryfwURhRfaZ1oULubTNOQf4AFYTb1UEfMtyaCQ0V/nZ1S5wK5G9fP5DZrrhpoQat1wywwCHimWuEKlvBepzDt1gC3haAj/DL0Ry6kMtSAYY7z44ID84tlE6utrgSqy6hW8eh8vISSy7x7GiErYA37WYTGzJN6KX8HTz72ednycVyKLKih2Q+sEr+pY04sVO14uEvDq+uCIzrGrduJX9UPz13iKQberqb1NYycC8H1HnKZhW5fs0G9nWDWBKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZB5MhS/2JXRZ+vzCSaM/yVkm9fX00ubq8QQY4PcerS0=;
 b=W9xRl9BmeadnvmihwUKn1TxUAxCbCqw+wpMdeeWu/TYMowEWeFGLv3o2M0wn/nn5kA9svResxT+audezWtBWb4NXFMggqk1s6A9e49F3a43RHcthG3mMl87ZdCSg0egyvcOXJWGDpNyEkk/TrqLWzlwsvqjh9WX2v2Vm8OsIxV4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2484.namprd12.prod.outlook.com (2603:10b6:207:4e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 06:36:50 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4500.015; Fri, 10 Sep 2021
 06:36:50 +0000
Subject: Re: [PATCH] drm/ttm: add a BUG_ON in ttm_set_driver_manager when
 array bounds
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Chen, Guchun" <Guchun.Chen@amd.com>
Cc: "Shi, Leslie" <Yuliang.Shi@amd.com>
References: <20210910043014.529-1-guchun.chen@amd.com>
 <DM4PR12MB5165EC993C7CF4413D52925E87D69@DM4PR12MB5165.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b065dd8d-5914-883e-b51d-8a718dae534f@amd.com>
Date: Fri, 10 Sep 2021 08:36:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <DM4PR12MB5165EC993C7CF4413D52925E87D69@DM4PR12MB5165.namprd12.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------EF7F06416C9E2F57D5325C60"
Content-Language: en-US
X-ClientProxiedBy: AM8P190CA0003.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::8) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM8P190CA0003.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.15 via Frontend Transport; Fri, 10 Sep 2021 06:36:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b971e0c7-46d3-47b9-110d-08d974255e95
X-MS-TrafficTypeDiagnostic: BL0PR12MB2484:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB248438A2C7DB49685015C18683D69@BL0PR12MB2484.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zqJ6650XqxlgcY/BQCX8TRtf29f6M8ifg+rmVqJ0tEIhRdnNKfroGJjQY1H6NQe6bBPlJ4pubZcFP6c2pnVZDmvOL+gFp4g0sfZOD7Z+CMj53ZmkCxkJ+cvevnqztHaZt1Szzibyd5vr5eKEcV1CEauExX82XdhY+F1nzUWI4OZmhYgKWBg5+ADfYiwWO/gvYYuVsnzlhP0cHwndrWYmZfQD7hRVlcmq3az/3AW47CyXxSrtKBQt4K5qS1wfVbpqWu2A689FQCzVXwX1yfjfVZe2F2pRCJE3dlIWoog9IukgrBe2koM1zcnF/kSppGT5/UN4efoxEJ3uyvodw4XHwZ9UAbIopraUA4wD5xzIMPfkNa5PXPeD34XdhUJBfM3Hs6SyqUErQxprhB3C3uJI521w+Zp7+RNFxwYxAnrec+zqmyktP3QeqZ4JxRDI8VhWK5ozhQx6xq4bN7VStpf7KCm7is3lTEbWwDUvFR7+RednVnRsZ+z3QYLL+5irGyLsbD8qP/m6kq8CfMzw6tLubeIrBhqyyQuHhkIADFgjfk6C+QsrpxRh2ZoMHGDJVN2lzgdoabi2c91OyN1bLmOB2tUh1LRnM4cWcexF23QASFhmbeQpbZL8kBQCUE5TV4BuODiKOD0CN8U3M6smBuFy8FNoGy50VR3U2RWF3X7SRjA/PSdQiuFNHCWgLp/YjS28SLPpU2YZtqf3Sz7CLxXKo3Sm6+Lyptl+8EpGsNiIdSc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(36756003)(26005)(66946007)(6636002)(66556008)(66476007)(8936002)(2906002)(110136005)(6666004)(83380400001)(16576012)(316002)(478600001)(53546011)(31686004)(956004)(38100700002)(2616005)(33964004)(5660300002)(450100002)(8676002)(6486002)(86362001)(31696002)(186003)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGNuSm5rdEVNNHBtWkNpbWZlWWxlTUVLU3VIKzA1U09CQnE0aXZ6cXdUSDJT?=
 =?utf-8?B?ci8wbmFldEV5cEQrYzFUV2V2YUVGQitWRW95TzlGbE5KZDllWjlOWVNpY1lv?=
 =?utf-8?B?dEdBN1Z2d0QyQldtNVNvUFk0VkkvZHN0amcxZ0krKzZENUtyUWVnL0JOK2tv?=
 =?utf-8?B?TWptcWZINUdndGtzR0g3ZU9FUXIxUkJtbFJ5WVBCbmsrYVl0ampvaFJvaFVJ?=
 =?utf-8?B?bmsxQThmMm5mcUdObTBISUs4Q1h0emFiNndmanpyVzlUODM4aDAxQ2JFWkpo?=
 =?utf-8?B?allGdTRzMkVkbUJIakY0cFNMVTd1WW5yU1BhM2lNYTJKMVBudTRLUE5LMGVN?=
 =?utf-8?B?YkJMbXZsVFhhYUg5WGFWQ3YweVFYSFdqK0c5RTU0NzNvZjdMaUVVWk1WNDJW?=
 =?utf-8?B?S3dZUHRmNWVBY0xBTGdyWTBZK29CWXJzd243N3dHMWV0UVR6RzAydVFBcUlS?=
 =?utf-8?B?RjVsSS9pRnJWaWw0bThHb0lqNFlyd0hKeDF1dnpQOVNWK3NVeFlMdUtCR1Z0?=
 =?utf-8?B?K2RzSmZTRkx3NHRZOGpudkl5ODRiSlZkSmhIRHdNS0Jnd2dkZkRLMU5UVWVw?=
 =?utf-8?B?T0gyb2QxUWhQZzc3bzZDZk1IQ04rT0JjazNNTFNHdmZsZWdsVVdsVkQxSXp3?=
 =?utf-8?B?WEkyd01YMmxWaDU2V2YwRUkrdUhyeXcvV3RFTnNxbFpmc3JZdHlScktOS0VC?=
 =?utf-8?B?RkowVFd6d1lCYlpqUFJOSGxlQjJROW5BRm5tZU1NUkxHQWgxdCtERlA3c2JZ?=
 =?utf-8?B?d3V3ZkR3NFVycE9xTC9maGVQcVlZYUZUTCtjczA0ZGphVHJFQTJBZVZqcXhD?=
 =?utf-8?B?NStEcGlveHArOW5wN1VTalF3Y0VjSVptRnFXYmRhZHEyZ1llZlpGdjJlbG9k?=
 =?utf-8?B?blJ3VlFIb3BQQ0ZkV3Nrd2xrZkVPdk1aVUwzQkZDZUxSejB3enNtZjFtUHl3?=
 =?utf-8?B?aitJbzQzNHpLa0hFWENFQkRUR3R5eC9nN1A2dWZSbHlsY2I5ZCszVkQ0cWVI?=
 =?utf-8?B?bmo1THFKN3FMRGJKSkpDQ2NWcXBUQ2NIdHJxVHZKZG05UnpqSGVmc3hCNnMy?=
 =?utf-8?B?M01LS1RMQWFUQTlHZzd1eTUwemFsV25NdGxMdFJnckZlRXZFT09WU2d1dW0w?=
 =?utf-8?B?STQvWUdxMzlhem9sdkh2Z1phMCtJMlBzaGZ3amljR1RKenQvSDJnS0dEcjdH?=
 =?utf-8?B?VVJtVG5SaGVGdHpmdStkQjdaL3F5ZGtIeHFDcE9nb25DTXB3Rm1qMFdONFNG?=
 =?utf-8?B?ZVl4ZHlLOEsyTmMraVcwTUtrdWY5bUdldUVyemxIKzB3dWNUSWRhT1A2amxx?=
 =?utf-8?B?OXNJMTFFUkJlRnIzdjFTZ2EwczZPdS9RcDl5QS9tNjhtUVQySXI3Q3dsOHlF?=
 =?utf-8?B?VjdadFdXNkcza0VmTUxuR2xUZ3g3d01qR0FzeDE0OENZWTJvbnBMK0s0akxo?=
 =?utf-8?B?OGRxTW9hT2MzOWxtaXFtVnhZcmptYStNa3FUUFZ0cUl2MjRhSW9YZGJkc3Nh?=
 =?utf-8?B?UkcvcW1mNXBTTVZ5eUhPa2VuVHhFMVJMVEZDemZPMUZvS2UxK00wWm5vS0lz?=
 =?utf-8?B?OWlFR0FsRDFJQ3lHRGwyQm05UTVzU0pBZVhtVVowVjJjVjdmMm0wQjA5L2VL?=
 =?utf-8?B?bGhLbWU5SDNmZ3NpZG45NTJOc2Fyb3RQd2wvVFFJYW9DdVZkZ2pGVndsUFA4?=
 =?utf-8?B?MFkycWNPRUtHOFVHZUJiUEFMRGdmWjdGVXZBUjlBdGoyMGJhSTc3Z2ttb0Zy?=
 =?utf-8?Q?fNRF5vsW8UpCJNKwdq78jlbMrrqJZS5+1kUr3i8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b971e0c7-46d3-47b9-110d-08d974255e95
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 06:36:50.1084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/fe+YR1lfaeCteIvuQ3ChaZTFVChJ+ys2K54i9cl495SKRVpSytzFaedwbblwHz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2484
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

--------------EF7F06416C9E2F57D5325C60
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Yeah, that's a good point.

If build_bug_on() doesn't works for some reason then we at least need to 
lower this to a WARN_ON.

A BUG_ON() is only justified if we prevent strong data corruption with 
it or note a NULL pointer earlier on or similar.

Regards,
Christian.

Am 10.09.21 um 06:36 schrieb Pan, Xinhui:
>
> [AMD Official Use Only]
>
>
> looks good to me.
> But maybe build_bug_on works too and more reasonable to detect such 
> wrong usage.
> ------------------------------------------------------------------------
> *From:* Chen, Guchun <Guchun.Chen@amd.com>
> *Sent:* Friday, September 10, 2021 12:30:14 PM
> *To:* amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; 
> dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; 
> Koenig, Christian <Christian.Koenig@amd.com>; Pan, Xinhui 
> <Xinhui.Pan@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>
> *Cc:* Chen, Guchun <Guchun.Chen@amd.com>; Shi, Leslie 
> <Yuliang.Shi@amd.com>
> *Subject:* [PATCH] drm/ttm: add a BUG_ON in ttm_set_driver_manager 
> when array bounds
> Vendor will define their own memory types on top of TTM_PL_PRIV,
> but call ttm_set_driver_manager directly without checking mem_type
> value when setting up memory manager. So add such check to aware
> the case when array bounds.
>
> Signed-off-by: Leslie Shi <Yuliang.Shi@amd.com>
> Signed-off-by: Guchun Chen <guchun.chen@amd.com>
> ---
>  include/drm/ttm/ttm_device.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index 7a0f561c57ee..24ad76ca8022 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -308,6 +308,7 @@ ttm_manager_type(struct ttm_device *bdev, int 
> mem_type)
>  static inline void ttm_set_driver_manager(struct ttm_device *bdev, 
> int type,
>                                            struct ttm_resource_manager 
> *manager)
>  {
> +       BUG_ON(type >= TTM_NUM_MEM_TYPES);
>          bdev->man_drv[type] = manager;
>  }
>
> -- 
> 2.17.1
>


--------------EF7F06416C9E2F57D5325C60
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Yeah, that's a good point.<br>
    <br>
    If build_bug_on() doesn't works for some reason then we at least
    need to lower this to a WARN_ON.<br>
    <br>
    A BUG_ON() is only justified if we prevent strong data corruption
    with it or note a NULL pointer earlier on or similar.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 10.09.21 um 06:36 schrieb Pan,
      Xinhui:<br>
    </div>
    <blockquote type="cite" cite="mid:DM4PR12MB5165EC993C7CF4413D52925E87D69@DM4PR12MB5165.namprd12.prod.outlook.com">
      
      <p style="font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" align="Left">
        [AMD Official Use Only]<br>
      </p>
      <br>
      <div>
        <div dir="auto" style="direction: ltr; margin: 0; padding: 0;
          font-family: sans-serif; font-size: 11pt; color: black; ">
          looks good to me.<br>
        </div>
        <div dir="auto" style="direction: ltr; margin: 0; padding: 0;
          font-family: sans-serif; font-size: 11pt; color: black; ">
        </div>
        <div dir="auto" style="direction: ltr; margin: 0px; padding:
          0px; font-family: sans-serif; font-size: 11pt; color: black;
          text-align: left;">
          But maybe build_bug_on works too and more reasonable to detect
          such wrong usage.</div>
        <hr style="display:inline-block;width:98%" tabindex="-1">
        <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b>
            Chen, Guchun <a class="moz-txt-link-rfc2396E" href="mailto:Guchun.Chen@amd.com">&lt;Guchun.Chen@amd.com&gt;</a><br>
            <b>Sent:</b> Friday, September 10, 2021 12:30:14 PM<br>
            <b>To:</b> <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>; Koenig, Christian
            <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>; Pan, Xinhui
            <a class="moz-txt-link-rfc2396E" href="mailto:Xinhui.Pan@amd.com">&lt;Xinhui.Pan@amd.com&gt;</a>; Deucher, Alexander
            <a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a><br>
            <b>Cc:</b> Chen, Guchun <a class="moz-txt-link-rfc2396E" href="mailto:Guchun.Chen@amd.com">&lt;Guchun.Chen@amd.com&gt;</a>; Shi,
            Leslie <a class="moz-txt-link-rfc2396E" href="mailto:Yuliang.Shi@amd.com">&lt;Yuliang.Shi@amd.com&gt;</a><br>
            <b>Subject:</b> [PATCH] drm/ttm: add a BUG_ON in
            ttm_set_driver_manager when array bounds</font>
          <div>&nbsp;</div>
        </div>
        <div class="BodyFragment"><font size="2"><span style="font-size:11pt;">
              <div class="PlainText">Vendor will define their own memory
                types on top of TTM_PL_PRIV,<br>
                but call ttm_set_driver_manager directly without
                checking mem_type<br>
                value when setting up memory manager. So add such check
                to aware<br>
                the case when array bounds.<br>
                <br>
                Signed-off-by: Leslie Shi <a class="moz-txt-link-rfc2396E" href="mailto:Yuliang.Shi@amd.com">&lt;Yuliang.Shi@amd.com&gt;</a><br>
                Signed-off-by: Guchun Chen <a class="moz-txt-link-rfc2396E" href="mailto:guchun.chen@amd.com">&lt;guchun.chen@amd.com&gt;</a><br>
                ---<br>
                &nbsp;include/drm/ttm/ttm_device.h | 1 +<br>
                &nbsp;1 file changed, 1 insertion(+)<br>
                <br>
                diff --git a/include/drm/ttm/ttm_device.h
                b/include/drm/ttm/ttm_device.h<br>
                index 7a0f561c57ee..24ad76ca8022 100644<br>
                --- a/include/drm/ttm/ttm_device.h<br>
                +++ b/include/drm/ttm/ttm_device.h<br>
                @@ -308,6 +308,7 @@ ttm_manager_type(struct ttm_device
                *bdev, int mem_type)<br>
                &nbsp;static inline void ttm_set_driver_manager(struct
                ttm_device *bdev, int type,<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct
                ttm_resource_manager *manager)<br>
                &nbsp;{<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BUG_ON(type &gt;= TTM_NUM_MEM_TYPES);<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bdev-&gt;man_drv[type] = manager;<br>
                &nbsp;}<br>
                &nbsp;<br>
                -- <br>
                2.17.1<br>
                <br>
              </div>
            </span></font></div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------EF7F06416C9E2F57D5325C60--
