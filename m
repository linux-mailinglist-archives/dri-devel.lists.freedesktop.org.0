Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DCD5B2883
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 23:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC96010E6F4;
	Thu,  8 Sep 2022 21:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C7F10E6B3;
 Thu,  8 Sep 2022 21:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662672251; x=1694208251;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=306DW1RSTNASyuMv6Gs3Vl3b7nhPkayJ7zvS/Rt09Mg=;
 b=j03bdWeLjgRygdeei1VYwx7GE9L/SCw1Faw9ID8+9Gq+WCT7RUet1G06
 6y4R2AlPWqRkB0SSN1rGVaAYC+nriiRef3/GfasW7mWo6/+y035dG1z0H
 JMYv8iR2FTDlLfyDZqGreuD2sgB4OfShe7Hy1Sxyv/7PKutbRb5J6tlYs
 f1RhReI9KGz/KcqIj6SzuTRpEdgqdcl8h3bGqqn8qAOvMu/VGLZF5Z13u
 An+QqzP+uaXk0P+CXbS/xUMxZ2BgteWEftutv1UqU3QkLVopgc/kR80ja
 MF0d0P9Q56jyeU8KrIBgI9VLVUtx1S0iFHuOdx9L/MwiGKAgYbXlSsyQm g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="284348128"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="284348128"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 14:24:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="683393952"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 08 Sep 2022 14:24:10 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 14:24:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 14:24:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 14:24:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdysnefKEHkvPmbxAqBjq5AMyJOxom9NB2krrmw+4Q12CyHcTzPZM0iy9X8ph8csAJWIdDghgp8WCY9Kr2rSBCrQhdbVDJOVUnJSZRsV4qxD6AYQDqpTRF8FR9BUIeb33ZlS6Hd/VBS/XKR3Wy7ZZ02eWxkiJhATlvH2DEcb9Fzj3H/9r7olZ8ii5EBcxJfWt87k5EZ1e8kegv1FGfuNJaV9YoOI3LRBFHXNvIj44a2JH65PYxzTAWSSTk307+CMaNZ8x13y20/b/1eM6GMM71bLdJ3yqyPhMxW9rEW7EYLpp0auWh+dP9U83gjkZbIkVxOKDqNqo3b3IzTmG8Bdrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVuThzTZlacxRw55ueaSGzclY5cKIsGz3lqOQ9UqRyU=;
 b=Ld07mbNnLKLhUUxr1+NO2XmaFZO/6DXXDhNSmLeSkz3MbX9WS/idQzXwLPlQ4l8NxyQc8jgLC8NSWU0pwEBDRK5h3JHuDtJF33A0qRWZbg5kCcPXKZ9oExkxQ7/4hegjMBn022tFdw2IObEOqME27awsEHXNfXqzHk31QjMDWVvYWmN435uAtqttmCn/vJBLx3lMeyLRuoU8pr2SlQN2RdKM5q2kSupKyDDOerlq0qcOkA3/JqvsACESe3vYEwuZAAYKGaoRLxjQ+uShKP14f5Sqe8k9tFRhF3za+bifWqu4idJfNjS/JfYO8/mJI+cDnA7EdTYOIuMO/uZ3yz+/FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4093.namprd11.prod.outlook.com (2603:10b6:208:13f::21)
 by BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Thu, 8 Sep
 2022 21:24:07 +0000
Received: from MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::f18d:2e17:c60e:5aa3]) by MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::f18d:2e17:c60e:5aa3%5]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 21:24:07 +0000
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH v3 02/15] mei: add support to GSC extended header
Thread-Topic: [PATCH v3 02/15] mei: add support to GSC extended header
Thread-Index: AQHYtB6RdCTn+hu8wU62ToJCTRVk663KwLqAgAsU+iA=
Date: Thu, 8 Sep 2022 21:24:07 +0000
Message-ID: <MN2PR11MB409393DBFB080257B0667E8BE5409@MN2PR11MB4093.namprd11.prod.outlook.com>
References: <20220819225335.3947346-1-daniele.ceraolospurio@intel.com>
 <20220819225335.3947346-3-daniele.ceraolospurio@intel.com>
 <YxDKk++n5mbaqYAx@kroah.com>
