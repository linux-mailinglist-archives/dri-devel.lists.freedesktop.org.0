Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C6A8CD015
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 12:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DC710E713;
	Thu, 23 May 2024 10:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WFn1/cFo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A167A10E103;
 Thu, 23 May 2024 10:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716459281; x=1747995281;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WQkKShPJdahLJj81d8i6m75pK1vAXvXObd/mloxLCng=;
 b=WFn1/cFoj589uO3wvIhUUbk+5XgvuOcDwnZp8gUySMOEru0rCR50liU+
 TU2BvcaO/GXQSfV9ldvxP7aS61asyRfukbIbIXDp98Mf6TVD9x/kcPTTs
 pdhU+yI8Fc1+NMKnItWeMoMM34yElplXoJLHr97X5EN3y35XLQlOODzY5
 QW0RHuh1AerAeAdvlF1/2A4qVSzS3St9DweTF5kHEmjKVC98CKs5+vdvs
 N9wYKmR6alOVKyWpRdhOMYu1sasStck4gVGHiB1QwHPhMoJtaFKRnG+JZ
 b+m1Xgf79sY7AG3dDxy0vCbTmfie1xa+eCC15O7NqeE8Y1g0ilY/1AnJ6 Q==;
X-CSE-ConnectionGUID: YMJMl5xvRkGI3FXLSQ4j3w==
X-CSE-MsgGUID: Gx2xhuPoRgWreTDyV4N35A==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12641083"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="12641083"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 03:14:40 -0700
X-CSE-ConnectionGUID: g7csa7rHTuuf8dt7OFcx0Q==
X-CSE-MsgGUID: d2Ey+DCMR1CQeJMc+BxILA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="34085264"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 03:14:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 03:14:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 03:14:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 03:14:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 03:14:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dheam8t/h9m/8kv0TStoOqkTV77HW9Py+9R0LBCz2ricogAnGzXPNrXpQ2G/qm35WQAkpliG7lMH0vCFCfwhZqC1iIyuoHc+tLd8H5nOMF//xTSi/1NTBWzAucQVmCCTIiHw1VssDsHiZsanrqCfeEuHW0PJKQqD4o+Rem3jquwEy9nhXIR1ImwmbUxq7fnUM7bWE71B+dOZOhROy79mn6l91pybNM8UPO1E0A7Zx6rlQRthXWFBjQVTrH7tZ5hqEo1d9HRSjvXT71YHlTSS5VF3/38ggytCgLpMBkJNX/LJlvDF6ESJoZ+PE3lyMLH5aiE2aPMhAPfMRkFe82Fduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1noH8mckWq8z/8nydJ2O4FVVzr1mi0Ro4Ofv8ioE5B0=;
 b=CbhGknTaS5oJnKgwGR1yw4XvUa1nd4BDSadwSraYxdH9fcO3i63/9ztjjx8L9VRVKgN570FQ9u/gORs8E+AJG0nN3iJTi6lPAUmtkU193RK/RwVFfgx5SybM6rIefn5/f7iL9ubkF5nN7mppK4Qz5prkpcnTbAqUQtj6hDfmrCcqzVOYkQJA0KhvIfG9dwAaZNrV23CBRBWnYqpz47Tcs9H5uxb4fZ2IF00ZM8kW2bSacaOoq9//fR1AWPiDPWNSmCy4o/oGQv0d4tCCTYDLm4mSNBfizKIe+TsGlpky0DoyMS3fiJdWQ+n5wP8fqxxumi6lh4y5p0ZK0z9QaT26lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH0PR11MB7585.namprd11.prod.outlook.com (2603:10b6:510:28f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Thu, 23 May
 2024 10:14:37 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%6]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 10:14:37 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Nikula, 
 Jani" <jani.nikula@intel.com>
Subject: RE: [RESEND 6/6] drm/connector: update edid_blob_ptr documentation
Thread-Topic: [RESEND 6/6] drm/connector: update edid_blob_ptr documentation
Thread-Index: AQHaouwJunJptEEDskup0MB4zjoGrrGkrhOw
Date: Thu, 23 May 2024 10:14:37 +0000
Message-ID: <SJ1PR11MB6129691F7F09BDB945E9DC4FB9F42@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <cover.1715353572.git.jani.nikula@intel.com>
 <b6aa1ea30ae85ef9e9814315d3437e82f0ba6754.1715353572.git.jani.nikula@intel.com>
