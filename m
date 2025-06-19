Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9149ADFEC1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 09:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4938710E9C9;
	Thu, 19 Jun 2025 07:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="alaF8gxB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0943210E9C7;
 Thu, 19 Jun 2025 07:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750318371; x=1781854371;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sA5DVztFEiYu3xwiFqxYbceCqyPrMmaUTllABND2plY=;
 b=alaF8gxB3IYfTJURJbEsirhTo5asKOnJSu0xocjkColUXjghDErptRlr
 vrwC1dPngKaKELd+Ed4ITpcFGlfMTsWKrXVaRFB4OV8nbkVhq/nEUNyLN
 j3XE/bQSIXLZj8K1h91A4tQ69ikjcUWMBnZ1gg7lpjU9uHlsEMquhASRU
 fsi+tofDok0YZNjTdOMzuMYy4nQzwpAogeCcA1sC9He0czKU+woc+X7om
 wFSWrBibiVScYj/+/CeYBIJ7/ZdrtKsFRwPccEuhN04XDQe5I8UwVLGcK
 a3ypgC1Fk40S+QuoQcnvhsF0PP8Vycs7QQj0MCSQyXU/MS+baVefn/Na1 Q==;
X-CSE-ConnectionGUID: 3xLi7gR/TxC113JZmejSfg==
X-CSE-MsgGUID: UgYfsJsiQ+iewG+9Xk0Cnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63604556"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="63604556"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 00:32:50 -0700
X-CSE-ConnectionGUID: r4EPJKEmRFiXR5ieVIj8jg==
X-CSE-MsgGUID: 3qYw3VBvSJWe21f8P3VZkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="154805817"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 00:32:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 00:32:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 00:32:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.75)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 00:32:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIakc+i/uH/zrsAQOw2Q0K2fxba8jTeSwOepmHzzGapTgGejVpPDX9GEAeH2j6brXLdEcxC/hZsVmffPe4SwFmBx+ME6B8kli6d+GEHHWo7OVHzMAT/u5HSun0tjox3HgwGV1sU07jLnVtUPWvmONApvHdirL9sKwxTVktE8CIT+l3uXBUSGXBVrNAU38wESNysXLsLeLq8NPLzLs9Vwa4DC3MKNffeahM9IIhvdN5DWjgWV+lsOIEpuWksNIMhtWNNfHDCHwQ2QkMqYMFx7Fuo/uVFw6/5TLOIQ+9ZoPITdN5qu2WnYoiKflRqN1rVZdfmhPObKqNfjfnG3Rl/BmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVTL9SAqgEs2qfOPZG5YJbctdZLGslKGt6+ghqJFoqA=;
 b=D5eywN1c6NwnLeo3SHQF8ecKHGH7etnUYwtukqHe/dRF2J70ZSepuNGqejFImo+2SbIY4dYQwsSu+wqqiivwa1I6RKf8REqtwEN3o9Lwqg1R6s7rRbNCCnvmrl0NukZmsiYyaAZ9sxPzdXzEPN1OZVTgbK5AzMlZFH9TR4GQvvhAmlTGR7Z02UAu2uL5TzepPJdyTLjyxEcbXYjQKpV/aAYSVYr4YspAFDmOwpPKC3yGsQ0zWQ75B1X80XExTl7C7DUFEqL05c84dvw+cfe5mc/OO8spWKRAPBVF38zfovQKKZQVcNIT1DtHdHs4rzWlMnMOB3ZzluuguAVtIyBcgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by IA4PR11MB9279.namprd11.prod.outlook.com (2603:10b6:208:561::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 19 Jun
 2025 07:32:45 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%4]) with mapi id 15.20.8835.026; Thu, 19 Jun 2025
 07:32:45 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Usyskin, Alexander" <alexander.usyskin@intel.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "jgg@nvidia.com"
 <jgg@nvidia.com>
Subject: RE: [PATCH v3 02/10] mei: late_bind: add late binding component driver
Thread-Topic: [PATCH v3 02/10] mei: late_bind: add late binding component
 driver
