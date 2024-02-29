Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181F486D3BA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 20:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136A510E5CB;
	Thu, 29 Feb 2024 19:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="heuLEv2n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D824D10E5CB;
 Thu, 29 Feb 2024 19:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709236420; x=1740772420;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PmXYPXVdjUcahNYb77OMvU6VRoZSqlCvW7/geLcuTNw=;
 b=heuLEv2nBgIxtL3U6LuIy4OOlUTLLLr7NxUxRZLiGYr/9McX92PIwskW
 Yx4KXMe2z9qTLrl8+ZkYguZ8UmnBRl6ChEZKKKCnIdPY0HkAfpfdl87JU
 OwdRCjk1Y8mNOkU1iMYduCxGmIFuNUCazARbZrDsk30cu2Tl421BnJBFq
 XFE9lIdM2vxuhZwMuZVRLJEH8tZaxGbCN0R4eIBQSCf872MBzjlc3nVU7
 wzN+7KlzcGjoDZKa2jO/xLK7p24IYCeiek2bcouNOgfxxVP9o2wO++6US
 cFvBbYipAreeR5Dt5shuHGguaONDSWv/pcosiWGPE8gOzHtfj/+mzt59O Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14443759"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="14443759"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 11:53:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8181796"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 11:53:39 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 11:53:38 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 11:53:38 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 11:53:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwN8U3oebdPrAY7pQ0+RaTF5k/eOe5KfKwCq1WK03wWWb0mDL43zJyKc+fcfQUBaKPQgdj78FXX8HDNoWj06WZJdVROfBkyFfiNFX4ZfQ9DFEdqM1RaC6wJ9tNTvn1wxXeVhyLEot37MMLjXxid2c3iYkqU1ZvIm64BRsTX0B4xwWu2GNrQ6i1klgKqniu5eqMptA0nylK30psljKFKKYnTDihnHyF8d+YcYruHI9S+yWHglgSG9ZOsVQ7HSGs2AdsihmUDGO4kA7uB+oWbQ8D477BQEKxs3PTF2c3u0RWawIysKSlIBrRuQbI72rV9pOnQ66X4i4Y6JtlZqiX4gnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmXYPXVdjUcahNYb77OMvU6VRoZSqlCvW7/geLcuTNw=;
 b=W0wXmJ5tLV+1NMr2KTyhsvihAIuv4EYttaI7CwrW6rFn2UFWILp4quYwrERGRatJQRngbhKZTsUWcpJKIh8CuhOBsYI8aCrsTIjQUw11DwlkyWn7xxUM5SfzE+TosqD9wLdMAd+LY7w2bZFtYpZW6NLEd2u+9UjQQGEhvmxCc/MKkE5EWm4RHSrOxnlFDu/k0QY6vpTLsPXjhgY+ATJmA634cY6uQLyQf0yYVjkt1eXctXB8QzLQUS5XaUugHACCNSDBeLzEQO/4CDdEu3tStX5itRJK4zAXIfurPnf6tIGZUmVFv4C+GngS023eCxYg241BPPLL4CHYtu0IJSmeEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by DM4PR11MB6408.namprd11.prod.outlook.com (2603:10b6:8:b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.26; Thu, 29 Feb
 2024 19:53:36 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::27fc:befb:9a38:279]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::27fc:befb:9a38:279%4]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 19:53:36 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v12 2/8] drm: Add Adaptive Sync SDP logging
Thread-Topic: [PATCH v12 2/8] drm: Add Adaptive Sync SDP logging
Thread-Index: AQHaalTHRUKmBtobpEGD2AqjrUtCWbEhIfcAgABjHECAADHjgIAABiKA
Date: Thu, 29 Feb 2024 19:53:36 +0000
Message-ID: <IA1PR11MB6348AB44BA666E7041F3E6CFB25F2@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20240228143823.2762595-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240228143823.2762595-3-mitulkumar.ajitkumar.golani@intel.com>
 <87msrj8sjx.fsf@intel.com>
 <IA1PR11MB6348DD3317E4B9D860E426CCB25F2@IA1PR11MB6348.namprd11.prod.outlook.com>
 <877cin6pao.fsf@intel.com>
