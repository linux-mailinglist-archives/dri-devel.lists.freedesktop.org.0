Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E05D8330BA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 23:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC0F10EA8E;
	Fri, 19 Jan 2024 22:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2073.outbound.protection.outlook.com [40.107.104.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F54510EA80
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 21:49:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYcjOn/r9Oa6ter4DrP1GZ3OlShg7mWfzp7pk+B+12egsIa/2GF62febRZV47Mpnr+ZXk/8DtoAG+r+j3QfpfnbcMmLSFLsVvLgzwnZhNMe5oQhH5a/nIKlq3thTde4Zhh3CNjUWgmtaMJkQSPe9vSbADvuTQwgH4NpRNYQ7GtmiemDSMj+M2PyBRjbp9yxdqWYRW28Vo0ZiTjEidxBI3cltO300ORZPRvoYjiHFIYHIF/EpNbaGTGHfG3NzztTnRpnX1GpQDczpIMn03PDEh7atqgpX1UKDU/uIbg25RlGZdmBosio/sPnuifFeTnQnduRQMCnQ7xOYP4TABYRhtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fA5uEhWUXMoyF3WfQmuClTihq31rQl/0jmO9x7xJa8=;
 b=GQhylPPFbBo6VcZqJTswEY15SjTjmYb2Cqm4C7pThpQgjWKdAkFUbkXnlsjjRGe6Us+lFxXrYjPA5VGHQUowOpfn1kdsXvSiQdQ/4WihHaLNpoSRkS5jNN8G5azlzwe188F7QvUd6yjtPABuljS9wKHMVgcXR9CA8oUtpXPkI/dWiZhD7UXR/x+Go81qFHIhIhe5EvUYy1U/cJFDNn8mcBDwZADjOcKGwsf7e6JEcXdHHhXNl/WrJArSq8s+tO2rvuTLK0Dl/MqlnWaTf3TzWVbb631B8yxQS9zkG3aug5P1/voU/xah0WGVrXXQgTMJJs0PeMKg1AoABJ7eATHG/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fA5uEhWUXMoyF3WfQmuClTihq31rQl/0jmO9x7xJa8=;
 b=qk0QDtapbTByBgp2Afrlsy1IMvduUz6+WrlXNnGPHnkHnntjeb+plQOtitik9afO/FQyfaKs1LM5EvT1HSL0gwBFZwOKCwg3mYK1R3iL5n0Hxr58Gxv9YABLSIOYxpvla67I6wOLXgK6SKcyQWYAhCudkQyLyGJUWig6p+R+PJ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9553.eurprd04.prod.outlook.com (2603:10a6:10:2ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 21:49:15 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::b8af:bfe5:dffd:59a9]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::b8af:bfe5:dffd:59a9%4]) with mapi id 15.20.7202.027; Fri, 19 Jan 2024
 21:49:15 +0000
Date: Fri, 19 Jan 2024 16:49:07 -0500
From: Frank Li <Frank.li@nxp.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 1/4] usb: gadget: Support already-mapped DMA SGs
Message-ID: <ZaruU5BpQF8SeZZS@lizhi-Precision-Tower-5810>
References: <20240117122646.41616-1-paul@crapouillou.net>
 <20240117122646.41616-2-paul@crapouillou.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240117122646.41616-2-paul@crapouillou.net>
