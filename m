Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B460323D7F6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 10:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8CA6E896;
	Thu,  6 Aug 2020 08:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770074.outbound.protection.outlook.com [40.107.77.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A976E896
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 08:24:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbpcX41zOrTc6ZAkB14fRQHr/u8+ULL+ske8/F5eQfQi+HswAFYeSg4iwWR7IR4Kqj8ij3kd1mjEsdzwfRDcBtYHFklZddEFaNvcBeqL5h/IZrFqjtV5qpvzDMPKh8X3dZFf5+DfnDB1oyAcUQFL9jK2YiBgaAi29AX32Fk2V0mQYHlZDYezOdSnc5zovMfE+CmB6HSXDwk/72nSHa7uQcqpp6KL6WfMqHUUWh0eBBjsv1ClYqVlUyBhG+vLGY0qe6o0i+rzdzK3rqlRFa8Neq8QVbyUayRvZ77dGSwbliKsMBx1GwSLniG4lfojuWnpC66vLqGtui/Opzvy7nGb8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNp8rploawT551CnLNJSbSGImSAl3U8awMGf+JUlHss=;
 b=cSq2op3AXbKuXzu09ShzXq/Mzqh7nrFW1iC1VwfdtvoqtyIq9NOXRxmg7YfC5M0Tj8iUig3fWn3NnpcqDxWx2mGWESJfLkW6XW7QUaUi5EowT9yF7ulIOZHJ4YjWjQ/mIlLV738Uywyj85OejSkARusY2OimDNXY7JUvSKk5LV+vAwTjTTCsLsxtFhAEwC/Gn4Jx/wR6BtEd0RzZRLoeieu6lL4zSjHy5rmdVA6Ay8VLwPLsqWQwmfq95OvWLahcdGR0sj4tSMiD8+9SfViMaGSNmh0iHpiUqMuPpNqdk2EjK4F6OGYrM9u98QdbEulTP4S1v+y7+9DHScHgoY3CQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNp8rploawT551CnLNJSbSGImSAl3U8awMGf+JUlHss=;
 b=VSu/ZkgsPv9vwco+szruSieeCEOp57upLEFiHEO/rfHcZtp3UIvMPY0aYZmtYY2Y6ko+SMjkOW2nAUzbm0xVfZiVb6Wh7/+lC+XZ7UFTmxElRcPbnOjEIWMeb0Hb2X4I1QqvDJYVI0TkUkBHtN0bNiEyz4jG9DeFVactORwDHbw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4319.namprd12.prod.outlook.com (2603:10b6:208:1dc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Thu, 6 Aug
 2020 08:24:47 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.023; Thu, 6 Aug 2020
 08:24:47 +0000
Subject: Re: [PATCH 39/49] drm/ttm: make ttm_bo_man_init/takedown take type +
 args
To: Dave Airlie <airlied@gmail.com>
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-40-airlied@gmail.com>
 <ed4f79bc-d01e-bc78-77ef-5120ae70a64f@amd.com>
 <CAPM=9tydAjSwOWf_CRUYqM5HzuhWPH8HUYOmn0P1ufGFCB=Gvg@mail.gmail.com>
 <b39fd32c-0c22-70c6-5abd-22eea744c769@amd.com>
 <CAPM=9tz4dfr3CSPoyBKL-zxCfVW7N3Yj==G=T9MB_2RRUwzsGg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e7709979-2f97-a6ac-3315-03e7bf06ef11@amd.com>
Date: Thu, 6 Aug 2020 10:24:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAPM=9tz4dfr3CSPoyBKL-zxCfVW7N3Yj==G=T9MB_2RRUwzsGg@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR07CA0011.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR07CA0011.eurprd07.prod.outlook.com (2603:10a6:208:ac::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.6 via Frontend Transport; Thu, 6 Aug 2020 08:24:44 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 01e017b5-2384-44fa-8e91-08d839e22e50
X-MS-TrafficTypeDiagnostic: MN2PR12MB4319:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4319AE02A002A351B057496783480@MN2PR12MB4319.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bdgd0pOWgw1DEUuTiKcOFN4AgIQTbo253GgefOYxqGDCvlt9/YxeOrHb+Srq01SK3YakPvL2rGkQ57XyU9icNBxwJE5xlr5U0Y3bK4O8sLyBDD0ovku/Yzpc/GM3aQmmHEj7sD3AbHnH1Aq/IqX7uZu914N1Xq4QCTZIoh98qEoO8MbBKnlh29HvUCz37KM3KmOxM325o2G58UuZQecvLXP5oM/cunJuOq0/LrqkW2aZw8bRmGAkb0KOF5I85vUg3qPYuZ0YgaKWfGgBYIi9FXeFTUHyayWOSTEQk5gCR4thORNMJsxHE3HVKbLNvkgYF7SdCESqkw32MRFd1eu0BQHtr19H1J2C1vCrbWtqPmdpVjIii57lO4kN64eRi3NC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(366004)(396003)(346002)(376002)(6486002)(8936002)(6666004)(86362001)(186003)(16526019)(52116002)(316002)(2616005)(66476007)(66946007)(5660300002)(54906003)(8676002)(31696002)(83380400001)(4326008)(36756003)(2906002)(478600001)(66556008)(6916009)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: NpEzSH3+Y+cR+RiaToDLQJqj2fbdsWGXemAfpy/sg6tjA2LDdtvXMfrxyLLBw12oSl2hhGuCJo7WV1aDAQri7yKJvUWDS90/Eq8V7FR8EG7GKOufaa+9DroY6yBQqq5b0LOUwtnA7LFevRNqJ0u99pVyMaZdlnyo01KT53cVFrMiolgRSrAKTermPBP/0bRluOoObgy86MlLFXI7CNDxfucaMat8In2KvPEv+LQYv6OQtmnyi3dzp9xAsyOLENpTkaD+Ou3+J4PtdYO3yxNREzrEEufOzHrZqs1BPSG3XlhYCHhaibELhih33qfJkcdkqopRGEF1n3JDdeBAGCcQRdAuxgsKGP4SWKiiRfvsEH3TS8dxoVJcNa01XC1Elby896H1krWMsgctorCRzG7u0KLF6uUmtO3MDasDYQV2nPNZDdE4dwrWZF7Cx+HjrzMPn79DP0xu74btyqN067mzmIrs/IhyZy9HlC++AdY7lkEnhmPH/60diN3w/P3jGm51jaa57I9pr8CL4XxhTc1nJMBcNY+EW0/w8HOq2WVPhuG/B/dOeGIR8VFBxkjuO8UfjDLCBkWjnSDc5WCLzI3EiwFdI25RvBaWp3pwyQQby/s8tTgBHkynkhMY4PQTD1XK9ifIM/UbP5amf/UsktgfKi9EJEQZhXiDTEkiBR48S/qdjuoaU+SNolOswZTFG4YHXrp9gdk7CUIMWkl0x0BtwQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e017b5-2384-44fa-8e91-08d839e22e50
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 08:24:47.6847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBIrOX9T1snbQSEzNCGxr0dELKlqs7TSRd+HUDzGgCf6UkUXqH92zJ2Yhf6tcMJu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4319
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
Cc: Roland Scheidegger <sroland@vmware.com>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.08.20 um 05:46 schrieb Dave Airlie:
>> That was not what I was talking about. Take a look at what those fields
>> are used for :)
>>
>>
>> As far as I see the only usage of the size is in
>> ttm_resource_manager_debug(). But this size is actually totally opaque
>> to TTM, it could be pages, bytes, fried chicken wings or whatever. In
>> other words it would be much better to print it in the debug callback of
>> each resource manager.
> Size is a bit trickier as the drivers use in a couple of funky places, radeon
> pokes inside the range manager and adjust its size post init, and amdgpu
> uses size to validate a bunch of bo sizing. These shouldn't be too messy to
> workaround.

Yeah, I already wanted o clean that up in radeon for years now :)

Amdgpu should be easy to fix, most likely we just don't store the gtt 
size anywhere else.

But yes, those are TTM internals which drivers should not touch.

>> The available_caching is completely superfluous as well. The original
>> idea what that a driver could specify multiple placements as flags in
>> one entry, but no driver ever used that as far as I know and it became
>> completely deprecated in 2014 when I moved the lpfn and fpfn into each
>> place.
>>
>>
>> The default_caching is used in ttm_bo_select_caching(), but this is
>> complete utterly nonsense. It just results in multiple possible cache
>> behaviors being selected, which are then fortunately ignored by
>> ttm_tt_set_placement_caching :)
>>
>>
>> To be honest I think just removing those parameters and the associated
>> caching flags all together is the next logical step.
> Definitely something to burn down alright.

IIRC we have a bit of dead AGP code in radeon which still tries to use this.

Nouveau might have something as well, going to take a look now.

But in general I think that drivers should just say I want caching X for 
this BO instead of TTM making an educated guess based on some flags set 
in different places.

Christian.

>
> Dave.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