In-Reply-To: <YxDKk++n5mbaqYAx@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b38ee70-26a5-4999-e57b-08da91e0766a
x-ms-traffictypediagnostic: BL1PR11MB6026:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I6ALhKeVXESfLtZyPi93bLh3XlJ40lN46FizPuorTRj+d+g/Zo3JiiRHXCxleqjG83x4mMA6xhnYW1kHxnuQBn06R5Bv8Y6NKJo2P/jiR4RPyWraN+ImIwCBgY1wZ0MxE6qQHMBeOI6Ma8PoCYtmchaRVg8bobwukED4t73SH8mkLPx+gBBVsV3Cn311skXS4ZY05DZEzLrIbwn8MFKOQ+pcLv7WesrmI0VyG4uKJ8sX4BWJNxMrxRnqZwFQaQ369fScU4OMk70qTbo5uVQgQOQPw0+O/O1JqtkpCNSJGAEjPxDpItcQxWU+MD9bG2ndyHw54443KM0vj99aeJKtIp/xXZ/bsj2+PXT1ktJs/RbfTRFAJjANVUeogBnDp0xBdFI5mXfF5KFe/LDNX36DFNRQOw61PO4dWk7enZfWFziRhpZOu0gpgFBKAKjjahOAWuU12DUw9O+/RR08Cxwd3IYm80llqP05mSaDAgaKlVE2ItueMI+W/JGpWmjpe74ARyXy+BWbe5wWM5KRs+j6ojgP3u7Or+si4ngyvEwo3PSxuwM4e9R7vayGhP0Bp79yVYMCeECMZA8V9kVLROFyRU9tcvfruwOhyS+VzkKhlIEZvcQkxiJl/nGaqdlzyTEgmF6rKK0rp8aC4TviFumMsymKddy9uVh2eno7DVHY+yMCDDgJaxnb04dE1u+aTcBmxVJBRedsQJQYf3yUe8NBVwWaGKrE1Rt5LxsD99em4cto2qdCPI0bGILOJcarQaFPhx7kyIS9D7mHGcAKOW3j7Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4093.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(39860400002)(396003)(376002)(366004)(316002)(38070700005)(38100700002)(122000001)(66946007)(64756008)(4326008)(66556008)(66476007)(76116006)(54906003)(82960400001)(66446008)(8676002)(6636002)(110136005)(186003)(2906002)(5660300002)(41300700001)(9686003)(55016003)(4744005)(26005)(8936002)(52536014)(6506007)(478600001)(107886003)(7696005)(71200400001)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QfUH4E69N790V2O/Di8baDzyJEQxuKIoQK/gazf3pIlnZWFLIaYZRVCkJl3w?=
 =?us-ascii?Q?kboawEgXlxW3FbEAH4mgwfexTPFZtQScmbAPgKUF1Nc+/1Dhv5cyyxw6wpWZ?=
 =?us-ascii?Q?krmU/uhAX3grQpVwviQa13wRBmS759xt/3JRMkS/DCVhzdGuK9DW2U2cO6xQ?=
 =?us-ascii?Q?mWusxK2bTS62+Z6zVGkckdzBI7rGELu9GaeSUTtjANaMt0kHf/yul/28Zr1I?=
 =?us-ascii?Q?ryddzVF7kmoBGz62+T3gBw/Hjad/mW2cK6fBoGDyltsF8WAjj9dPjBGVOJRq?=
 =?us-ascii?Q?MCRdIOwGg+p9+IO2T98sRLdkKh4Jl0GxozFl8mygKJPSXf7tg9vB6qCDBrGd?=
 =?us-ascii?Q?CMbMbFC128BQkjHE9qZk20Q3xIUo1vZ3Ug3l6doc6p/7/Xp/2j6d3BowZlON?=
 =?us-ascii?Q?pN/4+gnwnsJVSA83560svTtQBB94MjxolfWXiXUa7Z9BMXBg+a4cXBGWBG4a?=
 =?us-ascii?Q?zZ7IEbFwnIzYl8lAHEXJAX27X1txxFhpahbUWuNcyz2Dq1dVper2L7QCAV14?=
 =?us-ascii?Q?udwo8/mDCkiaVHT86VbTUkZWPp5CeHyDSfgVcLYkvro0yTWI9nxm4ByC1QfD?=
 =?us-ascii?Q?rDY7RITT13xzBn9N7sC8FJ5cYUz76lZRaBGtrcaixE+M0rPjaVxtHNKqZ91f?=
 =?us-ascii?Q?tQnpAsQqkbBGrk4dyNJYW48tMc+ShBvGIQhrLDo1e4ZPUrT/4ulxIhWlvjUF?=
 =?us-ascii?Q?MwKqNXHqpATZh/0rnmLAeI7pf2JqUOm/vMO6oymLg0GD4ZyeQZIyuUo2muNc?=
 =?us-ascii?Q?dsl6T033E0RlDoHr+yb5ELgWpOTnmD/pn6GWUuBPmnCMzrC0lQSHPChYiOA/?=
 =?us-ascii?Q?INPMo9ktkWbpkRNhIa398kE2/znHlufTwhWht1XPH8p6Ejk/2HEpm+qs1+Yn?=
 =?us-ascii?Q?c+/e9bSQhp37M9wtOpj8POyizOX+GIsCVCji/Q3Pu/e9S4c63ywqf0w0SLK9?=
 =?us-ascii?Q?dnLVBU9Zz7/l6e0UXtIKutA4GK66LqSFkB4zbj6sVfr9/ysm6L2SQzXZoqBn?=
 =?us-ascii?Q?xKYOBm+AVsGpDYorsZBUuC9zcnU3odzu/JFDOJPC84urOulZVKlRNuYJHS0A?=
 =?us-ascii?Q?8GTx8OOuMmoJaljuOAobkRXmUC/fFT6RRSBoeC0rMsUhrd0L92N21Yy7fKRu?=
 =?us-ascii?Q?DY2jWPxqYHh5UOViRkd7XaxoIiMCkZ2rWuJclVU2VCsnSzwkKC2GwTfyqQSa?=
 =?us-ascii?Q?BVaWCR/h4B0Kzpe/1DE36+AcPI6yVOCZmhCqn3ywFq8PAZwEV56l1hAQWx4B?=
 =?us-ascii?Q?S/HELEpcvjq5LCAUzR7LXlvIzeL8WnvF68TIpZBJiNSWdyPloimDZZ3Iz9VS?=
 =?us-ascii?Q?XNzqrgbEnai6l9Y93DXGaj5a8xrJ5InTsPvQszL7247n6KTDo6fPOqVXdRyU?=
 =?us-ascii?Q?XEhuCKMAsaEBgkjDqJrkCEwHtdaIBYrdu5ZL/vajq8rQrrxutZg2F1/qLgWs?=
 =?us-ascii?Q?960EYQWR1eNxde+0n5lXTHmX0kHfUQQZ1WDjzbVWvdPaaf/glNw/elv5N7da?=
 =?us-ascii?Q?jBCEj2NZglJMvvsSHHendSz/SQc89lwcgr7Zg96abv9u6qMwby2gJRvQisA2?=
 =?us-ascii?Q?UI+dehTlHAdC28jO6rzf/rqDAoTrjwPlU6ACA3Gt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4093.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b38ee70-26a5-4999-e57b-08da91e0766a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 21:24:07.1609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BSuVHxEgsb+gtxE+B9wQnhxPxEv5jY+WutNL8CiGtPVEU0k75EDjiDK/aTHCWhTw8BW86EwR5QdNc6lr7JksYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
X-OriginatorOrg: intel.com
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Lubart, Vitaly" <vitaly.lubart@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


>=20
> On Fri, Aug 19, 2022 at 03:53:22PM -0700, Daniele Ceraolo Spurio wrote:
> > --- a/drivers/misc/mei/hw-me.c
> > +++ b/drivers/misc/mei/hw-me.c
> > @@ -590,7 +590,10 @@ static int mei_me_hbuf_write(struct mei_device
> *dev,
> >  	u32 dw_cnt;
> >  	int empty_slots;
> >
> > -	if (WARN_ON(!hdr || !data || hdr_len & 0x3))
> > +	if (WARN_ON(!hdr || hdr_len & 0x3))
> > +		return -EINVAL;
> > +
> > +	if (WARN_ON(!data && data_len))
>=20
> Do not add more WARN_ON() calls, please just handle this properly and do
> not reboot people's machines for a coding error :(

As far as I understand WARN_ON()  will produce solely a backtrace , This pa=
rticular condition should never ever happen in theory,
anyhow we can use dev_err() here as well.

Thanks
Tomas