X-ClientProxiedBy: BYAPR06CA0028.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::41) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9553:EE_
X-MS-Office365-Filtering-Correlation-Id: 97e874b5-8ed2-4ef4-a54c-08dc19387af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ha/pdxOMA9ZRBUweZDpzZvbbAfF5RMcSyXgpUi+A4YVB6bbPTCxDUfV7qW2gpQ5/ptF+zCwC7GzH7d/x7c5Q4WtY8N+oZnn7OpNXTJ523niwcSF1jwoKstBD2iWKmfVKEe/+HwBTkatodRei4p/YZbh1LN9V1N/OhPW0lFuGYNiINUGhFoRX2JXEf77pP4FtFee/RDAtXRx/nb3k8UAc7/bsBgsyiLWxqqLbS4LHlaMF75JNc4O78i6P9SB9DLDvumCwLEVV+xGxH0WYIQvu0mn9RDksnGktG35ZwfbSNxHcpUkzIrmwgI+zXvbEGVy66lIEAwlwFQvmSEqTuJIC0IZcZdzOigWOCRx0/Npq1yTJyg7UPh1QCKPgGoLkw0i7XKMiXO7Zckl6wXcUlHPC02XxCdb1ZMyiOGdwZW5/0+sYG0ffUnv8AjV0cqjv9QjfBFcmXXZRqkRhN22A8xqbOKKYKA7b4pNbY50YRR/UL2bEN9h5f6qkSQ0zQ84mCASEl4saejtetf4JKinJiurmKL/VghbTqFWeKAz6UBuY6r1+w/NZ003MWfQAcj6IdAZ9JaBU6UANFAYomodX0NToDEfCX3tEbJBrWIamUwNuguZ6bqyrfDKD6QoAITiSelaM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(39860400002)(396003)(376002)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(86362001)(4326008)(7416002)(5660300002)(38350700005)(38100700002)(83380400001)(26005)(52116002)(6666004)(6506007)(6512007)(9686003)(478600001)(66556008)(6916009)(66946007)(66476007)(54906003)(6486002)(8676002)(8936002)(316002)(2906002)(33716001)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4w5dt3pffptiHSgwPXBphiAPpuB4nLzEUDZUrvJz6bGAFNVqnUXMQBAlm+6p?=
 =?us-ascii?Q?QPkME559I6anJLKWRhox32nXgDKtUfSM9kh18s+X5pRgAKOMcUBVnMoREnnR?=
 =?us-ascii?Q?LXkwGx5fby/qUq6nmoFbwVt9Qs4z7pc5YiksCjsp8seDb/m1rkSk1uRKPxcs?=
 =?us-ascii?Q?hom5317Mqv7Wng67LZId+EUNltK+4M3ibM6a6vArQjbOU/RDK42jooOZvDh6?=
 =?us-ascii?Q?4Ak/n2IpsQvDxYaH86/qaUaTIGZ4cEv62tK0FQrrLjzDw8VLfIIhDdC6OgFv?=
 =?us-ascii?Q?WCAHc64bWFW1D8NRrpohV+MhPRBNalD5YiA1+9+eakec5Im2MJANsJp5vfIP?=
 =?us-ascii?Q?rMz6cd23Wnv/l86L2dqcihJwEFJ+UCuSYB0uM7ESbp0ZFYgefGKZUum2g2K5?=
 =?us-ascii?Q?LzUg4xtodzYf3R/1nuRk1fc8WgB2WxeJDPFwD0RSp3hfO0sD4nXch5r4jwex?=
 =?us-ascii?Q?dfXIyBuFApU1//5CEFLlH4ffqrdPEKWknRnjzlWCv6nuAUDZUn+hvCLOfrNA?=
 =?us-ascii?Q?nY+/EwL+VtSp25l8frNd292oSM7TVYSxB9vov9s3QGJhRf4zMc4IvKKIbEzD?=
 =?us-ascii?Q?SNTSTVITXBO1Uq/vIbEerV9RiKVaktE3IlcMBGRpYeA2y4sMfMju547VxBfr?=
 =?us-ascii?Q?t1iGo175q2O2m4j8wKvvOLIIvIjO/UHesyJTUuAICHSMnnZDH2jX0KSclvGO?=
 =?us-ascii?Q?TEXFBffo/dyRfdCJvQmbxyTusV+0g0A52V8POQHHHS0TDGhvhOM1MV1HEpz3?=
 =?us-ascii?Q?CE3DyGNuo0LrQQdpCYGckSMCDM5ylUL6XJVKn5eR9UDotfjqXBwlIbAhi1HG?=
 =?us-ascii?Q?5cb/Nz1bIdcJiRQv7x78PM1I4kFnD8rm14noc8l9MWTHr5c4MZwRkR41xLYk?=
 =?us-ascii?Q?T4UWv5l4tyXqtwSqNSlHjBm9wgnzxzycoShACUdXNfsFR9w0tyXf5JEiVREe?=
 =?us-ascii?Q?lRzDWAaMDu173f6/YRiFXtMFpZjhRT2RPTQ8BeIwL0w6W4WQonFNxxPdbLtO?=
 =?us-ascii?Q?MDApeR2LtqYXiviMBvgz2Os1pqSwLyiSxDRo3uOD8BEapZEAcFQCBN7rE2Kn?=
 =?us-ascii?Q?/NplfoyjutTZy+Eatg7SaeRMR+PGOgOpb0RqKilGKCxzP47yjndflyN4dCNS?=
 =?us-ascii?Q?JbQsE1wbzGJBwfCepYHnCYB9+3OJzkWSgaa2HSiaXPtma5yMn3yc899Wukir?=
 =?us-ascii?Q?xLc7X7viU1JMqv3eE3mcSbzQJp8dPAGETArfMJX4S8lYoWnHMxrG0IkrRih+?=
 =?us-ascii?Q?QLD/jsRZi3fMUyBtHtRee6Ns/GnXHb5V2xq2VfBqvBXq1OFzvMh6XqNWw49R?=
 =?us-ascii?Q?MFSYuofbunkitvsnfKtWrEk8kBOc093viHAC3p1hjoMrqo3NbrK776vxQS8Z?=
 =?us-ascii?Q?feSBvT9HEzH2+Oo5cYkpHcZ3hP5Xm/zNo0DsLaI7aAmJTixyl/1bVyUnPSq/?=
 =?us-ascii?Q?b5DhNPrtcfWHUm33eq8JAo/e3YLbIlt4NBUn6lZis4EPkpvtlGvjCgFSYA6n?=
 =?us-ascii?Q?DlsBkEFt0k1axHuSIrvUzkzUzhC2satKQOhRJIIT0mheXIEMYsevIkb5E+RE?=
 =?us-ascii?Q?D/aXJmN2t70kiKMloeF8BRmERiju+6aRloHM01V7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e874b5-8ed2-4ef4-a54c-08dc19387af9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 21:49:15.4820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XjJ89Ryj19M8JnyA3/tBfj3l5tpcfNnrL3RmD/uk2dR3H/Sl7+19Ad6OkRUE8PoSSsCNznmN/yQg+dq4rveRqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9553
