Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1BC70CB37
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E3E10E389;
	Mon, 22 May 2023 20:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060.outbound.protection.outlook.com [40.107.95.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CAC810E387;
 Mon, 22 May 2023 20:35:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlnEHzCGH4ZO+t5Htn+0x+CXQy4lKpHC/7PkhCSfyfVpFebSbWtj+T+JtfDHNRwtC3vhyiVFfLgYbgo0nfqayo6W1IdPhOGGgWutNjsgTNy6YndFHM1Jk59eaZDw6qZ7IRGqgU4dLNUh+IrCwJjr2VxFiqseolR3F4go0QtzpEnYHzNaycIcCwFNjzl+D2adVMf4d3QHYS1yn/Ny9TvSC/cEHxINvR9kS76KjeztFq1gOXpDPCf9BvgYnLLpyvHBxU+rktLL9rpMEsOy/1L88GpJ/Ar56BFfIAlEe3KAs13REpF8I15b/es/Xvllv0a2+8Lzgoxbg8V+YpJDEsGiRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIvjw7evGQ4dvr2HCnF1F9P2M2E7jt4v7rzHukLw7KI=;
 b=IAdzvoPWv6kgESsaEh4xHPcIilsH1SXcw8WTfQW1OjGCJoTgcKSMQQsTPXpuHi4+wCyIb2MTCk2kaiiUbAsGz/VZ2YJF3KamgUKk7a/Djloidhd8Uhl4ive3AdcJBHwkumKoyZGr+Pk+nw0jp47CzqQa6FZt6tlsBI/EGiyex3l++EMFh5ifwqbAzn8k+5ZXf3zC32yg2aAsg+2SlRJY8PkvEo6g3bx5PoOWjr/36fVW2z9pqu7Qh6SDk5XLAXeUmtwkmlabvGGUerfbjroUd2ts8EuGrerk9chFHfzjzxhzMju+FQS0DVLUsh/DuGSy7gT3fTU96tMRiALYx3ipkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIvjw7evGQ4dvr2HCnF1F9P2M2E7jt4v7rzHukLw7KI=;
 b=eWqSs76JMWVIXfYf62Ai0lmoLTTkddOWw38RgLlmRUP63++yLZlB0Y2Vf6IshN8vnQ45sA4ABZ+3gwgQ7NI9kVsMEevTOrzlp9x7JIkHnzuWKfr2PD1yGlDwM4peqwbRaABMzL/EL8xtFDfp0r8LMmNZL4k6rzZ4Ijko2Y877uw=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by MW3PR12MB4395.namprd12.prod.outlook.com (2603:10b6:303:5c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 20:35:17 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::c549:4aeb:a02f:56b2]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::c549:4aeb:a02f:56b2%4]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 20:35:17 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Kees Cook <keescook@chromium.org>, Azeem Shaikh <azeemshaikh38@gmail.com>
Subject: RE: [PATCH] drm/amd/pm: Replace all non-returning strlcpy with strscpy
Thread-Topic: [PATCH] drm/amd/pm: Replace all non-returning strlcpy with
 strscpy
Thread-Index: AQHZjMV2SJSB4UBHh0iQY89Y7BirD69muvCAgAAFQ8A=
Date: Mon, 22 May 2023 20:35:17 +0000
Message-ID: <BL1PR12MB51441977ABB724A43D4B54B7F7439@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20230522155245.2336818-1-azeemshaikh38@gmail.com>
 <202305221316.038CDF6B@keescook>