Thread-Index: AQHb4IK9G2lrWQniLECnzugcN3P0hrQJ4Atw
Date: Thu, 19 Jun 2025 07:32:45 +0000
Message-ID: <CY5PR11MB6211128133CF5AEDC50B3968957DA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
 <20250618190007.2932322-3-badal.nilawar@intel.com>
In-Reply-To: <20250618190007.2932322-3-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: rodrigo.vivi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|IA4PR11MB9279:EE_
x-ms-office365-filtering-correlation-id: 7af98bc8-5816-4bd0-cad7-08ddaf037bd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|921020|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?HKsohWNuZCpxDua3Vjftus0uyoBZFaBOnBwLoZG6iKBbVxHn4WRc4e+bW417?=
 =?us-ascii?Q?57bLeWoXL5sHxRDiRkrgPRqYj3BcWM6I++25S0oHuJPfe18E/HKyB5jDtHnI?=
 =?us-ascii?Q?7ADfalRcQjHQAqQ4n2YcnMPr5QaMy+KLhY2LdFIf0VtEyN7eWtJIHmHkiEfG?=
 =?us-ascii?Q?Q4NRGgQEc1J1aDyf3pZi/ZaaomE9WxGTMPULcRCwmp3nAvCV4TGoj9sZ7YL0?=
 =?us-ascii?Q?5VDC7oCP5l7vspw6Rs2P69zQ2TC0GjSZZOTs8ypPuMP+PJKskeOvw2K6gHeB?=
 =?us-ascii?Q?VAZ2xAsliexuFCnFGW0ScD4upsaVBBE70eowuVl4YbDn11NLTHIZJ389LEpF?=
 =?us-ascii?Q?OVY1u1aqWoDrk0l87z0AacMKynXaPdDD6Dojvmya5DEwxFasfFuA2WvnNle4?=
 =?us-ascii?Q?3XE6kXxwkD9vpr4a4HYavlQf+Eunx2QHzf2UID1YCoEgDcOP8NbhxyAuSg1Q?=
 =?us-ascii?Q?DGePRRX272otc/A+SzdZisGVfmudYywQa6VcBpT9niNU/NfM+26kpAY0U9g0?=
 =?us-ascii?Q?+Fp0gwDbRTr0He77QZ+Wmuu//LjJhAl84ihsHGWN/o6HCmcN/xU/wNwPlp+N?=
 =?us-ascii?Q?6AZDzDduDWYH/KDKb1/yVH6PLgGdFDwW0zWRqKpmYJ9uvYK66GB16MDR7Cti?=
 =?us-ascii?Q?JDTznTU6NOCZN5fBwgfAQn9MMmSBgdE9uJE+QHRk7UIUzOzXfuL0jcDE+w87?=
 =?us-ascii?Q?IJ5CyrfPNQLOWfaBn3y8riZjCyJJj3QY5KKmiRIKbVs5sZ5nMUXSTBdRJ1PG?=
 =?us-ascii?Q?TuGSr897WwmbSEa7+owJNARc616T2uC0ejVbE+Mw0riYLc1hgacjSC2zcL6L?=
 =?us-ascii?Q?Lxp4etUGbHk+W8K+X47sRl4P0oAFVHWTi68rJFVoP5LYhGQ5vm5HFipn8yZX?=
 =?us-ascii?Q?wQAUoDKkfqx9nY8adUn3Ef+Q2glVlNK0IajcSraYm1giEokxKkzPI2lTLmF1?=
 =?us-ascii?Q?EBqjWtXZHSxzJWSD5O2/ZAok7wQxe4S/MaUzp5XcbqCFIDok8HpmC6Mn2TDE?=
 =?us-ascii?Q?VbjpxYiac8GnMUTPu8tjVcqPZlBGRS+ng/8/qigMTmFXUfGBmrmhdpUoPvjW?=
 =?us-ascii?Q?ACaiCkGmAxpDDIZpQ+5xvTOkBSs4450BXWXDb+HIjCaAhspJOt5IyVAUZPci?=
 =?us-ascii?Q?m+5Gjmn7BB9rYx+1d9zSndHSSJKVI9QwbBHtFowyIVAjbEq8n88msvWC0fVm?=
 =?us-ascii?Q?sVpaRBR3++r2Pde3+sQ9n7gRLSbNB/HP1uTSNc70Vt1vAIN5GA3hyK/xeLbn?=
 =?us-ascii?Q?SoQiwtdu1V9QKdhqOoEtdeWalFS/0oyUOFaVqNVo2VEYGRwBbdxJZ4ByjYv9?=
 =?us-ascii?Q?9Of2M+z+10+OrABcYdcAclAYCYM7of45rjc3ir/ywGQJuGCLXdS3EGApWtpR?=
 =?us-ascii?Q?9yRnBTXtt6jJgP9B7w4MRCixaoUlcMW08P95EYbo2+XiBSKqX4xyazgAvWDx?=
 =?us-ascii?Q?oPh2WiTZY7IH/880yETb8OjmSmdvMT0S5q/1S7AcxsZ+sDq+iTdBFZJujQZS?=
 =?us-ascii?Q?T7LosVnNkYiA9cQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e5NlyYMPMs/0luxcOD4WsuOqfR8HRCOYzmWqOKr8K48GeMmYqenmwhWtEfrF?=
 =?us-ascii?Q?yDjbNDAkLGhsTjNjpgouasktlJ79Ru33Hu0xtGdK7oMX8Ozeck6yiPcKM2vN?=
 =?us-ascii?Q?vjfWK/Y8wWPx/0fLP80RikGd2xAD/vgF021Bzyl7eP+BwoqruBwvdB6rcn9K?=
 =?us-ascii?Q?0c9NGo1oHCvF+wNyFyXO+wrOn3QaDJBBWozaTRFKyjnYnsyqY1HuiHRimUJ7?=
 =?us-ascii?Q?NS6bOJFtZIrD8hsh+wValDt6sA27b1azv/Cwr6nDlr8XVi6rpODMGpj0VmO2?=
 =?us-ascii?Q?6R3XWLG8T3BseWcbdv+SmeUDwr8CsLNWBpE75qyt0PmddHm54LlhjysB2CFJ?=
 =?us-ascii?Q?beP+LzsYdgIQuM/BNcDtOcUa4zotkBg3gUSY7NZRndwoJ9LuvLz2TEb1L2Sn?=
 =?us-ascii?Q?aXEgkkXKuSA8LE8Cg1NBt9mTQgXqHihqjX28wzoFe7YuhTapf3LCpyWGTFmS?=
 =?us-ascii?Q?IGx/ERY5wSqdqfbpyNKCHmM5jgKCcpEykruHlb5M4IP3MogeEmn8gUQRYKl1?=
 =?us-ascii?Q?Sl40HjnQH5YIlqqhfcpSZPHuHtnJ/Ry321/HjiRuCNXAWvWlOHuNf2q8vJTY?=
 =?us-ascii?Q?uum09lgeYLHLu6tAf5EufFBzGHCNceRGEJ6F3foKb4b4ZMF4f/lSDBdvVRIE?=
 =?us-ascii?Q?ui7IdRhNav6M7dUAkVz/uZjKg6HX+Br1yrB12xgXbYqoWE+ysVWn06ty3ddA?=
 =?us-ascii?Q?CtQ1QMRa/OI3ghNSQ0S/00uQxmx4wSZ+r22QmjJCDweCjahVeyaQxFAYXTEy?=
 =?us-ascii?Q?0x2ZXtZQt6vPr/Bw4OjpZkbe2+uSgO2LpksD+Ti0x50FGg3Qvoo2IojZAMO6?=
 =?us-ascii?Q?hoXOI6chbxXAJsRuLRBQ0uZQhsgv9H1x7BkqmQT5xdEvRyuTrwoUm4ZSaF0S?=
 =?us-ascii?Q?DHU28pOQC/qy0rC5dRbX9JKLehuhUy6xlnHU+BjI8lopIFpOxVGS+c1nEPgN?=
 =?us-ascii?Q?/WvaQKOgt/UwIqAV4H36zJyX9GP/Bg5y6W5n0SUSIFfVSDqNWTJy6aXINfO2?=
 =?us-ascii?Q?YO6WFLUMAqzcUIcXyWqNCywEvF8+saUTEfdPvS1u6Eaw3VO9V5iZJbYHxJPY?=
 =?us-ascii?Q?+WTMN6tW8ClbhTzN0tbiT5bA/oaTNp2FvF71wHYfaD//VAE53x2qtLD79nj4?=
 =?us-ascii?Q?SY0SvAUfoJozSFNs80eQK8PrNg9nj7XH8+/XDNSEVPjYaaCuPxCe/utEYBvm?=
 =?us-ascii?Q?p+KHVcXETssC8r23D+W4oF98mVxP0uV3uvrvzqRV9tUXRyuFunyGU7CA1v9z?=
 =?us-ascii?Q?hdmdusfYLhzfe/97GT2Xiot1wTWDN/acWAv0JGpneETdKXgPozVU8lL+GCJD?=
 =?us-ascii?Q?G305KE2svj0qbo9U3WiPA4hDybYx4QgV9CGqft4xxTxMPr/RKBWiRb1iWV2i?=
 =?us-ascii?Q?FO/BAaQHeV4BCOJrqU33WdQpxBlvj5txwuScll+HIXBYgjSPFkYvsSK+E2Vw?=
 =?us-ascii?Q?H3e5xAVqHr2BXrAKsPf+97HWzJS7DKp66ng3MUJwRfzXat2X/TYTRCZpDILH?=
 =?us-ascii?Q?F4tBh82+O0Dw/eUS3qCCGzqqaussWpyp2A6dxcepLeJbc8Erc/JCeZvHDo5Y?=
 =?us-ascii?Q?vptm2eKyd83dCY7CdJGbQjPLvS0xatRTedmmO7iu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af98bc8-5816-4bd0-cad7-08ddaf037bd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 07:32:45.3433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nVbh4LO8eutj6B0PKC2Wk3+YcALtGmo5uSIl2r48ypvxYGgHL4+r8QuxthQv+eHRPiSjOUCRzXX9zeBHjJsqfDCRy9EBoqfwLB/Jmqzoc7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9279
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
> From: Nilawar, Badal <badal.nilawar@intel.com>
> Sent: Thursday, June 19, 2025 12:30 AM
> To: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linu=
x-
> kernel@vger.kernel.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; Usyskin, Alexander <alexander.usyskin@intel.com=
>;
> gregkh@linuxfoundation.org; Ceraolo Spurio, Daniele
> <daniele.ceraolospurio@intel.com>; jgg@nvidia.com
> Subject: [PATCH v3 02/10] mei: late_bind: add late binding component driv=
er
>=20
> From: Alexander Usyskin <alexander.usyskin@intel.com>
>=20
> Add late binding component driver.
> It allows pushing the late binding configuration from, for example, the X=
e graphics
> driver to the Intel discrete graphics card's CSE device.
>=20
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v2:
>  - Use generic naming (Jani)
This patch still wrong naming I915_COMPONENT_LATE_BIND.
LATE_BIND will never be supported by i915, it is a wrong prefix.
@Nikula, Jani @Vivi, Rodrigo is it ok use the i915 naming prefix here ?
We can use INTEL_COMPONENT_LATE_BIND here ?

