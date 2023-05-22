Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1469670CB2C
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEA310E385;
	Mon, 22 May 2023 20:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2052.outbound.protection.outlook.com [40.107.95.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C197B10E385;
 Mon, 22 May 2023 20:34:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5yEkYUgYLlWIjCHYAAIjpKixcigW3RoJ/66UE3+4w4g9cCYEVZXQslX5n1prSpRTuN7BToQ3IMkCYQXnFjwm2KWDMfJt4AMFepXmr2Y3pFqhsHotgBQ/P/7zt2LZa1zOAjspvSUfR2GTa6W20hWxXEYBJ9bf4nWLvqGcv588eGS6YfggWbhRRCtxYq4dDutw7gbEk78pmVbwOGjn8KWrCutweDVuqsdf7igpwNqdPqmfiLzicsU0Qpbz1voDXEgJQ1b6KTRELWzGtwFdzYF/gSh3GMLfismt8pe8tp8j0aFGCWtgLVNk42278y+pLFebun1BJIU70kEieuT5QMCgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVLPo9ky8YoTf/Wie3l9Xr1hQq9AMwOkUHQuARs/kgQ=;
 b=PZQiWUlKoWmZcLSssRq0aFLOXRyfitMNiCXaXozIFis3slm2YibfyfOver/5gKABTI64ufI1wx64WWyPFKy4/u0NLjZjcB7toBGSRVLfI54sUAT3NL91QRaR4eM7Oz0z9yyfzllJy5cLR3gcgMpja1zN2x37GcW/EVriuyjS0Hkni2FFdb3KMo90S7kQ0TxRbUq4sBICo57xeq+yb1PLoZm8FBC8F+5ooVtDp2kpYwGdFwE/aFUE/EWcY/AYPQf5TSerV+Q58vW63jkTNtVsli3VjmdR0MVHh8nLpYXIt/876IPJ3y1/9FU2KzApfPOI0FOzqPphDGUej3Biz9aesg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVLPo9ky8YoTf/Wie3l9Xr1hQq9AMwOkUHQuARs/kgQ=;
 b=Vp/OfABiEWdi06x2fcD99drTqr0bRI7c/+HnA9MxyF8xV3umYxgMeCIZeI5gXSPWNl77YQcSv4SzF69LbiXmJ7muezYohRmjRHLV+5roRVL6IaqsTmdGgYBmosFH3MhiYKQqsoUVlvQ6YkT+9ThxlGAMcDed6teO9kpuWRnhQek=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by MW3PR12MB4395.namprd12.prod.outlook.com (2603:10b6:303:5c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 20:34:54 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::c549:4aeb:a02f:56b2]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::c549:4aeb:a02f:56b2%4]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 20:34:54 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Kees Cook <keescook@chromium.org>, Azeem Shaikh <azeemshaikh38@gmail.com>
Subject: RE: [PATCH] drm/radeon: Replace all non-returning strlcpy with strscpy
Thread-Topic: [PATCH] drm/radeon: Replace all non-returning strlcpy with
 strscpy
Thread-Index: AQHZjMUq5nT5Uy41a06P5Le2d3+loq9muquAgAAFGlA=
Date: Mon, 22 May 2023 20:34:54 +0000
Message-ID: <BL1PR12MB51449651815176A931602F91F7439@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20230522155032.2336283-1-azeemshaikh38@gmail.com>
 <202305221315.4392080E4@keescook>