In-Reply-To: <202305221316.038CDF6B@keescook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-05-22T20:35:16Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=5e51233d-87c9-4d33-88d1-2579409638ef;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-05-22T20:35:16Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: ea73eb22-777a-4517-8c44-90f9ea095896
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|MW3PR12MB4395:EE_
x-ms-office365-filtering-correlation-id: 7b7dd004-5e4c-46b5-6962-08db5b040df5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jOtHm1ruDkRcLaayIcCe8a/2yjQNYE87YnfZ6/drq0OQDwRFJe0aCu/S3MXPCcUhbzO97jaQrFo0XuphpQGbY3puxF+bSCFJsyAHCm66xEH/a8BAYR6wej8/0OxXrZ0Pz/igDko/N9XRzyL+XitVfCoWUBFdeUb+CkTpVqLkTG4aYwy3bMxmSEsqKnnCFIOkq0M/SqAgnCvOltmX1he7wvXRS8kuYJZ6Encr+go5+4W1Z636VTdJxVXoXIfMUKmqdVhk7lIRZYRDf/RHEvsJjrgEKGFaMijit5RPV164ib65yuhvT/C8ZuOatIQ+i9F7Xizo3TqFJwlGvyiLY1fjidAxw7z4hyGCur1E1Mk+ztaU6K6mjoFWZAZvZauccC78uxYYUa+/GzPfYg4zQvj9rqSzoTw1Er/jupX+0Ori8jNx9Da3rbxlOgC5aj7s2lNalCmPJIJ9oOG8UmVl3fPmTpKYr6xsmxA9lJhw2ukqqohWtFjBPdBCnPGXVPaUV5AzEwsHqJxtomgqZIVbUZbhifygbuPJ3Tbpt1c/MpfnS0yTNP32PC5wbqNhtXB+nbgIiVQvuf8AMy0DOcOcI8CPqK4I4u2E4jrg6FOBWODLB3OgIcFO7uzLV1wWCgQMg45rG+1tHlyhE0GRvnovUkiV/1TgJzRZQSUmJ72wvpZoz1w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(8936002)(8676002)(5660300002)(52536014)(53546011)(186003)(83380400001)(6506007)(9686003)(26005)(86362001)(122000001)(38100700002)(38070700005)(41300700001)(7696005)(71200400001)(33656002)(966005)(55016003)(76116006)(66556008)(66476007)(66446008)(66946007)(64756008)(316002)(4326008)(478600001)(54906003)(110136005)(2906002)(156123004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iZwf5WwmEuiho+wvhHDsQW6eneOD8gYFzZ/cXRLcP1dlsO+rjQpyZob+LApD?=
 =?us-ascii?Q?Qz9EKX/J3SXkvvahkbBzUuf45ctYu3vWaH+lZUoeH77RBRbhXyQTEzlhFyWl?=
 =?us-ascii?Q?sKiIFxPMdlWmKbn8r1uGPip0ZdY93ZKFYXNJRhRf73F0a4oqZ4yguXlGxSDW?=
 =?us-ascii?Q?m1mld8x3RO0N9PBB28dFxAMNu1l9rcI67XDUDIqpFDs+H6KedE56zAorz1Ea?=
 =?us-ascii?Q?myVKrnaSVkFYyLQ0S2KxQ0YkD2x0eniiVghjlDBQg2Basm2CZg3kt0Vj06Kc?=
 =?us-ascii?Q?tbwAxvLLnqbQB4f6B1h88fHEWddkv1AdnxxdJc9Mgr+XILoq+vXOh/HVNz/l?=
 =?us-ascii?Q?DfxKZ7TFxBGq5bRFvbwnVPfO1UuAfKbDJ5oK42oyUNaSwfcn1jaOHDE15tJh?=
 =?us-ascii?Q?deACO+9KNSaJsLgWuuHSrRAetOrKStQi/2D77OpcKh8888ZllNRq9Qwd7b9b?=
 =?us-ascii?Q?RKCUTryjsP5LKRk2wQ05ZvUT3UT3h+HMzwyVV+kfkyhXi68sjqfhU2L3IbPj?=
 =?us-ascii?Q?wsV14uXULR/foyrXbQKX6GSd/wXLGQoR7iR/yH7QhBDlUvDEpXyFxZ1SBxpV?=
 =?us-ascii?Q?KTUHNkcrFyujcbcieX9HkyNlgCw+99Y/Bu2g9acGnORhpO2x6m0fiTymDU/x?=
 =?us-ascii?Q?PYVyqxiqA2H5gDFfTGZ0Nsp65k5gnRyEjTGj6hq13D8ftBkNe0JmrxhugYeA?=
 =?us-ascii?Q?66JS9HhHLoeWEIUCDRTH0X8EspE6WQrkk/bqF9P+WedEHza0re9Hr7elwxxz?=
 =?us-ascii?Q?DLBW054aqekgGV1ab0lN9nMauShAmvv6zHJPGyrOXsfxR1WB4QgPyN3kr7Lu?=
 =?us-ascii?Q?XgYBZq6TWbMrb9+axJI31R3o7Zfglj9b+NM8K/Y0pPigi2ZSuGx6dABgatyX?=
 =?us-ascii?Q?rUHXKIff1EDbxlQDWWHYUZNz9go/8fWCO70rNy0p9SI6zo+aDjJs7c2Znbi6?=
 =?us-ascii?Q?I16fuZs99BxmEhoAVTePSdMWrmPIhKbrHI5J1u3/GWeCC/MSHrxPka59XeyP?=
 =?us-ascii?Q?QJvmv8SaD795Fh/MO6bKKEhZcEnQnK4P2JIbaBBhk2jYlFCO5MD+MW21e7ee?=
 =?us-ascii?Q?1lJr88E4DTGlbHRgxwk7wy4yPK/6pSwMbFTVFFwK2e7/H9cDG4qsXTna4RKl?=
 =?us-ascii?Q?83bqgmqi7ZM8bMXdHgHreYXvqFxKkgWS3iMjWKHbvCMEfXquAjrDW9emHRgZ?=
 =?us-ascii?Q?3SxKxVVtKwyGi0GcPHBRriQRhmZ4wyrxQQ2drT4fy8z2T6zfvGAQ3rADi17F?=
 =?us-ascii?Q?tVy11m08mzMSQ/2ZvodZajwFgfDFhCr0hfgG/tOSgqD5Ctcnn9zmptdwLIeT?=
 =?us-ascii?Q?l7bvlskYVyL0olEnj5opHWLw+0vh/6Vn0ljKUy46H6NgV6ap4bp9QHhAe9lU?=
 =?us-ascii?Q?1M1sTLLPZfFVEv2uTd1GHvSNpRM4zVsNyHQUTBG7Jqi7tKsKpc6trppVXkp6?=
 =?us-ascii?Q?Mb1R6mBJwikLC3Zc6H/8aK1Kztx/3Zmiaq1QGB9hEVtu8TWFW7SIKL0grCG7?=
 =?us-ascii?Q?eMtUaZYIMh2WkynmvrPlPnWezlkl+C3Y0f/J38p3nzFxZAC6ZYHhTHo4FuvS?=
 =?us-ascii?Q?XRAsiUJnpZgtwV8c9xg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7dd004-5e4c-46b5-6962-08db5b040df5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2023 20:35:17.5205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0fYTsxkwveEvmhZyUfSWaJxnzn9mOXVTerGe3OZzttSGV8APJAF+nSA+83X0iahebXMih41b37yzu+V1H1kLRQ==
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
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, "Quan,
 Evan" <Evan.Quan@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

> -----Original Message-----
> From: Kees Cook <keescook@chromium.org>
> Sent: Monday, May 22, 2023 4:16 PM
> To: Azeem Shaikh <azeemshaikh38@gmail.com>
> Cc: Quan, Evan <Evan.Quan@amd.com>; linux-hardening@vger.kernel.org;
> amd-gfx@lists.freedesktop.org; linux-kernel@vger.kernel.org; Deucher,
> Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; dri-
> devel@lists.freedesktop.org
> Subject: Re: [PATCH] drm/amd/pm: Replace all non-returning strlcpy with
> strscpy
>=20
> On Mon, May 22, 2023 at 03:52:45PM +0000, Azeem Shaikh wrote:
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