This header include/drm/intel/i915_component.h is used by both XE and i915.
May be a separate series later requires refactoring this header.


>  - Drop xe_late_bind_component struct to move to xe code (Daniele/Sasha)
> v3:
>  - Updated kconfig description
>  - Move CSC late binding specific flags/defines to late_bind_mei_interfac=
e.h
> (Daniele)
> v4:
>  - Add match for PCI_CLASS_DISPLAY_OTHER to support headless cards
> (Anshuman)
> ---
>  drivers/misc/mei/Kconfig                    |   1 +
>  drivers/misc/mei/Makefile                   |   1 +
>  drivers/misc/mei/late_bind/Kconfig          |  13 +
>  drivers/misc/mei/late_bind/Makefile         |   9 +
>  drivers/misc/mei/late_bind/mei_late_bind.c  | 264 ++++++++++++++++++++
>  include/drm/intel/i915_component.h          |   1 +
>  include/drm/intel/late_bind_mei_interface.h |  50 ++++
>  7 files changed, 339 insertions(+)
>  create mode 100644 drivers/misc/mei/late_bind/Kconfig
>  create mode 100644 drivers/misc/mei/late_bind/Makefile
>  create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
>  create mode 100644 include/drm/intel/late_bind_mei_interface.h
>=20
> diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig index
> 7575fee96cc6..771becc68095 100644
> --- a/drivers/misc/mei/Kconfig
> +++ b/drivers/misc/mei/Kconfig
> @@ -84,5 +84,6 @@ config INTEL_MEI_VSC
>  source "drivers/misc/mei/hdcp/Kconfig"
>  source "drivers/misc/mei/pxp/Kconfig"
>  source "drivers/misc/mei/gsc_proxy/Kconfig"
> +source "drivers/misc/mei/late_bind/Kconfig"
>=20
>  endif
> diff --git a/drivers/misc/mei/Makefile b/drivers/misc/mei/Makefile index
> 6f9fdbf1a495..84bfde888d81 100644
> --- a/drivers/misc/mei/Makefile
> +++ b/drivers/misc/mei/Makefile
> @@ -31,6 +31,7 @@ CFLAGS_mei-trace.o =3D -I$(src)
>  obj-$(CONFIG_INTEL_MEI_HDCP) +=3D hdcp/
>  obj-$(CONFIG_INTEL_MEI_PXP) +=3D pxp/
>  obj-$(CONFIG_INTEL_MEI_GSC_PROXY) +=3D gsc_proxy/
> +obj-$(CONFIG_INTEL_MEI_LATE_BIND) +=3D late_bind/
>=20
>  obj-$(CONFIG_INTEL_MEI_VSC_HW) +=3D mei-vsc-hw.o  mei-vsc-hw-y :=3D vsc-=
tp.o
> diff --git a/drivers/misc/mei/late_bind/Kconfig
> b/drivers/misc/mei/late_bind/Kconfig
> new file mode 100644
> index 000000000000..65c7180c5678
> --- /dev/null
> +++ b/drivers/misc/mei/late_bind/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025, Intel Corporation. All rights reserved.
> +#
> +config INTEL_MEI_LATE_BIND
> +	tristate "Intel late binding support on ME Interface"
> +	select INTEL_MEI_ME
> +	depends on DRM_XE
> +	help
> +	  MEI Support for Late Binding for Intel graphics card.
> +
> +	  Enables the ME FW interfaces for Late Binding feature,
> +	  allowing loading of firmware for the devices like Fan
> +	  Controller during by Intel Xe driver.
> diff --git a/drivers/misc/mei/late_bind/Makefile
> b/drivers/misc/mei/late_bind/Makefile
> new file mode 100644
> index 000000000000..a0aeda5853f0
> --- /dev/null
> +++ b/drivers/misc/mei/late_bind/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Copyright (c) 2025, Intel Corporation. All rights reserved.
> +#
> +# Makefile - Late Binding client driver for Intel MEI Bus Driver.
> +
> +subdir-ccflags-y +=3D -I$(srctree)/drivers/misc/mei/
> +
> +obj-$(CONFIG_INTEL_MEI_LATE_BIND) +=3D mei_late_bind.o
> diff --git a/drivers/misc/mei/late_bind/mei_late_bind.c
> b/drivers/misc/mei/late_bind/mei_late_bind.c
> new file mode 100644
> index 000000000000..cb985f32309e
> --- /dev/null
> +++ b/drivers/misc/mei/late_bind/mei_late_bind.c
> @@ -0,0 +1,264 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Intel Corporation  */ #include
> +<drm/drm_connector.h> #include <drm/intel/i915_component.h> #include
> +<drm/intel/late_bind_mei_interface.h>
> +#include <linux/component.h>
> +#include <linux/pci.h>
> +#include <linux/mei_cl_bus.h>
> +#include <linux/module.h>
> +#include <linux/overflow.h>
> +#include <linux/slab.h>
> +#include <linux/uuid.h>
> +
> +#include "mkhi.h"
> +
> +#define GFX_SRV_MKHI_LATE_BINDING_CMD 0x12 #define
> +GFX_SRV_MKHI_LATE_BINDING_RSP (GFX_SRV_MKHI_LATE_BINDING_CMD |
> 0x80)
> +
> +#define LATE_BIND_SEND_TIMEOUT_MSEC 3000 #define
> +LATE_BIND_RECV_TIMEOUT_MSEC 3000
I commented earlier in V2 series as well, is this timeout specific only to =
LATE BINDING ?
If this is generic timeout for mei_cldev_{send,recv}_timeout(),=20
then this marco should be part of standard MEI headers not late binding.
Other consumers of mei_cldev_{send,recv}_timeout() send the timeout input b=
y component-ops callback .