In-Reply-To: <877cin6pao.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|DM4PR11MB6408:EE_
x-ms-office365-filtering-correlation-id: 3865a506-f25a-4829-e9ce-08dc39601dec
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KBooeF/XG/x1X9rMFHVCYy7bbhSEKP+01qmt+6jMyxmyeX5x5biTXp+tgoPE95MKWJXby8H0cGAgxLIzNpGQdSMZc6hN1Fc7QedAMb2OxDaeSI6Wq9v4e7cFO8c52gErg7uzkNqGyxJrAoX66lxnXayWDSymlvJwD9apoWzZTU8i649GQ1BQchJbcUD0LlPgfuPUXWWkFdLm7dQFTaS0VfTcw620RTJftzsgOc+GTGIijC9gQU+MGSxXWypthNN3zTdYgu9lGHBJh+36rY9b9FS6MYkERzSB3B7x8RLm9Hb1d9PHaKVvR8ALjIBml0o5v0gLxj9MktYhw28hxsd9Es87ag24Oa79j6ykaISEqH+qkSBqN78Fy2ge76uNZlhYxFurcnK/W8HdT6a4Wf90Gd2yzXdoFNwyLSKjYjWqgthjlpkQavqsacGzg3zPrZU2+lKuS6PtOBLUtzYXAhhNO6MMaQssGiKmef/W7Zdyhjt5BVmHxiT9QXlkve5LWO5PmL8eYrgGSSc+/IRVxQ3SCvyjjbdRuUnkXdmyECsL0Cy24F6IP/jqGyk0RSfn2gzTART4nY941N2U0IpD8cSMr0538oHomm5LPfm5hoWkNUQnkAIVuzPftF0OCwfa0W8k9459XaDZTTH3Me34/l4mWsgLZw/iqrv6nNWnhXH5ME7l1Ho4ldQrrTq+mu++VCdl8SB++Gzy5acoGvjwf+SHUOn9ZiOugVrzJxmkl/luNqE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zsVYpcQTt3kApeYIP/dsthlgSX6CMfBVDPo9rbMBAM6dNtHG3DRANGPp2hXe?=
 =?us-ascii?Q?IfJmwI812US79PCgdZYMD1crEtn3mw1sD7FGfk1CB5Eudzz/x+8vbp7fpEol?=
 =?us-ascii?Q?rIpw0elQ10ZfVtj5Yx0YKda7HzkijPIwZa1UMcYnSquvTv8NfWcGs4pqUYdx?=
 =?us-ascii?Q?lPpk4l1Jw1JGX0z+AJslmxflZu50AECJyGauw18hFyOW9IqnP4xz0k9QPoQT?=
 =?us-ascii?Q?j2VI8Zp/1qZBk37eSe2I2GLa9w9GPEpatgQyO41zJqghXEgxP2vrZsgfQdON?=
 =?us-ascii?Q?m8OSvPZHh28F+7BalWntObsBZLU7zwLwcjgnWD1Z5q0ky1sgm843Q7RIRk6j?=
 =?us-ascii?Q?y+E1phWKYQl1MUwUSYO07nQGrIINQvCjy5ZzZQnlCgqy2V7X8stNO1IORPRQ?=
 =?us-ascii?Q?33gXWh06UKvdiPoNDyUAM5JzpR7Uc0SL6JCMREJf0BHVK2PGKSUUL8BjgFNS?=
 =?us-ascii?Q?US7MuMJUAXq3Rfgy04P/CWWyJc2fpohKopp8rnzqwnHAOFPN7T6xqgRAPJv3?=
 =?us-ascii?Q?T/wkqUmZLAQY/qwm1UvYuwMRli87kFFJb0h6bx152a6MTnbR/YxmlYaxLD6Z?=
 =?us-ascii?Q?KHbjFfa0+mDrSlsVveWIcQimKdL/cqxd2+91+hY9OdL2n7gX4yhAyJUg9meI?=
 =?us-ascii?Q?ugBuxCgqLfCfzsoEtRTfYNHBrmgf7gIHLt1T1TEIEus0+LEEWU/dHeIekXTn?=
 =?us-ascii?Q?BtIN7qi7NzBCG10QHvPDqJY24rzH632fo44DB6e0tIE0uJhF/gjuyZFbUlU/?=
 =?us-ascii?Q?dhy8U+2tDlviFdUQPoYlnV7aZUNGfFyWhQSUknM9m+qOdpfcTzBeWLyXO7bk?=
 =?us-ascii?Q?I/glDKpjvNOzBEXB67jxQLMEO2ZqGN5kbRcD5OY4LBfXAqIZMBaMOzQUyPO2?=
 =?us-ascii?Q?GX2gEdQEuDmlJkH8Nw1hsleE5c4w7EK9/ttZe/kXOM9uMtMbEbtMvkrUcrho?=
 =?us-ascii?Q?lnoaDtjhKQknwLw1waFYi/v7K1TRE036f+aTU8mhK6Y3WJJEojjrDLADUqJ5?=
 =?us-ascii?Q?ALLVBLRD7l4qwlWM7Ri3VhMB2cyoyoW1zGc4kKQoN6kTHmLKv+5iQau40LRs?=
 =?us-ascii?Q?KIIjsLGO+lmjovUuiQO6Qh7I8PHgKqgPT4vm7ntScMWaNZpXDbuAtqu+OCCf?=
 =?us-ascii?Q?IybFyckGukXFTuj8xQAKuCsOEVzVG4K1UU2SB00GRdTvKToHR9wYXNQa6NNZ?=
 =?us-ascii?Q?gnvFacQUcXCVVkKKE6L89LMj/cmpN5pngKS3Ka6zvJEvBQGz1drW3rHOXoPR?=
 =?us-ascii?Q?nwkY3Ef44m7QYqckRPM3u7xbx5dEY61SpXvuGEubPVSb3AnR1WajFCgwZ8Lh?=
 =?us-ascii?Q?mOyVAXgQGp41ijk3k5lQ2HzFZ5IW6Fl0giu3qGdUjDmumdoKfPp4aETnrs4n?=
 =?us-ascii?Q?DPMtFLYIvgu2bQucIj0WxFp+7ainOAEjOSV0TRibsmJUX/EkcBJcESbpY07T?=
 =?us-ascii?Q?nJWvBkZU4B8m3NR6qxGGyHtK+Tr9rix+uqi0FGzfEzRcSWi6cF980iozJFHQ?=
 =?us-ascii?Q?h1wxWU4b/E8YjPX0alDp0NWe7dZS92yLbu2P3g/KR8RrX63wtC4vzvc8pfnA?=
 =?us-ascii?Q?RORTBimWz3gXDDnF+5wlgJrA9IodILigHY8FGULAAFgHNkDM1P3UAh+BLwWy?=
 =?us-ascii?Q?dXAKcKYuToC5W2UXYNiHNTY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3865a506-f25a-4829-e9ce-08dc39601dec
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2024 19:53:36.0968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LChnwbTRBG2dPPz0b3ogrf4JvkfJfhhZoN9j2L+oDUXFg8CShujHHiVJX+z+YO42KJvff/wmEMj3EoT1WtAram61YML/x0g3pXZyO+dofamy1cjz4BtC3WGzz+4cdT2Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6408
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> On Thu, 29 Feb 2024, "Golani, Mitulkumar Ajitkumar"
> <mitulkumar.ajitkumar.golani@intel.com> wrote:
> > Thought behind this was to use the function where it was defined. But
> > no worries, I have split it with new patch series floated.
>=20
> Please do not rush to send so many new versions! Let the review come to a
> conclusion first.

Apologies, Jani, for the rapid succession of patch releases. I missed inclu=
ding the first patch in the initial series float, leading to its inclusion =
in the subsequent revision.

Regards,
Mitul