In-Reply-To: <202305221315.4392080E4@keescook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-05-22T20:34:53Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=9f581c6d-b183-4170-9979-a86e7be8330a;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-05-22T20:34:53Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 87c9052e-9342-472d-876c-44ba19b52995
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|MW3PR12MB4395:EE_
x-ms-office365-filtering-correlation-id: 0623c677-fb9e-4919-9d3d-08db5b040015
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b+rUxM47wKu0YWvV0oVNjWUfUCw5MiIgFcNgyrcAZST3PsnhaLqRJ63lAiQhJge8m1GiwXbBpVrgYSDPZpUerJygRtF4N7QnoFDKgQx/15yVOBznOgHb2hbe8LkZQ6fkCTyor8KSE13gtdrhdZbKrEdo/Uk9kz/eqEPPlABa7mwtvQqWUriAIAqzMR6DAQViiu6KOuYbwTx40sR51+BZWrBiMn9/D4sz1SmHse/pztAzCK9cJ7zayxSjOI4Fma1K78onKa3RxlyH4l864MC9zTVlaqsbtkWYiQJyH0NlYx2fspyNxgTJuSdmsuPVhZyfg9kbYn7iq1PGSidzIQKTx6buxRO82q44z0hGFuBs09JGoO/5G/Qwphr++vAuA0du8WII7lLLeDtfT2mLVVAVhLI4TOCSyPsvS9koVjHI4jemPw32rsIZk0sk147pIeeqsUU5nFMv6ku4udJniHF6aIdcqRI2gCmvDAs3ZLCYHdTjBI/W8zyBvt6Q+p+UasaRwjnM8ZDFlwyOhZYVqWFs2vvMmA5x80bXpbhI02eHMZ+jYodZZ8gyhfNVgJ6bJquBVKZ8RrsuNe/eLXIZjNzvEW4dnJylZ2z8M95n3hqeZ3vKpRzsuwcKAvrWpxRCSpTU3IhwekBv20YEaOH702vXg4//zsCvj5ogpRKOAlcTl1c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(8936002)(8676002)(5660300002)(52536014)(53546011)(186003)(83380400001)(6506007)(9686003)(26005)(86362001)(122000001)(38100700002)(38070700005)(41300700001)(7696005)(71200400001)(33656002)(966005)(55016003)(76116006)(66556008)(66476007)(66446008)(66946007)(64756008)(316002)(4326008)(478600001)(54906003)(110136005)(2906002)(156123004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w087CZacn+P0BfJRhpVAkMYdXpD88LqE9sAWyjoToSNqffokWsYIBsd0Akqk?=
 =?us-ascii?Q?jUWc0L48by/L1YBw4hSGZc/pwzYvkOkj7FCzBr4roqZOzdp13EdT9TiTwQbN?=
 =?us-ascii?Q?6heT3bdyh+yIy4qB9CNLAITvjMJ2xFSziRkTZiQCba2C7ameDAx5ZQj7I4e7?=
 =?us-ascii?Q?eT4FO23tIgRhiqkUnn7qhqBIidfZeEsxvuw14GhUQE+GhJl1hwDUFGrdR4zm?=
 =?us-ascii?Q?clWFoHJh/Wk3spqVi81yR14OnoRWGklT4IvUOg1E/h6SVZ/e0Ng81cbP9oWN?=
 =?us-ascii?Q?1S7vReKfItXQEDU8f0+AtVteQ+yHZThq6B38Zmrjk9vHK5bnsWmr+OZtFjGv?=
 =?us-ascii?Q?WQ8VnPxFHPJ/CfDQjC6OhbREJp3MLRQB1Dw9KK1qE321WWkpX5PSts0uhDhY?=
 =?us-ascii?Q?CIwPctdZ68/bYD0jgxdeW7o3LGgz90ZfSmrvmoqb/Yi6lTEmiM+HGwj//ud1?=
 =?us-ascii?Q?IRPEm475LHDiOajLKiIuCgIvKuNgCJOlgSx5g9zoDJhPyilXNU5iGvmsOgAv?=
 =?us-ascii?Q?S2J3r9mT1KCW/SDTmqli+HRc/7AS8D7FCR4I3HGsqA2kIf2iXO3/TE03czpe?=
 =?us-ascii?Q?kYa2D1vobY1CmUAR8NKv8rB4RYW4rQdbg7D6J+8nNHxKHkLvvSbkoyzzFBMk?=
 =?us-ascii?Q?/QOpo2p+XzMe6uBA+AfuYaq7KjDj+GiPMPUaw6xH7LhIHF8Qo/Mqt8OBi5GV?=
 =?us-ascii?Q?FRdo8gJG4MPKIyQ67p4eRuHAQxRRKpUFvzXQP2ob1/ImgPrRShlQnvt0ghcX?=
 =?us-ascii?Q?C3oekkJ4oe7hos6TwdEB5p7C13ojpxQFSUuUoVMABpHqiHZOu+Bukv0SKfOX?=
 =?us-ascii?Q?vlFhsuwfiqZZuU2zQCERGukERwJ++whxW84R6FUQ96zJ2Nde4YQeDbmDHkPC?=
 =?us-ascii?Q?zAcy0gAV5/TScL2IWA4dYULUQF3olxWqdF0FZ11M1BkyVkEmzxfSYwji6zyw?=
 =?us-ascii?Q?EbjeIZ4rTkTAzA8JMYxTmcl5cgyvLcXQ494jNKrpKREyLqQIGft9N6RF6tMy?=
 =?us-ascii?Q?hNJBFOMOk4TZu5v6YJVKJylQgRS/0e3BksIbjHOyJGu1c/U61RsMdeaTzJmQ?=
 =?us-ascii?Q?kAH4/LeDoTLAjDe70xOjmxlCSwPIsWwpF619/Ck5i016ZrBf5Uzpla7VDEUq?=
 =?us-ascii?Q?S34OkQqCwdS8bQp7LWJCgs2JDoPjG0Typ4bNxNENIlEojo1Eed1Ksmi6dmh9?=
 =?us-ascii?Q?56gC5xohX9bBes9+UNadcFhFYI6dPmRTSjhYJxw9MCuP0er47bT721tVcBb0?=
 =?us-ascii?Q?rpepklat4dakUigfqNcZdF0Qp3o644oXGTAgk7CAHlVwWXN3WQVRHQeicA4F?=
 =?us-ascii?Q?84n41oXYmd1Kddvv2LwAO+wpFfvmOhxcj90Oer9vbGEK/NVK0QOuqtc461bY?=
 =?us-ascii?Q?P99IJoqJvtxddx2YHX88RaUgOnaJbw5Idj7pERcZ69NQIoQOkgW5D6krarN4?=
 =?us-ascii?Q?I2IzDBmc7rVxdqdHUWLkiEoD77jgBYjbt7ZfPQ97Crt4E/PHKQJ7zySQLw5U?=
 =?us-ascii?Q?E2INkEJIS6pyxJvOp4LmM6mrGg/BqparlPSx5cGSV1TPuA5Lvb+rgQBncv4C?=
 =?us-ascii?Q?aBBsIGtZnDxw6G/Ot3A=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0623c677-fb9e-4919-9d3d-08db5b040015
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2023 20:34:54.2194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W9p7aLxvsXifX8X7fIY3m4hy4nu3ssnE/uvi2azPGZ97Uw5c7HDCAwlF100TyIbT9drz24JxA50AtAUR0Ou2sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4395
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