In-Reply-To: <b6aa1ea30ae85ef9e9814315d3437e82f0ba6754.1715353572.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH0PR11MB7585:EE_
x-ms-office365-filtering-correlation-id: 5204758d-ccc3-4e5b-ebcc-08dc7b112703
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?TZ+3IhhFUOYUvShWePHkoR6G3dFRT95IrLAEVGM0i2LVE/Su9gH816FuIoLa?=
 =?us-ascii?Q?Mp8qSX56qt66KkFXg86RYgQI2T1vuVSLddLAbAH+HLwyU9weP09BIdckpXlQ?=
 =?us-ascii?Q?bskDzZv7TZVfRKqCcQO4MOSa9tVzMqjKRroDVQSjvO9JgEPrCugRyFs5QwKG?=
 =?us-ascii?Q?fzIB2upVQ+C84NbraXxHEWI4kzEUkCn7b1+HFrFPNjL/SxvsBPnmkhRDDEiB?=
 =?us-ascii?Q?0mwh6BNZ/OwhQmjVRnU1v/5cj1Ln7dzUOrounZCHbYmP6QA9s5k18B7qIHvp?=
 =?us-ascii?Q?9tswAQ0XRJmuWGARIknb9VlW2lgInm0MmqJp7fhlcUSjhdmBslnTVD8RbM+G?=
 =?us-ascii?Q?3qd2h+dvOdxBJjAXYO8QKvElK0ZWtDDIswpNzoqpDGm6gEh3ZbXz7F4HkyDb?=
 =?us-ascii?Q?78udScNuDTepsIS6/Jb5WjgdLTSz8gjklAwzjV035cyMiGMOn3wJ2dNF6urb?=
 =?us-ascii?Q?AcPELU0Fepp9ufBpKRn40mD7oicPC7JO82iNM8v0rUofK6ZB0wSUpc1agZfI?=
 =?us-ascii?Q?EAsyeYMOOTAAsfowoVPzsyxncibR8VGYnvo/OhC1NAVxq3urvgQNqQYU4MI/?=
 =?us-ascii?Q?ib55T2/Vh76MWgGnX8YIi51a98YfLyfQDMybtNHeaGvOB7qTNsTykPQx/vTd?=
 =?us-ascii?Q?sygggyODyzEPDgizyGfQ7fKXCk3pLhrxZOzZfgJ/s4mmbudFJiO+f4I5boGU?=
 =?us-ascii?Q?hduKYJP9WDcUSM5sNwe69QPnXnYJCUO3hREZu4LG0Zo56qQAUQ9C512KbHIV?=
 =?us-ascii?Q?DfeE/49YE0aNH3ECJeFDounCi0jU7X3MADBe3AohEIuf6dtC7Z26/0XGk3j9?=
 =?us-ascii?Q?sM0S7wf/cQvhPX9tKY4E7q/wgn9XmCG43VAMvHnGRCedg8juhLlo5Y83d+O2?=
 =?us-ascii?Q?/prnSfVMcMPQF+9yQcJieRRjGEJ4mBdllpu3pKpKatvGPvadOpCfwFc2cK8x?=
 =?us-ascii?Q?6QHMfyC2E7/xg05zC4/bJ9sn1QczP17MUI1T20z9sI66cnbkvKOsHSgos2Jq?=
 =?us-ascii?Q?ydvMya/MKTOXW3GSJQvGx6DPk4nJK7Uwtv5me1UbBN7MHXeFksEqdq1E8Z4A?=
 =?us-ascii?Q?DWbgcIgt5HLv7T9dbjZ/EPnn1LI3MSXvNFNB4Ej3PTgNNogTBNQ5Mz1LPg5g?=
 =?us-ascii?Q?1terHYJHu+FhLhLsIopITZfBdw8utgXOOPvFeqGqWKaJJSeDOoQxtm4EoUXu?=
 =?us-ascii?Q?TIQOc3A+ueCCBqjV2A1Ypp7WjnUTpNlYZtCeGCQs4/ltbyXmAxxLtJLVozY3?=
 =?us-ascii?Q?+kiTrCKctsIFFiMcRLGX162Mxhk4fwrLU2RhU6GWXs9NUqeAEXaWxVVmV2e1?=
 =?us-ascii?Q?aOXDSTfROfiM/qrBeRmg7vRBwOjSAWBz1JjENbaX6KDf2A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RgU8hmPbO01i7xI8piu3/hkoXxjiUVhC3fPnGNql6cDT88YdbMSe9+OjcfwB?=
 =?us-ascii?Q?HaDFFeJZbNa+24l71k8Xyy7jOaaFG/cOUG3KIeohpSNEzOA2IgbivC6a51aA?=
 =?us-ascii?Q?ociMLO6/4sRBj2dxBQ/vsZLgEs5yAqRRDk1g3FWegqa9sIugL4X21jLozQNq?=
 =?us-ascii?Q?UcVNECYXJ/4CzTl/TLICRjgsCtGl4Z6K1Hw6ZuQBafzOCNksw2PGGSxCXgN5?=
 =?us-ascii?Q?wuWim5fiBki4kexlghUCcIz768FhyptCbirNXswGayOATFyaXCVNeWCrNAu5?=
 =?us-ascii?Q?EAhiufc+BK2UW8PsHZ+xuxSciJgrEN5XALDap02XUfLcUJMcTVajpGVkrazX?=
 =?us-ascii?Q?FgHEoQUfXBaq0XzcleFikE8+KfYGd2OnY5VTK7jKpf5Inm93UKqDztsJsH8Y?=
 =?us-ascii?Q?6+d2s4gv+EDiBgc+l8s4Mp3eZo/voKmdOSV74+DeX7WUPZ6USToDgVgynXo7?=
 =?us-ascii?Q?VO5C2MtXao+XSeR5se0QzhLdAWuNLt91sDO54zUIkMZ3gvpP8EQk4OwUV+jH?=
 =?us-ascii?Q?bphmBABU1dLHV9aw3Y5otujplPSnFe5wni0rlVKVVoOnQIA462nf3L6s7Eou?=
 =?us-ascii?Q?bnufthJ9EggJdLvVhSSv8LvWu/vEfno7XKLyd77HoXENmrrgn0P40oR9S6sq?=
 =?us-ascii?Q?7/dZYlmjcrRCS/3xcHQgtoHndgFeplXxheM/SRr9KsTJalXITLr8KW+TFrV7?=
 =?us-ascii?Q?5Pl5ZGTPjpn4EcjD4qPOTLA4PEjyMX8gH+ySamcKpsACIQ+Nujg5JmaAjSvM?=
 =?us-ascii?Q?TN/djoqCG0uG9+y/bmIyl88ufEoArzz2QYvEBP5OIOzzjiNWdN15H39vIcx6?=
 =?us-ascii?Q?dtO04cUzSTwQ84wMJjsJJSrzDJKC2v0m3XrT/mBwp2hubmOunG8b6Vliw1EY?=
 =?us-ascii?Q?Qddd4ZmrckiTn2ZbB1cdPob2zR0CrdyAyCamFNymev7p/ab9Z9OMEJZ37K2y?=
 =?us-ascii?Q?BcfcQYcOWkkQrCLoc296kheeQqqZSiBNBb1EpI6/KqMyD+t7qYa7aHo3NsSk?=
 =?us-ascii?Q?MdG/r+F+Qbk0K/aWA765qYhBYnYflYx7ziJwt6nb94Xkx0G96DI1XH/megrk?=
 =?us-ascii?Q?OFShjszszASjsVQKwBy1nmkjt2VSNLq/P7pEy33duQSoViyD3ckJi52yLcUj?=
 =?us-ascii?Q?lQXVX9GrG9mi32FU2djPtSuNdcVfAMitc0EzM4tWK5xT/it23Jd8CpmpEVCW?=
 =?us-ascii?Q?ixnlnscYrck+b/3MGUFFFkKFEpZnvm3i7R2CU+Qvldur5pNCIH5XoFb4fO+3?=
 =?us-ascii?Q?JMEUmP3tuytDzUA1ZsfcjZos8rLR2G19eYfP0X4IuzSQwccTCtLXb0rE3MaU?=
 =?us-ascii?Q?xhYhM+6dF7rV3RF20+JxVKNaVdvUM4W233VoL5/wIANRnYnj3xUzRKBeaY+3?=
 =?us-ascii?Q?U4UOoXpOGfhpWnX6JQ1iIyxv4CSLYKvZEm7s15UKKv2FG9qPY5u5++LMjviz?=
 =?us-ascii?Q?W4ZPHszv3bzb4Lfa/877BosJ2NXjotkcJVkUZvP/caVz2RVdHbeKnNgZn1zZ?=
 =?us-ascii?Q?3bG8lNaCCtd4qJHBLQalfI2kUuh+n8yKeOp4zKKv3uSCRjQGi+y3ol7l6DZi?=
 =?us-ascii?Q?3ACAW6HWtaMLiQIzEvXydmX1vYLwLGGsibmF412Eld+EBBtXMcD0bToigPuk?=
 =?us-ascii?Q?xQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5204758d-ccc3-4e5b-ebcc-08dc7b112703
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2024 10:14:37.8556 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: llI3qV38CdMtS8gGy2yLBKnvG7n9F6c2dIBAHuAobVeXWTh7tgwf+yZIIOd/EuhOzBv5bW4jsZ0MOXPCywirnfk3nj8Wus7lYC66/Txwm50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7585
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

> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Ja=
ni
> Nikula
> Sent: Friday, May 10, 2024 8:38 PM
> To: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org; nouveau@lists.freedesktop.org; intel-
> gfx@lists.freedesktop.org; Nikula, Jani <jani.nikula@intel.com>
> Subject: [RESEND 6/6] drm/connector: update edid_blob_ptr documentation
>=20
> Accessing the EDID via edid_blob_ptr causes chicken-and-egg problems. Kee=
p
> edid_blob_ptr as the userspace interface that should be accessed via dedi=
cated
> functions.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

LGTM
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>


> ---
>  include/drm/drm_connector.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index fe88d7fc6b8f..58ee9adf9091 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1636,8 +1636,12 @@ struct drm_connector {
>=20
>  	/**
>  	 * @edid_blob_ptr: DRM property containing EDID if present.
> Protected by
> -	 * &drm_mode_config.mutex. This should be updated only by calling
> +	 * &drm_mode_config.mutex.
> +	 *
> +	 * This must be updated only by calling drm_edid_connector_update()
> or
>  	 * drm_connector_update_edid_property().
> +	 *
> +	 * This must not be used by drivers directly.
>  	 */
>  	struct drm_property_blob *edid_blob_ptr;
>=20
> --
> 2.39.2