X-Mailman-Approved-At: Fri, 19 Jan 2024 22:18:36 +0000
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 17, 2024 at 01:26:43PM +0100, Paul Cercueil wrote:
> Add a new 'sg_was_mapped' field to the struct usb_request. This field
> can be used to indicate that the scatterlist associated to the USB
> transfer has already been mapped into the DMA space, and it does not
> have to be done internally.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/usb/gadget/udc/core.c | 7 ++++++-
>  include/linux/usb/gadget.h    | 2 ++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index d59f94464b87..9d4150124fdb 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -903,6 +903,11 @@ int usb_gadget_map_request_by_dev(struct device *dev,
>  	if (req->length == 0)
>  		return 0;
>  
> +	if (req->sg_was_mapped) {
> +		req->num_mapped_sgs = req->num_sgs;
> +		return 0;
> +	}
> +
>  	if (req->num_sgs) {
>  		int     mapped;
>  
> @@ -948,7 +953,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_map_request);
>  void usb_gadget_unmap_request_by_dev(struct device *dev,
>  		struct usb_request *req, int is_in)
>  {
> -	if (req->length == 0)
> +	if (req->length == 0 || req->sg_was_mapped)
>  		return;
>  
>  	if (req->num_mapped_sgs) {
> diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
> index a771ccc038ac..c529e4e06997 100644
> --- a/include/linux/usb/gadget.h
> +++ b/include/linux/usb/gadget.h
> @@ -52,6 +52,7 @@ struct usb_ep;
>   * @short_not_ok: When reading data, makes short packets be
>   *     treated as errors (queue stops advancing till cleanup).
>   * @dma_mapped: Indicates if request has been mapped to DMA (internal)
> + * @sg_was_mapped: Set if the scatterlist has been mapped before the request
>   * @complete: Function called when request completes, so this request and
>   *	its buffer may be re-used.  The function will always be called with
>   *	interrupts disabled, and it must not sleep.
> @@ -111,6 +112,7 @@ struct usb_request {
>  	unsigned		zero:1;
>  	unsigned		short_not_ok:1;
>  	unsigned		dma_mapped:1;
> +	unsigned		sg_was_mapped:1;

why not use dma_mapped direclty?

Frank

>  
>  	void			(*complete)(struct usb_ep *ep,
>  					struct usb_request *req);
> -- 
> 2.43.0
> 