> -----Original Message-----
> From: Kees Cook <keescook@chromium.org>
> Sent: Monday, May 22, 2023 4:15 PM
> To: Azeem Shaikh <azeemshaikh38@gmail.com>
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; linux-
> hardening@vger.kernel.org; amd-gfx@lists.freedesktop.org; linux-
> kernel@vger.kernel.org; David Airlie <airlied@gmail.com>; Daniel Vetter
> <daniel@ffwll.ch>; dri-devel@lists.freedesktop.org
> Subject: Re: [PATCH] drm/radeon: Replace all non-returning strlcpy with
> strscpy
>=20
> On Mon, May 22, 2023 at 03:50:32PM +0000, Azeem Shaikh wrote:
> > strlcpy() reads the entire source buffer first.
> > This read may exceed the destination size limit.
> > This is both inefficient and can lead to linear read overflows if a
> > source string is not NUL-terminated [1].
> > In an effort to remove strlcpy() completely [2], replace
> > strlcpy() here with strscpy().
> > No return values were used, so direct replacement is safe.
> >
> > [1]
> >
> https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> > [2] https://github.com/KSPP/linux/issues/89
> >
> > Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
>=20
> Reviewed-by: Kees Cook <keescook@chromium.org>
>=20

Acked-by: Alex Deucher <alexander.deucher@amd.com>

Ack to take this through whatever tree makes sense if you are trying to bat=
ch all of these up.  Otherwise, I can pick them up.

Alex
