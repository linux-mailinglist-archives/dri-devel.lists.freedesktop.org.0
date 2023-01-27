Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B5E67E24B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 11:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0DA10E44F;
	Fri, 27 Jan 2023 10:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2072.outbound.protection.outlook.com [40.107.6.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C2910E44F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 10:54:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZF2QBOGJTVKqw1u/qXfeDAXhPZdFINnEQYXrzFLMrdqH0dbTa6o77KvXKePRxH9lzPr2OEn1dppTckoy3oG+Eq+pe5azF7hDVLUGiKn5YRO5fsuRcVCtiHL4Yre2NHvUZSXgv77eQNxjH2qMrof5ZCDISGY+LvarNX6Mia3X3/LqChklaKqmLIhIryYkTt7SX36pi6f1gqSGTNYU+B6VGyJrmoZIbWCD4hSA37Xhudd1CKtwFmSWjFDhQg5FM7DJt/38QMJqcRmR3ulH728QRAXxokN/7S8FsYbASHMemzp4CLvihRfu2CSLSCHGXsrXHrwrdRyStoSWAfUHqPrHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PxSxPtQNYqRvUlTC492nvwU15okpEDCMSIhmYinEPw=;
 b=SP/pU/29bQ+Wf1Cx9gEcqi+zxg5kojKjdvdboMUDsJyaE9V35wmP64gJ8DjM6cUvSL8huttx0E7qugV00JjM+vzebyiSGV8Fa/ydQwdamTDs+Ws4bo5E7wUw2Byz0Fe1PhnUICgc1YVn0Ok+ahd5O20biDVUIatUtY1aOI2PGquyHGDI6plG+Qjt5XhkQwTM2N1Fa1PDMpRh0bXfUGlCiU81mRucfcUQB1Zn4T+ZK4OqgjRIFihmPRso3cYYInqJmvBfr80UMQXWdHBkorObP3sMqHJjguYSJ0pMtStGIzJ09e6cgXFUb3w0QS62sniobSau7xGCaMe7yFVSNAwn3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PxSxPtQNYqRvUlTC492nvwU15okpEDCMSIhmYinEPw=;
 b=lcypgS+fiV7Dbomlr4hicY+FfnHl5/Dy/Um08jMBWFJ4/r97uvf3kdqYmOprJsuweasNOax5pOxpKJloNQyRCqbg8U3+vL+pbNc7ppW48mIIgFxYMk0yD5sTLnDhJfmyQhLUolbFVUqZtURnlfBHvTbCo5T7T9rzhlVHPFzYAYM=
Received: from DB8PR04MB6746.eurprd04.prod.outlook.com (2603:10a6:10:10f::23)
 by AM9PR04MB7571.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 10:54:05 +0000
Received: from DB8PR04MB6746.eurprd04.prod.outlook.com
 ([fe80::5dd7:ab1:daf0:6955]) by DB8PR04MB6746.eurprd04.prod.outlook.com
 ([fe80::5dd7:ab1:daf0:6955%5]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 10:54:05 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: "fredgc@google.com" <fredgc@google.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "afd@ti.com" <afd@ti.com>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, Peter Griffin <peter.griffin@linaro.org>,
 "sumit.garg@linaro.org" <sumit.garg@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "etienne.carriere@linaro.org" <etienne.carriere@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Subject: Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm from a dmabuf
 file descriptor
Thread-Topic: [PATCH v2 1/1] tee: new ioctl to a register tee_shm from a
 dmabuf file descriptor
Thread-Index: AQHZMj2sccQANWLIb0CkERLUIPuRuQ==
Date: Fri, 27 Jan 2023 10:54:05 +0000
Message-ID: <30534fadb8172088eddef46ae71d87c167cbf32e.camel@nxp.com>
References: <20220812143055.12938-1-olivier.masse@nxp.com>
 <20220812143055.12938-2-olivier.masse@nxp.com>
In-Reply-To: <20220812143055.12938-2-olivier.masse@nxp.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR04MB6746:EE_|AM9PR04MB7571:EE_
x-ms-office365-filtering-correlation-id: f08da63b-ab02-4c3a-c22b-08db0054cedf
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JoD1P52V3SbonIANU/fEOeZJ+5fy/eNur86kbbBy1p/8XI1E9DNwUPrvKA8nA1LahElFlmqKot/ConbzOTDejJ4w3l38ICKgbEwaiBFBWv1qFH3MsoNv3y2SdGySb0CKKAXBxycIW/nB+Zzjk/SHEiCHuZw6Iplw9j/s1FM2n8CvywIIY4BeDuW3ngF9PmyujDry1VIFpag1lsUf7CpWoPWZ63RPrjJ2qSnQsXDlsysF4zV5WLk37ojDhoZmQ4OchXPjl3Jhw2Q9sqpDMw5PU2qm5yxNyQerDbSuV4CjrXeC1dAVfNdEZRuE62P98K2HyAUIRfl1/tB5NmKuheBMQ5hXi2/qwZgMkaot3PP56vOmykHtNB5/2PgrgwDSIoWD0FWQgXqnKSeNbJmlAgp53A9IOkKDr9jX+2jItCrPBYPJGs3x8+ELcHolHTye5F9+h8RAvgnk9ExRqegNRNYvTaUn8kTJX2BcNhUaGF49J9lN6Eoeh4qepKNR9taKGiKSuXASrYth4V+ufwFn2VtwChWtJClpsCNMzhNzaiA70rWpNp86hdq6H1QwPKuApMvBOOqak/82/HPBRC8x082kEUPToYUPr+KZwpyLywM/sBhoriYcPg1ySsVB1Yb+lmfcAfQWAT9D4zqQCo5XZl7oLn74RlTki60C7mcLDSpHf34bp0MYVsqCdpbf8fgUnuLVOfGrN75Ka1JrS11gShFJirVdBoZiiMGQo1XoGaKZg5VYTNE1whFGHr8R0xlJsQHY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB6746.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199018)(41300700001)(38070700005)(921005)(6512007)(26005)(186003)(8676002)(66946007)(8936002)(76116006)(66476007)(66446008)(66556008)(83380400001)(5660300002)(64756008)(91956017)(6506007)(7416002)(30864003)(44832011)(966005)(478600001)(6486002)(36756003)(2616005)(110136005)(54906003)(122000001)(38100700002)(86362001)(71200400001)(4326008)(66574015)(2906002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?WGUVXIKc3SPDtfavmxH6hNjHZmFSciqj4D/uC8J4nIDywFOxl2ON3DcfS?=
 =?iso-8859-15?Q?+vm2ygGEqNKLaR5I2QcY9fbQuvOVTjKRiA23Xx/XosE8e0bGw43mia0El?=
 =?iso-8859-15?Q?M2NSaHfFasWBzGbCJBQ1oDbHD9PJXjq0POcJSTYFO5983Pc09kE07OQpZ?=
 =?iso-8859-15?Q?5TUWzP873MosSSy2Psl2rqA1A/ypsuoie+iGkr/9jIx2ukR5PBdDLziux?=
 =?iso-8859-15?Q?RGWS8NzgmZzbvK/O7zJzj83EAzMCcUa4Q9Tj6O8g824wZrf0HCVYdqh67?=
 =?iso-8859-15?Q?l3a85HQn8JaHF/tKJTb+f7k5faFgwZifWOk0bS6IX0wxfLiHFsCovdawW?=
 =?iso-8859-15?Q?Uow6kX1F31DrVr79UX40c5tZelC7nnCJ7OR2GpzuLdgDGoA8qj1IoXnyH?=
 =?iso-8859-15?Q?w5/dghmM+cbANWTNHm1QmBpKYZ7ktKo9i4GTskGmfRDmstFM4hoSRHDBl?=
 =?iso-8859-15?Q?F6/O8kRGZ2WqUOLP00kv2Jw+7hWmdV8bPYUUFfOlTIcDSrKP1hQcxBA0n?=
 =?iso-8859-15?Q?eoBYZeeGWdsLYTVLcY1Ul9vN/bo8lQyemnPvZUtIm86QcYXjqjPtVD8nu?=
 =?iso-8859-15?Q?30NFfpHqtpds/DDXC1P3IfipEQ+AiJzmBejjaIxhBffDAdHBf/rKUdZU9?=
 =?iso-8859-15?Q?baKNenVcQMmHC1YEtDXiJvlFZeyWVfJGrr2tS1Y828tmQ92QlTXBNWozP?=
 =?iso-8859-15?Q?xDUpPSKOeT06iThBCfH1s3flCIP/l2LeQ8hsdzS9nG2XwZ2PkkhAp+Ghp?=
 =?iso-8859-15?Q?UEI9DOUFCblou0qkEdKDDvsYHg2siLnFTr+ZAX1+2e29ZmnWPKR5BdO/7?=
 =?iso-8859-15?Q?FI4chVTSY9jek7Fci05uh4/mYD9MMmu9F1nk9vR7ZDIlZhFmPYcNbB6s1?=
 =?iso-8859-15?Q?NKrXvtNDTf4gfVp7sxvno5YPzw29gFcxeqqV4uoQTpY2XJNzhtAzMtHUh?=
 =?iso-8859-15?Q?2IJ9f/jVlZLhMSUSwN8y7lA3e5efRs2UhI0tJSb8d4bILYmSANsmC5sbl?=
 =?iso-8859-15?Q?ah+PBpAshUDFJUgTjKy1vJCy0O9875VMIGOcCpm41kcnOSk3QG0lkpA7m?=
 =?iso-8859-15?Q?7Ckn+nz5l1qZJNm9Jlq/eyX6BIVbnOdyaahJDbdZVBAodNlxd3Uy5JvQM?=
 =?iso-8859-15?Q?usXFMIntUPPCbip8tqPNM4h+rx8p/pImLYn4OB8tLkUgO6NdghPUsAGng?=
 =?iso-8859-15?Q?58dPIYrnt+RieCeM8u/ZvgRsTzUFWok/WkzLI+Bfz/naHpiYVQ2grU1ud?=
 =?iso-8859-15?Q?at60gfXiRWBlH/uYwIHmsF33RPcxWA2AhCeW97o+h0FgR/Gvd4fM2dCuB?=
 =?iso-8859-15?Q?RIDRw0sNCnM7smiumEyu5Xl1zmK1hwrDZouoqTDpRjn5oRWAZNdbh5kSt?=
 =?iso-8859-15?Q?c+5I81AVPRWyFjgzXDEDVCHIbPEFRefLL9OeVYyPz5C6dihzzXdsD0HNB?=
 =?iso-8859-15?Q?XspIl/S9Df/T9UqO92Qy08m4vkTMiSbWEMl8WzKU3UHZ8r7HZcxKzMMt2?=
 =?iso-8859-15?Q?pGCtNn19VO7HzvoFbPcqKq4rOkoZlPddX44SGTLr2dCG0Z+Prv1sRfL9o?=
 =?iso-8859-15?Q?pnHRFKp+ppmA5/LrISCMfJX2H07FkOG7gYBQN2WP1Sb9lWQieVoOrqkKk?=
 =?iso-8859-15?Q?9FZfeX9iiirE9syQdfrUMhkAjt47RwThc2RiMNn/VA8KadzzgxOreeo8s?=
 =?iso-8859-15?Q?ljhkqSTNJZOM9Y84gil8YXn6bg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <289767F64103C5409A01384534674F9E@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6746.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f08da63b-ab02-4c3a-c22b-08db0054cedf
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2023 10:54:05.0768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QGa8wpHspQYL/51IOxw+XHGxpTo2Z2Mp7RB2mzvciBfrOgM4/rRVU0I7GO8e7d/p0f0Kq+GVKyiHnWOFVquJFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7571
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
Cc: =?iso-8859-15?Q?Cl=E9ment_Faure?= <clement.faure@nxp.com>,
 Cyrille Fleury <cyrille.fleury@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Joakim,
Hi Etienne,

Let me bring back this pull request for OPTEE Linux driver.

Last feedback was from Christian K=F6nig and Sumit Garg.
From Christian:
> Just two comments:
>=20
> 1. Dmitry is working on a change which renames some functions and
> makes
> it mandatory to call them with the dma_resv lock held.
>=20
> Depending on how you want to upstream this change you will certainly
> run
> into conflicts with that.

Is there any update on these changes ?

>=20
> 2. Would it be possible to do this dynamically? In other words does
> the
> tee driver has a concept of buffers moving around?

We do not support dynamic secure memory heap.

From Sumit:
> What limits you to extend this feature to non-contiguous memory
> buffers? I believe that should be possible with OP-TEE dynamic shared
> memory which gives you the granularity to register a list of pages.

Our solution use a fixed protected reserved memory region and do not
rely on a dynamic protection managed in secure.

The scope of this implementation rely on a static memory region handled
by a specific DMA Heap type.

Best regards,
Olivier MASSE


On ven., 2022-08-12 at 16:30 +0200, Olivier Masse wrote:
> From: Etienne Carriere <etienne.carriere@linaro.org>
>=20
> This change allows userland to create a tee_shm object that refers
> to a dmabuf reference.
>=20
> Userland provides a dmabuf file descriptor as buffer reference.
> The created tee_shm object exported as a brand new dmabuf reference
> used to provide a clean fd to userland. Userland shall closed this
> new
> fd to release the tee_shm object resources. The initial dmabuf
> resources
> are tracked independently through original dmabuf file descriptor.
>=20
> Once the buffer is registered and until it is released, TEE driver
> keeps a refcount on the registered dmabuf structure.
>=20
> This change only support dmabuf references that relates to physically
> contiguous memory buffers.
>=20
> New tee_shm flag to identify tee_shm objects built from a registered
> dmabuf: TEE_SHM_EXT_DMA_BUF. Such tee_shm structures are flagged with
> TEE_SHM_EXT_DMA_BUF.
>=20
> Co-Developed-by: Etienne Carriere <etienne.carriere@linaro.org>
> Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> Reported-by: kernel test robot <lkp@intel.com>
> From: https://github.com/linaro-swg/linux.git
> (cherry picked from commit 41e21e5c405530590dc2dd10b2a8dbe64589840f)
> ---
>  drivers/tee/tee_core.c   | 38 +++++++++++++++
>  drivers/tee/tee_shm.c    | 99
> +++++++++++++++++++++++++++++++++++++++-
>  include/linux/tee_drv.h  | 11 +++++
>  include/uapi/linux/tee.h | 29 ++++++++++++
>  4 files changed, 175 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 8aa1a4836b92..7c45cbf85eb9 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -355,6 +355,42 @@ tee_ioctl_shm_register(struct tee_context *ctx,
>  	return ret;
>  }
> =20
> +static int tee_ioctl_shm_register_fd(struct tee_context *ctx,
> +				     struct
> tee_ioctl_shm_register_fd_data __user *udata)
> +{
> +	struct tee_ioctl_shm_register_fd_data data;
> +	struct tee_shm *shm;
> +	long ret;
> +
> +	if (copy_from_user(&data, udata, sizeof(data)))
> +		return -EFAULT;
> +
> +	/* Currently no input flags are supported */
> +	if (data.flags)
> +		return -EINVAL;
> +
> +	shm =3D tee_shm_register_fd(ctx, data.fd);
> +	if (IS_ERR(shm))
> +		return -EINVAL;
> +
> +	data.id =3D shm->id;
> +	data.flags =3D shm->flags;
> +	data.size =3D shm->size;
> +
> +	if (copy_to_user(udata, &data, sizeof(data)))
> +		ret =3D -EFAULT;
> +	else
> +		ret =3D tee_shm_get_fd(shm);
> +
> +	/*
> +	 * When user space closes the file descriptor the shared memory
> +	 * should be freed or if tee_shm_get_fd() failed then it will
> +	 * be freed immediately.
> +	 */
> +	tee_shm_put(shm);
> +	return ret;
> +}
> +
>  static int params_from_user(struct tee_context *ctx, struct
> tee_param *params,
>  			    size_t num_params,
>  			    struct tee_ioctl_param __user *uparams)
> @@ -829,6 +865,8 @@ static long tee_ioctl(struct file *filp, unsigned
> int cmd, unsigned long arg)
>  		return tee_ioctl_shm_alloc(ctx, uarg);
>  	case TEE_IOC_SHM_REGISTER:
>  		return tee_ioctl_shm_register(ctx, uarg);
> +	case TEE_IOC_SHM_REGISTER_FD:
> +		return tee_ioctl_shm_register_fd(ctx, uarg);
>  	case TEE_IOC_OPEN_SESSION:
>  		return tee_ioctl_open_session(ctx, uarg);
>  	case TEE_IOC_INVOKE:
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 836872467dc6..55a3fbbb022e 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -4,6 +4,7 @@
>   */
>  #include <linux/anon_inodes.h>
>  #include <linux/device.h>
> +#include <linux/dma-buf.h>
>  #include <linux/idr.h>
>  #include <linux/mm.h>
>  #include <linux/sched.h>
> @@ -12,6 +13,14 @@
>  #include <linux/uio.h>
>  #include "tee_private.h"
> =20
> +/* extra references appended to shm object for registered shared
> memory */
> +struct tee_shm_dmabuf_ref {
> +     struct tee_shm shm;
> +     struct dma_buf *dmabuf;
> +     struct dma_buf_attachment *attach;
> +     struct sg_table *sgt;
> +};
> +
>  static void shm_put_kernel_pages(struct page **pages, size_t
> page_count)
>  {
>  	size_t n;
> @@ -71,7 +80,16 @@ static void release_registered_pages(struct
> tee_shm *shm)
> =20
>  static void tee_shm_release(struct tee_device *teedev, struct
> tee_shm *shm)
>  {
> -	if (shm->flags & TEE_SHM_POOL) {
> +	if (shm->flags & TEE_SHM_EXT_DMA_BUF) {
> +		struct tee_shm_dmabuf_ref *ref;
> +
> +		ref =3D container_of(shm, struct tee_shm_dmabuf_ref,
> shm);
> +		dma_buf_unmap_attachment(ref->attach, ref->sgt,
> +					 DMA_BIDIRECTIONAL);
> +
> +		dma_buf_detach(ref->dmabuf, ref->attach);
> +		dma_buf_put(ref->dmabuf);
> +	} else if (shm->flags & TEE_SHM_POOL) {
>  		teedev->pool->ops->free(teedev->pool, shm);
>  	} else if (shm->flags & TEE_SHM_DYNAMIC) {
>  		int rc =3D teedev->desc->ops->shm_unregister(shm->ctx,
> shm);
> @@ -195,7 +213,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct
> tee_context *ctx, size_t size)
>   * tee_client_invoke_func(). The memory allocated is later freed
> with a
>   * call to tee_shm_free().
>   *
> - * @returns a pointer to 'struct tee_shm'
> + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on
> failure
>   */
>  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx,
> size_t size)
>  {
> @@ -229,6 +247,83 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct
> tee_context *ctx, size_t size)
>  }
>  EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> =20
> +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd)
> +{
> +	struct tee_shm_dmabuf_ref *ref;
> +	int rc;
> +
> +	if (!tee_device_get(ctx->teedev))
> +		return ERR_PTR(-EINVAL);
> +
> +	teedev_ctx_get(ctx);
> +
> +	ref =3D kzalloc(sizeof(*ref), GFP_KERNEL);
> +	if (!ref) {
> +		rc =3D -ENOMEM;
> +		goto err_put_tee;
> +	}
> +
> +	refcount_set(&ref->shm.refcount, 1);
> +	ref->shm.ctx =3D ctx;
> +	ref->shm.id =3D -1;
> +
> +	ref->dmabuf =3D dma_buf_get(fd);
> +	if (IS_ERR(ref->dmabuf)) {
> +		rc =3D PTR_ERR(ref->dmabuf);
> +		goto err_put_dmabuf;
> +	}
> +
> +	ref->attach =3D dma_buf_attach(ref->dmabuf, &ref->shm.ctx-
> >teedev->dev);
> +	if (IS_ERR(ref->attach)) {
> +		rc =3D PTR_ERR(ref->attach);
> +		goto err_detach;
> +	}
> +
> +	ref->sgt =3D dma_buf_map_attachment(ref->attach,
> DMA_BIDIRECTIONAL);
> +	if (IS_ERR(ref->sgt)) {
> +		rc =3D PTR_ERR(ref->sgt);
> +		goto err_unmap_attachement;
> +	}
> +
> +	if (sg_nents(ref->sgt->sgl) !=3D 1) {
> +		rc =3D PTR_ERR(ref->sgt->sgl);
> +		goto err_unmap_attachement;
> +	}
> +
> +	ref->shm.paddr =3D sg_dma_address(ref->sgt->sgl);
> +	ref->shm.size =3D sg_dma_len(ref->sgt->sgl);
> +	ref->shm.flags =3D TEE_SHM_EXT_DMA_BUF;
> +
> +	mutex_lock(&ref->shm.ctx->teedev->mutex);
> +	ref->shm.id =3D idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm,
> +				1, 0, GFP_KERNEL);
> +	mutex_unlock(&ref->shm.ctx->teedev->mutex);
> +	if (ref->shm.id < 0) {
> +		rc =3D ref->shm.id;
> +		goto err_idr_remove;
> +	}
> +
> +	return &ref->shm;
> +
> +err_idr_remove:
> +	mutex_lock(&ctx->teedev->mutex);
> +	idr_remove(&ctx->teedev->idr, ref->shm.id);
> +	mutex_unlock(&ctx->teedev->mutex);
> +err_unmap_attachement:
> +	dma_buf_unmap_attachment(ref->attach, ref->sgt,
> DMA_BIDIRECTIONAL);
> +err_detach:
> +	dma_buf_detach(ref->dmabuf, ref->attach);
> +err_put_dmabuf:
> +	dma_buf_put(ref->dmabuf);
> +	kfree(ref);
> +err_put_tee:
> +	teedev_ctx_put(ctx);
> +	tee_device_put(ctx->teedev);
> +
> +	return ERR_PTR(rc);
> +}
> +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
> +
>  static struct tee_shm *
>  register_shm_helper(struct tee_context *ctx, unsigned long addr,
>  		    size_t length, u32 flags, int id)
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index 911cad324acc..40ddd5376c2d 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -25,6 +25,7 @@
>  #define TEE_SHM_USER_MAPPED	BIT(1)  /* Memory mapped in user space
> */
>  #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool
> */
>  #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver
> */
> +#define TEE_SHM_EXT_DMA_BUF     BIT(4)  /* Memory with dma-buf
> handle */
> =20
>  struct device;
>  struct tee_device;
> @@ -276,6 +277,16 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct
> tee_context *ctx, size_t size);
>  struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
>  					    void *addr, size_t length);
> =20
> +/**
> + * tee_shm_register_fd() - Register shared memory from file
> descriptor
> + *
> + * @ctx:	Context that allocates the shared memory
> + * @fd:		Shared memory file descriptor reference
> + *
> + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on
> failure
> + */
> +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int
> fd);
> +
>  /**
>   * tee_shm_is_dynamic() - Check if shared memory object is of the
> dynamic kind
>   * @shm:	Shared memory handle
> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> index 25a6c534beb1..baf3cd7cfdac 100644
> --- a/include/uapi/linux/tee.h
> +++ b/include/uapi/linux/tee.h
> @@ -121,6 +121,35 @@ struct tee_ioctl_shm_alloc_data {
>  #define TEE_IOC_SHM_ALLOC	_IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 1,
> \
>  				     struct tee_ioctl_shm_alloc_data)
> =20
> +/**
> + * struct tee_ioctl_shm_register_fd_data - Shared memory registering
> argument
> + * @fd:		[in] File descriptor identifying the shared
> memory
> + * @size:	[out] Size of shared memory to allocate
> + * @flags:	[in] Flags to/from allocation.
> + * @id:		[out] Identifier of the shared memory
> + *
> + * The flags field should currently be zero as input. Updated by the
> call
> + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> + * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD
> below.
> + */
> +struct tee_ioctl_shm_register_fd_data {
> +	__s64 fd;
> +	__u64 size;
> +	__u32 flags;
> +	__s32 id;
> +} __attribute__ ((aligned (8)));
> +
> +/**
> + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file
> descriptor
> + *
> + * Returns a file descriptor on success or < 0 on failure
> + *
> + * The returned file descriptor refers to the shared memory object
> in kernel
> + * land. The shared memory is freed when the descriptor is closed.
> + */
> +#define TEE_IOC_SHM_REGISTER_FD	_IOWR(TEE_IOC_MAGIC,
> TEE_IOC_BASE + 8, \
> +				     struct
> tee_ioctl_shm_register_fd_data)
> +
>  /**
>   * struct tee_ioctl_buf_data - Variable sized buffer
>   * @buf_ptr:	[in] A __user pointer to a buffer