@Shahsa could you please explained that.
> +
> +/**
> + * struct csc_heci_late_bind_req - late binding request
> + * @header: @ref mkhi_msg_hdr
> + * @type: type of the late binding payload
> + * @flags: flags to be passed to the firmware
> + * @reserved: reserved field
> + * @payload_size: size of the payload data in bytes
> + * @payload: data to be sent to the firmware  */ struct
> +csc_heci_late_bind_req {
> +	struct mkhi_msg_hdr header;
> +	u32 type;
> +	u32 flags;
> +	u32 reserved[2];
> +	u32 payload_size;
> +	u8  payload[] __counted_by(payload_size); } __packed;
> +
> +/**
> + * struct csc_heci_late_bind_rsp - late binding response
> + * @header: @ref mkhi_msg_hdr
> + * @type: type of the late binding payload
> + * @reserved: reserved field
> + * @status: status of the late binding command execution by firmware
> +*/ struct csc_heci_late_bind_rsp {
> +	struct mkhi_msg_hdr header;
> +	u32 type;
> +	u32 reserved[2];
> +	u32 status;
> +} __packed;
> +
> +static int mei_late_bind_check_response(const struct device *dev, const
> +struct mkhi_msg_hdr *hdr) {
> +	if (hdr->group_id !=3D MKHI_GROUP_ID_GFX) {
> +		dev_err(dev, "Mismatch group id: 0x%x instead of 0x%x\n",
> +			hdr->group_id, MKHI_GROUP_ID_GFX);
> +		return -EINVAL;
> +	}
> +
> +	if (hdr->command !=3D GFX_SRV_MKHI_LATE_BINDING_RSP) {
> +		dev_err(dev, "Mismatch command: 0x%x instead of 0x%x\n",
> +			hdr->command, GFX_SRV_MKHI_LATE_BINDING_RSP);
> +		return -EINVAL;
> +	}
Why are we not checking mkhi_msg_hdr hdr->result here ?
> +
> +	return 0;
> +}
> +
> +/**
> + * mei_late_bind_push_config - Sends a config to the firmware.
> + * @dev: device struct corresponding to the mei device
> + * @type: payload type
> + * @flags: payload flags
> + * @payload: payload buffer
> + * @payload_size: payload buffer size
> + *
> + * Return: 0 success, negative errno value on transport failure,
> + *         positive status returned by FW
> + */
> +static int mei_late_bind_push_config(struct device *dev, u32 type, u32 f=
lags,
> +				     const void *payload, size_t payload_size) {
> +	struct mei_cl_device *cldev;
> +	struct csc_heci_late_bind_req *req =3D NULL;
> +	struct csc_heci_late_bind_rsp rsp;
> +	size_t req_size;
> +	int ret;
> +
> +	if (!dev || !payload || !payload_size)
> +		return -EINVAL;
> +
> +	cldev =3D to_mei_cl_device(dev);
> +
> +	ret =3D mei_cldev_enable(cldev);
> +	if (ret < 0) {
> +		dev_dbg(dev, "mei_cldev_enable failed. %d\n", ret);
> +		return ret;
> +	}
> +
> +	req_size =3D struct_size(req, payload, payload_size);
> +	if (req_size > mei_cldev_mtu(cldev)) {
> +		dev_err(dev, "Payload is too big %zu\n", payload_size);
> +		ret =3D -EMSGSIZE;
> +		goto end;
> +	}
> +
> +	req =3D kmalloc(req_size, GFP_KERNEL);
> +	if (!req) {
> +		ret =3D -ENOMEM;
> +		goto end;
> +	}
Use Kzalloc here, to make sure reserved filed of header is zeroed.
> +
> +	req->header.group_id =3D MKHI_GROUP_ID_GFX;
> +	req->header.command =3D GFX_SRV_MKHI_LATE_BINDING_CMD;
> +	req->type =3D type;
> +	req->flags =3D flags;
> +	req->reserved[0] =3D 0;
> +	req->reserved[1] =3D 0;
> +	req->payload_size =3D payload_size;
> +	memcpy(req->payload, payload, payload_size);
> +
> +	ret =3D mei_cldev_send_timeout(cldev, (void *)req, req_size,
> LATE_BIND_SEND_TIMEOUT_MSEC);
> +	if (ret < 0) {
> +		dev_err(dev, "mei_cldev_send failed. %d\n", ret);
> +		goto end;
> +	}
> +	ret =3D mei_cldev_recv_timeout(cldev, (void *)&rsp, sizeof(rsp),
> LATE_BIND_RECV_TIMEOUT_MSEC);
> +	if (ret < 0) {
> +		dev_err(dev, "mei_cldev_recv failed. %d\n", ret);
> +		goto end;
> +	}
> +	ret =3D mei_late_bind_check_response(dev, &rsp.header);
> +	if (ret) {
> +		dev_err(dev, "bad result response from the firmware: 0x%x\n",
> +			*(uint32_t *)&rsp.header);

> +		goto end;
> +	}
> +	ret =3D (int)rsp.status;
> +	dev_dbg(dev, "%s status =3D %d\n", __func__, ret);
AFAIU It would be useful to add the status enum in late_bind_mei_interface.=
h.
> +
> +end:
> +	mei_cldev_disable(cldev);
> +	kfree(req);
> +	return ret;
> +}
> +
> +static const struct late_bind_component_ops mei_late_bind_ops =3D {
> +	.owner =3D THIS_MODULE,
> +	.push_config =3D mei_late_bind_push_config, };
> +
> +static int mei_component_master_bind(struct device *dev) {
> +	return component_bind_all(dev, (void *)&mei_late_bind_ops); }
> +
> +static void mei_component_master_unbind(struct device *dev) {
> +	component_unbind_all(dev, (void *)&mei_late_bind_ops); }
> +
> +static const struct component_master_ops mei_component_master_ops =3D {
> +	.bind =3D mei_component_master_bind,
> +	.unbind =3D mei_component_master_unbind, };
> +
> +/**
> + * mei_late_bind_component_match - compare function for matching mei lat=
e
> bind.
> + *
> + *    The function checks if requested is Intel VGA device
Please modify the Kenel Doc comment here, as per the function.
> + *    and the parent of requester and the grand parent of mei_if are the=
 same
We are matching against the requester not parent of requester.
Modify the Kernel Doc comment properly.
> + *    device.
> + *
> + * @dev: master device
> + * @subcomponent: subcomponent to match (I915_COMPONENT_LATE_BIND)
> + * @data: compare data (mei late-bind bus device)
AFAIK It is mei client device not mei bus device.
> + *
> + * Return:
> + * * 1 - if components match
> + * * 0 - otherwise
> + */
> +static int mei_late_bind_component_match(struct device *dev, int
> subcomponent,
> +					 void *data)
> +{
> +	struct device *base =3D data;
> +	struct pci_dev *pdev;
> +
> +	if (!dev)
> +		return 0;
> +
> +	if (!dev_is_pci(dev))
> +		return 0;
> +
> +	pdev =3D to_pci_dev(dev);
> +
> +	if (pdev->vendor !=3D PCI_VENDOR_ID_INTEL)
> +		return 0;
> +
> +	if (pdev->class !=3D (PCI_CLASS_DISPLAY_VGA << 8) ||
> +	    pdev->class !=3D (PCI_CLASS_DISPLAY_OTHER << 8))
> +		return 0;
This condition should be like below,  if I am not missing anything.=20
if (pdev->class !=3D (PCI_CLASS_DISPLAY_VGA << 8) &&
 pdev->class !=3D (PCI_CLASS_DISPLAY_OTHER << 8))

Thanks,
Anshuman.
> +
> +	if (subcomponent !=3D I915_COMPONENT_LATE_BIND)
> +		return 0;
> +
> +	base =3D base->parent;
> +	if (!base) /* mei device */
> +		return 0;
> +
> +	base =3D base->parent; /* pci device */
> +
> +	return !!base && dev =3D=3D base;
> +}
> +
> +static int mei_late_bind_probe(struct mei_cl_device *cldev,
> +			       const struct mei_cl_device_id *id) {
> +	struct component_match *master_match =3D NULL;
> +	int ret;
> +
> +	component_match_add_typed(&cldev->dev, &master_match,
> +				  mei_late_bind_component_match, &cldev-
> >dev);
> +	if (IS_ERR_OR_NULL(master_match))
> +		return -ENOMEM;
> +
> +	ret =3D component_master_add_with_match(&cldev->dev,
> +					      &mei_component_master_ops,
> +					      master_match);
> +	if (ret < 0)
> +		dev_err(&cldev->dev, "Master comp add failed %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static void mei_late_bind_remove(struct mei_cl_device *cldev) {
> +	component_master_del(&cldev->dev, &mei_component_master_ops); }
> +
> +#define MEI_GUID_MKHI UUID_LE(0xe2c2afa2, 0x3817, 0x4d19, \
> +			      0x9d, 0x95, 0x6, 0xb1, 0x6b, 0x58, 0x8a, 0x5d)
> +
> +static struct mei_cl_device_id mei_late_bind_tbl[] =3D {
> +	{ .uuid =3D MEI_GUID_MKHI, .version =3D MEI_CL_VERSION_ANY },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(mei, mei_late_bind_tbl);
> +
> +static struct mei_cl_driver mei_late_bind_driver =3D {
> +	.id_table =3D mei_late_bind_tbl,
> +	.name =3D KBUILD_MODNAME,
> +	.probe =3D mei_late_bind_probe,
> +	.remove	=3D mei_late_bind_remove,
> +};
> +
> +module_mei_cl_driver(mei_late_bind_driver);
> +
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("MEI Late Binding");
> diff --git a/include/drm/intel/i915_component.h
> b/include/drm/intel/i915_component.h
> index 4ea3b17aa143..4945044d41e6 100644
> --- a/include/drm/intel/i915_component.h
> +++ b/include/drm/intel/i915_component.h
> @@ -31,6 +31,7 @@ enum i915_component_type {
>  	I915_COMPONENT_HDCP,
>  	I915_COMPONENT_PXP,
>  	I915_COMPONENT_GSC_PROXY,
> +	I915_COMPONENT_LATE_BIND,
>  };
>=20
>  /* MAX_PORT is the number of port
> diff --git a/include/drm/intel/late_bind_mei_interface.h
> b/include/drm/intel/late_bind_mei_interface.h
> new file mode 100644
> index 000000000000..2c53657ce91b
> --- /dev/null
> +++ b/include/drm/intel/late_bind_mei_interface.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (c) 2025 Intel Corporation  */
> +
> +#ifndef _LATE_BIND_MEI_INTERFACE_H_
> +#define _LATE_BIND_MEI_INTERFACE_H_
> +
> +#include <linux/types.h>
> +
> +struct device;
> +struct module;
> +
> +/**
> + * Late Binding flags
> + * Persistent across warm reset
> + */
> +#define CSC_LATE_BINDING_FLAGS_IS_PERSISTENT	BIT(0)
> +
> +/**
> + * xe_late_bind_fw_type - enum to determine late binding fw type  */
> +enum late_bind_type {
> +	CSC_LATE_BINDING_TYPE_FAN_CONTROL =3D 1, };
> +
> +/**
> + * struct late_bind_component_ops - ops for Late Binding services.
> + * @owner: Module providing the ops
> + * @push_config: Sends a config to FW.
> + */
> +struct late_bind_component_ops {
> +	struct module *owner;
> +
> +	/**
> +	 * @push_config: Sends a config to FW.
> +	 * @dev: device struct corresponding to the mei device
> +	 * @type: payload type
> +	 * @flags: payload flags
> +	 * @payload: payload buffer
> +	 * @payload_size: payload buffer size
> +	 *
> +	 * Return: 0 success, negative errno value on transport failure,
> +	 *         positive status returned by FW
> +	 */
> +	int (*push_config)(struct device *dev, u32 type, u32 flags,
> +			   const void *payload, size_t payload_size); };
> +
> +#endif /* _LATE_BIND_MEI_INTERFACE_H_ */
> --
> 2.34.1

