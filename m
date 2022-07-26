Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DA1581668
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 17:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3437F90DD5;
	Tue, 26 Jul 2022 15:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80078.outbound.protection.outlook.com [40.107.8.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC38B90DF6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 15:30:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4x7bECI6LUZmTP0Szgsz3bIQ2x3fAh4TrtX/UKNM1ZFpurCULb7S0B1Nk3TAV45LhDrS20CvaYl7Eii+tBOg10AUZmvZr6NMreTy8BSXHRdsGFtwoIgWwDrAUv8nvJkqYfZ0DCb2pUAlpNVwS1nB9RxiuFavIg+KDjgqT8QOGJJmNynBjCF7OElUhmPDmvgaN/l77QUh1chjF7oLDyXitSSw75ezmdaxNrjCEVbuTuR2G8L18kiJ6qY+4qDLv56dfAs7nJQpN6f9KNWO1JPI6hQ0yGcHnwlSAHocPje3XTNCLo/JqZs5jdaeL+Hm5ij1/XNBjp0sPVwVsMswjLuJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwW+QCwyMngcYXu7TfPbpM/MAKTlqJT1pdtIsrZxgY8=;
 b=DW6x4JvmDlq6595rJfjjbFzWnkfinewNROcVIXe2AEaKqjZSCmbD7995iGlVDMGZlNDRYKVVEauxTQVaULJwn82jFxuNVonF//LzI1o/FBVd36x0zvm7lP98lna7BBaJX2/6QqqP5g8JHlDTcX6DhfhkD25iMpPuaST6KUHAhx98WNl8YDOXWrKSz6bKhxxwSdUJbkR6ovQ+3W2w87ZRKDTzuFADvs6wmxau1ZTzTusTL6j4LE7nqEhtDABk2L7NxkA0aLqw0227uKeF4ZxQJKgCjbdxounWVQae4r3jr6RTtxyaopjr5N8PSLS0F4SbUA6e7ADvEckPSsWZD2//Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwW+QCwyMngcYXu7TfPbpM/MAKTlqJT1pdtIsrZxgY8=;
 b=gPDry/tb3TEbhtBtArPopq72+TZP6oSDo0AXisQZj5O/00DhqOeSda8lfumy4KDjBP8r5hP7lCcwcKjSYZ/65yUnkyZyLY0Cb9lnEQ0mKqsz3Upz2wYkjJdyMkyWwzg209CNiqPVnibI0v/rVJ7HCmFzn9cvfJLzDshe+Dz4j6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR0402MB2926.eurprd04.prod.outlook.com (2603:10a6:800:b0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 15:29:58 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9%5]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 15:29:58 +0000
Message-ID: <22f34394e6f12c633594572a64d5c6bb40ff4476.camel@oss.nxp.com>
Subject: Re: [PATCH] drm: lcdif: change burst size to 256B
From: Liu Ying <victor.liu@oss.nxp.com>
To: Marek Vasut <marex@denx.de>, Marco Felsch <m.felsch@pengutronix.de>, 
 stefan@agner.ch, airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org
Date: Tue, 26 Jul 2022 23:29:46 +0800
In-Reply-To: <28dc6dfd-08a2-a207-4644-074fb7fee2f1@denx.de>
References: <20220726094302.2859456-1-m.felsch@pengutronix.de>
 <28dc6dfd-08a2-a207-4644-074fb7fee2f1@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0181.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cf325b1-8f18-447a-cd05-08da6f1bb291
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2926:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6VLVytAhGkxWtIcXAF6HI+jAmeJP4eB4QkOKnW825sRWegGpKXd28dunkaabk8lmeiwzc29yxzmttDLhWOG8rUln4N9MZmUMs2YhTzhodfPdHijInj9lDFiMtR5z1/0/b12VfFPIWZFYgijv7ZY1y3mMAGKm4HjPDQbHf8jHJdTTdxEJL9P4eM9N8QGRptQ4H5tmtkeBcseZsECq7aibqIL8BnfFCqhcz/8bEKLEpG/Gf0LiNENHQQzLbMqidsP54GkJY9mVrBS2MEpQ+3RtTH8bDbbJHGG4sz8i9WwLaZ4iSUUiUflfwdamCecOfCXgmZUJ9MTC4KjVnR+2DfDXY71E+9r1haAtBUDZz61YxsJpI7SIkKHkjG+TowL2DAaJxlgFe9vQ3BehuHNd0B2XDH+sYzDajqz5DIZh30teVzsHYZStyu3rwJBlBA+kWOeT2nazSDC+SdH3hTrwBn2fRoKSNxWmgUrjgTlS6q+FMyvFu9PzM19fCSw3cV5sXjEhld97TLPUwRwYLU/ZW5NjoGesgxoa3w1YMle1IffXoDV4ayCSMmAmYGXeom1FxVm3IfU+x4Bpjr6XDSC+2wqAXpsVup+uLPMoa3VMXtSOv66Ip0PsFsN39pEWeXuq69+4YltWugysBbWxHdmayGmfR4S/XqAB4k4mCZjcGoSnzP9C2kPI4rtov66m1VMyWjOAhKHFSc7MyCcjk1wIzy5er02wfxoqlvuR0AqBpHFGoZ0B1jUT+njcMwOVfjR22Mj9vBtqOk9n37T0TeuKJ40D4GMbuO+o1ua9vm9XdrbQYp+IkGcL+vZmBvP1caeHhQwn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(316002)(5660300002)(110136005)(83380400001)(86362001)(38350700002)(38100700002)(4326008)(8676002)(52116002)(186003)(66946007)(66476007)(2616005)(66556008)(478600001)(8936002)(6486002)(26005)(41300700001)(6512007)(2906002)(6506007)(53546011)(6666004)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEZ6VEJKUzN4OTNMNFNUQnJqNkpPSC83alZBeTBLVjZQclhRU3FiRU45dGlZ?=
 =?utf-8?B?N25TQ0ZjdENJaStsVDNsMk9LYjNXTHRLcGJVZEZhUG9zQmVPK3B6ZjJ3VU9z?=
 =?utf-8?B?bXdYU1BkL2xlem9rMkdVU3ZET1pBeGF0bjZOSDZVOSsvWGhxS0xFd2V2OWtM?=
 =?utf-8?B?d0RhamFUYUJ4aGlRUEtEbUFTemtmSkJteTFSU3lqZUl5dnRPV1lIWGNwZW5N?=
 =?utf-8?B?a3ZzWVQwTnMyOExvVkEvNU1ENytqOEZmdlVOaHVqVnUvdWJiUjdQWG1qRS9j?=
 =?utf-8?B?QXNGRldnTmVTWEZ2UFJxM1FTUGhiK1FCZ1lPOVlUbk40UTY3NlczMWpHcDVP?=
 =?utf-8?B?RSsrcjFtMzZQd2ZGTmtlb1dlakVQRktPeHRpUDgwRDh1ckJEMEJvQlZRdldu?=
 =?utf-8?B?RXFXZXd5djJVOHlmelhvWUxmVGJReFRtdERyRkI5c2tsZVRuUXdMN0ZCRGtE?=
 =?utf-8?B?YjhXUE5aRFBwZGZYUDhESnV0T3Y0b2ZlMU5TM3FOWXIvNGhVZ3RFMk41VWl5?=
 =?utf-8?B?elM4TDBObDhxMmQ0R2lzV0UrS21EYmVXQ2hYcnVZejlMOUJmZExtaGkrS1ZP?=
 =?utf-8?B?M3U2VjE5N1gvZE1UTURMNVpET0lLYzM4Q3VrTVFGeTFQWElXU1dBSGhlNHFM?=
 =?utf-8?B?TTZoaEpyNGZtQmZRK3gzUWx4RW9pakVvSXZ5WHYxOXBPNFVVR0UralNNRklr?=
 =?utf-8?B?Q2puV2tBaVd6b2h4YUxFMFdUdEFEVStwRmhybUdHR3JrRnRSSHlvL2pxeEdu?=
 =?utf-8?B?RlVybXdKdE9sNUM3L2RKalRaMEpXQmx5VTBMUzNGaENZYTRVTGNyeHNHcUtQ?=
 =?utf-8?B?TGxkZ3dWK1lhc05hdW1Sb016dC9rVkFmY1UyODZQZHZaUFVwUXJCRjlTUE1k?=
 =?utf-8?B?YXg1NDRpT2ZXUVEwc1NBMGRPeXVqaWc4bVhlelpBTGEzcVNaekFVQkR0N3BO?=
 =?utf-8?B?VWRyWnFHd2RzVXgzQ3k2Q3NJZGJGMkQrNzlEL3NBQXp0ZzJRbERsSDU1czlm?=
 =?utf-8?B?NmtDeFdIMTZBRUovbzV2eWRFdlBlWS9EblJvdDYxanJ3ejgxY1BtZnZVSTdz?=
 =?utf-8?B?SkVQZUl3VHltYTNFUk9xZWR5QVdraFJHUVlKOTJSVy9xUm01ZlJCR01ma3pO?=
 =?utf-8?B?dTNEdXdSanVCOEtETzN3VS9GNTIxWW5zTG1BbVZHSVNlbFhwRHZVMHFTQ3Fa?=
 =?utf-8?B?MXpZVWVsSEZReWFXVVczaHVBbmczQTdNNEhDV0ZDL2U2N3psY29QdEo3MnNJ?=
 =?utf-8?B?OS9FcVR3Y0hvUHA5S3ZlRWNPRE50TThOblhxLzVwSWVaSG5HbHFra2tZY2FI?=
 =?utf-8?B?OEtNWHVHTVRteGdieUZnSEF4TFFvY1labnEwbzVIWlhOczE5QVdWeHIwZkpH?=
 =?utf-8?B?MXpmMFFsazd4eVRJblNIN3VDK2VVa2lpL1NaM1ZJUnRoTmloaDliYnAxcm1n?=
 =?utf-8?B?c0dZRHU5L1JlNlFwWlNqcitTWWp6VVRMemVEdlZSMkVIZHA3MXdGNFM4R3hj?=
 =?utf-8?B?MVNnTi92WmhDN2ZDVjdwSVFBVWswQ2tlQlIxVlBNRC80TmpBUVkrV1U5SHMw?=
 =?utf-8?B?QXFTNWswQ21BdzlvWG12QUJjVGREK2VseFNCWFBUYlY5WEwvSnNQZjNWZEp4?=
 =?utf-8?B?b093TUQvKzZueDY5bHR3ZDNkUkRYTGhWbFVmc3lZR3lhdzg3NlJIeXJqREJC?=
 =?utf-8?B?YjhieTAzNUtGVWFGTE5lWjUzVkRjdmZVMkgrNzFqMFJhU3RvSndvQmJNWnVt?=
 =?utf-8?B?TXE3cjJnMWp3WEo3OWVqSE9WT1NQLzZhaW4zQ1l4Q3F0TkxiajF2OTY0ckp3?=
 =?utf-8?B?YXlaRFNtRGk3aC9KUkxwMG1YQkRlcjU4Ry9iL0o1RFdSTWxiUFRNbk9LYTBs?=
 =?utf-8?B?ZGJodlRMbUIxZDdseEVuZ1c2RDZJWEZ3aWpSSzNJdk5CbHJheUJVS0pOTFZv?=
 =?utf-8?B?MGxZV1FTZVNLb3BmMnNTbXBobGFhWC9VaElRa0NNVldCUlROU3B2U21EUkNS?=
 =?utf-8?B?WFRZeURlZTVoSURJUVQydmhRYWZnOXB2Smo3Z2txaGQvR1F0RDNuQkxSMVZD?=
 =?utf-8?B?NDR6YjNPQTZtTkdFNnRocWxjTmdEMVdYTWR6Tm5IOGlzcUxmYXYyZTErSzB3?=
 =?utf-8?Q?QRgUF8wDBpm/i6GWq13FvTlqN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf325b1-8f18-447a-cd05-08da6f1bb291
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 15:29:57.8920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eF8JYI2lV/uGK+kGZQKUoRwg6fcEzkbrWZuhEFos54oGSRCVjHaTa828fOym4kviEZq6GqsUFCFOdhwrAONaRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2926
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
Cc: dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@pengutronix.de,
 jian.li@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-07-26 at 16:19 +0200, Marek Vasut wrote:
> On 7/26/22 11:43, Marco Felsch wrote:
> > FIFO underruns are seen if a AXI bus master with a higher priority
> > do a
> > lot of memory access. Increase the burst size to 256B to avoid such
> > underruns and to improve the memory access efficiency.
> 
> Sigh, this again ...
> 
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > index 1bec1279c8b5..1f22ea5896d5 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > @@ -143,8 +143,20 @@ static void lcdif_set_mode(struct
> > lcdif_drm_private *lcdif, u32 bus_flags)
> >   	       CTRLDESCL0_1_WIDTH(m->crtc_hdisplay),
> >   	       lcdif->base + LCDC_V8_CTRLDESCL0_1);
> >   
> > -	writel(CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state->fb-
> > >pitches[0]),
> > -	       lcdif->base + LCDC_V8_CTRLDESCL0_3);
> > +	/*
> > +	 * Undocumented P_SIZE and T_SIZE bit fields but according the
> > +	 * downstream kernel they control the AXI burst size. As of now
> > there

I'm not sure if it is AXI burst size or any other burst size, though it
seems to be AXI burst size.

Cc'ing Jian who mentioned 'burst size' and changed it from 128B to 256B
in the downstream kernel.

> > +	 * are two known values:
> > +	 *  1 - 128Byte
> > +	 *  2 - 256Byte
> > +	 *
> > +	 * Downstream has set the burst size to 256Byte to improve the
> > memory
> > +	 * efficiency so set it here too. This also reduces the FIFO
> > underrun
> > +	 * possibility.
> > +	 */
> > +	ctrl = CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
> > +	       CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state->fb-
> > >pitches[0]);
> > +	writel(ctrl, lcdif->base + LCDC_V8_CTRLDESCL0_3);

Nit: I would write the register directly, instead of caching the value
in ctrl.

> >   }
> 
> Sometimes I wonder whether this might be some successor of MXSFB 
> LCDIF_CTRL2n OUTSTANDING_REQS and BURST_LEN_B fields.

No idea...

Liu Ying

> 
> +CC Liu, who seems to have a lot of knowledge about this IP.
> 
> Reviewed-by: Marek Vasut <marex@denx.de>

