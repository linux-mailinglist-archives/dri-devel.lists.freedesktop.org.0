Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB348AFC47F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 09:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D7510E15B;
	Tue,  8 Jul 2025 07:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MSEcHd6K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476E510E15B;
 Tue,  8 Jul 2025 07:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751960984; x=1783496984;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t188XYkacv7D4FWMqOju6TYxIBdJQ+PEDCkLxkjtM3c=;
 b=MSEcHd6Kx5eZXgQvAQZ4O8DoYg/QS+R7++iSCO5wddsF2Qyw661iRa8D
 ZWmyEMe455biWXGkNEAfVETIiFdUNwmsbBITTYZLl/4nLr9ws8u8+t4fG
 vmY8cwfqqh08IEGhTH5sJqtc2VfNO056piCJ/mic/9OsLWdV9jcIgIBYq
 v1qUWzjqU7V1u/ZfD7tyxXgTAXU77N3B9rsmeODGvqao7MK555+fXOz3r
 2+qF9GEybN8kFykJ4tZ7OXyUdfitZ5crx6s4SwwApipXJyplmQ0TsVuX3
 VKjk99H9QmApzwytKBPMYm6wvzh/Ln/dMcy0H27baTIYk5Erw3W3V3ixp Q==;
X-CSE-ConnectionGUID: GWb3gxpKTyKym6hO4xS7nQ==
X-CSE-MsgGUID: QeHO6uANTkWzkXaNDakOJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54283954"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="54283954"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 00:49:43 -0700
X-CSE-ConnectionGUID: 086tijQQSAuOy/u2VxU5jA==
X-CSE-MsgGUID: hnp6AOqLR0qT9aBr43Q6Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="159764370"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 00:49:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 00:49:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 00:49:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 00:49:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9MXXhBFHIEtr3ghuSgIkoPcWdI2j7F8yA5ZPeMF0ZMLkO0iv7fCEFuwLT0HsH1cYiA5DYzf6d6DhOngCIrzR/TUSuhvyXKKbQzlobjkVXRcNkuYN4R9m2ugsqdGsvmxCMaj8kb3XMFBtEDrDXjFoyhg8fvLnyverG7kLBt6b5dXd6jV5jmI75qXZBPbuI4qsHZxvU223UiniQIKaJAetuLZgXrBkeFGENOKTaDdK7Hp05dzAn3tQr0IeQTZa4dzEeyMPreLu/IvUfMIjmDFp7be25h1nrApVi5ftymYzw9LQBPIC/UW6BUoc2Q7j8qaLQeamCgJzyeXO6Vu14nYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCrn8N3eAi8eSO12lASZR3Se6FEFd0R8KGB3/oEcmfQ=;
 b=WEcODfhBZvnKx7jI1b19blHs2nh8O2WniyiFMKa+QY/fj7nuO73wRz+P3uYh8JVHTYy4A3RVA2RWgU8+3s/jN608PNcU3Fq9MBJgWv8Hota8JFPhkYEWy6PHdpxhVGeoSlT6ys4fonAWqOS/n7Hzbvr1LkbdKf9nV3+eVPVISdL4fZry93lxgP32igsqiUlIgQNme+pukDJidlZVZGWsCzMTsu7xYN92NCGGmgIdkNMAUsyLOiq4HSlQ4fXMkMuXz6/jDZnPF0xne80iucY0SjUuPWh1+uS3jNtn7ulRYiwsxOWi/D9wVzDZhnrpcr3FGp0TkZxD/khW5bH23yFUlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM4PR11MB7325.namprd11.prod.outlook.com (2603:10b6:8:107::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 07:49:27 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%4]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 07:49:27 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Usyskin, Alexander"
 <alexander.usyskin@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH v7 2/9] mei: late_bind: add late binding component driver
Thread-Topic: [PATCH v7 2/9] mei: late_bind: add late binding component driver
Thread-Index: AQHb73KGzgdULyIvqUO23rcookjnCLQnybAAgAAPkeA=
Date: Tue, 8 Jul 2025 07:49:27 +0000
Message-ID: <CY5PR11MB621164D6A86BFD6944A5EBCD954EA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20250707191237.1782824-1-badal.nilawar@intel.com>
 <20250707191237.1782824-3-badal.nilawar@intel.com>
 <2025070810-clinic-decode-57e6@gregkh>
In-Reply-To: <2025070810-clinic-decode-57e6@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DM4PR11MB7325:EE_
x-ms-office365-filtering-correlation-id: 5e0ddd7f-4697-4d84-c55e-08ddbdf3f6c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?SU2I2Gza+8RF3q+T/iakhfpft6xtgnrwswRiYgFzpenohYHlKDMcukzHk4Uc?=
 =?us-ascii?Q?G5pvZU1N0b+R5ELv99n+PyG/PiIKHDTDFRLBZuMfcfnnu7K5IfMcHnKiYFG+?=
 =?us-ascii?Q?SMBYzVEfQFXXoMps0TL9sYUIlp6lPPm4mW+iQ6o4PMYCpDxKme1VPQfkuUJ9?=
 =?us-ascii?Q?vNfaBQS5924PkeVOB36Mlpq/GZBm0cNzTe0ikY4Ol8ddZecbcPWa5osu7wGT?=
 =?us-ascii?Q?HwGeuAKAjEVNp7JzqBsRXQA44dzmE6gWuNpHrTflhD1HHe7s7NkytRCh7vxW?=
 =?us-ascii?Q?qDykN3stnAuVbb1Zw+8GjGvASxs6YieyxC0Xfqq1mzarhnxprLwPqtXm6LKB?=
 =?us-ascii?Q?1uW4q7hVWqznyqdBTethyer4OBED8Ze9MsnQV5Ki04v6R+MZdjxY2m2QiFo7?=
 =?us-ascii?Q?6SoCuUkZwpUYSpYmpkyooVyTvg0ZMh7ObvgCdl1efYU7DxyQbMHeFolMWXfF?=
 =?us-ascii?Q?Wy6exgdtw86M4nX/vkZTgKfnFVmEFwUB+zLwIdr4YcHyPReYf7u1bKZ30OUT?=
 =?us-ascii?Q?p6yDy6fl0x4ECt4ti6tLaSs+Afjw3/uP7V952RAwgKslTzLPByOqez2kJauW?=
 =?us-ascii?Q?a/538LfQOBsY19h4eS4clC33Z8/nveESPSnzMShaXIMmcWzABs6RhzDZB70t?=
 =?us-ascii?Q?2/hjuiYS8YNpa/uY/WF3oRnjsYsAR41tU57TOO0uoZvshyfSHOoXxZkkrQQF?=
 =?us-ascii?Q?Gpenad2lyNcIiviTlaHs6srQShZKL8naXeerh420NnsmJcyXtHtVe8DldCND?=
 =?us-ascii?Q?XJczPacNS/SIC91zuEKkBAxA50TGfKo3cwcwWlRCDSV1IZEbfF5nL7dE6foV?=
 =?us-ascii?Q?WRPjt3QBksp6fjAuvwOrvTnt2l2RxCSfASI062OqcT+r8iFP2EYYRTGN8qaS?=
 =?us-ascii?Q?BKJQKW77mmKKi1lJwf5gHgTc7W0bDPG+zvo2Z+L4Sq8SZ8FoqPtfVKNz09Ia?=
 =?us-ascii?Q?zg4+KqN7+mjLcO/Fe9hqt6cLU51bWEut70tMWYaCrbHWWC/0elGW86qUCE/I?=
 =?us-ascii?Q?2XNr2UmCYeq5NTPy03mfESCQ+suD9GZrgBS8bbH2qtQ+Pd+L/7PS0InJE63f?=
 =?us-ascii?Q?3TkYYmuHwgsyK1DtI63jbbrNUaQRFePe5gnymqwhJPzTV5a9xTD8HL5YDdxf?=
 =?us-ascii?Q?JFjiYvZYVGr8gy+rLU0ER2NeOcVvntjoNmj/7rXJQo8awPe56PXQQGI0TlyI?=
 =?us-ascii?Q?vovXIIMAiFyKBBX71RKtGMrsvKt3k18x6NvlYJDGFAikUR3bUNohU2hnhncm?=
 =?us-ascii?Q?pZGy35SmF6FHeU49fYMZsPa3kWswfDF2ok+nuFoHvOApDXqPxOML8D+fDSPt?=
 =?us-ascii?Q?bq0r2quG11OnZreHQPnspxnLICNDacbJZcMMO/rVtL/EhnPowhY1z04axMAO?=
 =?us-ascii?Q?po0NwCQi5kUrLgoE+CnOEiz1LjDGXHgAHKUMNpz83y+TdiFdshtc4h8zT+8a?=
 =?us-ascii?Q?CxpM8HnE74FY0p6CC2hRO46Cie8Q9e4VMELqXs7w/6tsXhW1ofPndw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MWbt5fqUlo2R/p7PCOBAWmp92jdt6G283sJ99vF/aY9gwFelLgt+9NT1BJVA?=
 =?us-ascii?Q?qwVe03EbaIZTaNha1AMDlb/7HILyoXGFcum9o8S/sKbH83Q969VEuMOOeJ6F?=
 =?us-ascii?Q?7ZqMfvF40sltgg8ddyuPDWcqvvdr5pPfk+QMnYDVxmbW4YEAjn2N9xj2IJdD?=
 =?us-ascii?Q?ZgeGGLJCC8PMJReZsomSQWXDsGDJAftOSeyTX9ppskCMiSmW4G3bu3Y2WDvn?=
 =?us-ascii?Q?UayVlxfuQofFDt8UbXb6MjpU3pXxdtMyiYEiel6dvMB4eY557Vab2uCULJNq?=
 =?us-ascii?Q?Q+Mfqu22IGSfAi5wNlIt/7mFcglq3nldQiUscfu5RNB044IZe7rgkCekF+p0?=
 =?us-ascii?Q?vtu3RJk1Kq4iMKVsBPFEf9gQ/ppHa8b8i2ACKTl3q1YQD0N6LHq2a0jCDGKr?=
 =?us-ascii?Q?XfXpwfq17aDmlCSHKLk4OMw5V70nTAjxoeZ7V4W4ME7sRY+B5kSRjFy1C0Nz?=
 =?us-ascii?Q?MlUPJ3LpAfuyYUeebapSxe7HrytEPLoVBVx9uU0Z+3novAswhBOzPCdWNTHU?=
 =?us-ascii?Q?Jy69lo+aV24TaSx+WsGltDlu1npZW480Wg0kKadBpNOvjTO6ps02pS0sDBPZ?=
 =?us-ascii?Q?mbaQDUmy7luWkZUXR8BEDi2icYO4nmVuYkxfJP8xWhvN2b5+gfTbqAJWRIOj?=
 =?us-ascii?Q?WsHPhNBkBzSwmCKfNI3h8SRdMDvAKC0Kkq2AA7mFa6/fHGBpph57CIa4ZMhF?=
 =?us-ascii?Q?rUIuZq9rga7OlXIzV2wN5kMY6jwkTmpxzefkuIlUCC260pLBPEbReTCNCFgF?=
 =?us-ascii?Q?eUULlsfegQfkFlDK18M1JoYwNs7SEh9DaC+vn87KHoIbwfjgosCY93pt7SUh?=
 =?us-ascii?Q?IwMwuPhzjL2JZ7lwWSSEqZL4Rbpn13hb/B2P2cf7t7vk8dy9VDpqlGfeaP1e?=
 =?us-ascii?Q?o0AOc+U/N1g7qsZoG0Y1CJnghZ5PJph+krshnVqEkbGJNeQpBi8VafuYgGqU?=
 =?us-ascii?Q?JKojn4lF4uZ48gIqOVcPnDaP8VsTftChEN2Z6I5iwKpz4h/+s2ywMbl0fMTI?=
 =?us-ascii?Q?7d0SfqMQrQ6vcRvPb2l0IzplDxwOPGNSRjYMDkQpWql3THkXJreA46hVI38O?=
 =?us-ascii?Q?6LwM2RK0/T7B97ibMeBNMV7OanEJmqC5oAtTs3/szqc3V7e3gTm5yygPiU0x?=
 =?us-ascii?Q?taUVx2FY7BSVfNHsijhehBpniBCeFKczEv7Nv6tQbWC0EAA+Zf7clXXQwOff?=
 =?us-ascii?Q?/Todr8PBT5kOH+vlcL9XDu2cd6BT+C8dHVu36FgHC5DpsYaF4qTrRPuH0JLH?=
 =?us-ascii?Q?3zlqLofO9OqmQQH+jn2+AKHgKWhtEXgCgSAkqW7JUxm0qcL1+SOFUeZPsoxW?=
 =?us-ascii?Q?P8P6Mpr0enA5lT4OTCyFBycRetRbfMBQg2Xce0e/MJqTsNBnqRnMTrDrArgD?=
 =?us-ascii?Q?VDZPyjdf/+f/EY9KNqsVZZw2YyWa1gUuGxEzktrU+pbZZ7Mgt1egx4Cs2Eg/?=
 =?us-ascii?Q?0oEswTtFbps+3brJrBfwsKdYgQ/H+v25XDIBIcPJJAARhdpfDgFzN2ds//2W?=
 =?us-ascii?Q?RM0ZS47fEWAw11v/PCqki4dckw3t7CQQLiRMD+VuqqC7hmcUd39O37NHIV/8?=
 =?us-ascii?Q?L7U530fFLosM7Mf+FJ00K3uBrqzqRNtqS/uyIHe5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0ddd7f-4697-4d84-c55e-08ddbdf3f6c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 07:49:27.1563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZpsCQJRIZc9FhV92Siiu6T7emVsuuAxZzcK9dPn0d2dGzqbKP45HvAgXErQU8QdvkFSvypNAAHgHXTumC+zXFRS8k9LTtxIBBnfUENmfCfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7325
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
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Tuesday, July 8, 2025 12:18 PM
> To: Nilawar, Badal <badal.nilawar@intel.com>
> Cc: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linu=
x-
> kernel@vger.kernel.org; Gupta, Anshuman <anshuman.gupta@intel.com>;
> Vivi, Rodrigo <rodrigo.vivi@intel.com>; Usyskin, Alexander
> <alexander.usyskin@intel.com>; Ceraolo Spurio, Daniele
> <daniele.ceraolospurio@intel.com>
> Subject: Re: [PATCH v7 2/9] mei: late_bind: add late binding component dr=
iver
>=20
> On Tue, Jul 08, 2025 at 12:42:30AM +0530, Badal Nilawar wrote:
> > From: Alexander Usyskin <alexander.usyskin@intel.com>
> >
> > Add late binding component driver.
>=20
> That says what this does, but not why, or even what "late binding"
> means.
>=20
> > It allows pushing the late binding configuration from, for example,
> > the Xe graphics driver to the Intel discrete graphics card's CSE device=
.
> >
> > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  drivers/misc/mei/Kconfig                    |  11 +
> >  drivers/misc/mei/Makefile                   |   1 +
> >  drivers/misc/mei/mei_late_bind.c            | 271 ++++++++++++++++++++
> >  include/drm/intel/i915_component.h          |   1 +
> >  include/drm/intel/late_bind_mei_interface.h |  62 +++++
> >  5 files changed, 346 insertions(+)
> >  create mode 100644 drivers/misc/mei/mei_late_bind.c  create mode
> > 100644 include/drm/intel/late_bind_mei_interface.h
> >
> > diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig index
> > 7575fee96cc6..36569604038c 100644
> > --- a/drivers/misc/mei/Kconfig
> > +++ b/drivers/misc/mei/Kconfig
> > @@ -81,6 +81,17 @@ config INTEL_MEI_VSC
> >  	  This driver can also be built as a module. If so, the module
> >  	  will be called mei-vsc.
> >
> > +config INTEL_MEI_LATE_BIND
> > +	tristate "Intel late binding support on ME Interface"
> > +	depends on INTEL_MEI_ME
> > +	depends on DRM_XE
> > +	help
> > +	  MEI Support for Late Binding for Intel graphics card.
> > +
> > +	  Enables the ME FW interfaces for Late Binding feature,
> > +	  allowing loading of firmware for the devices like Fan
> > +	  Controller by Intel Xe driver.
>=20
> Where is "Late Binding feature" documented so we know what that is?  Why
> wouldn't it just always be enabled and why must it be a config option?
>=20
> > --- /dev/null
> > +++ b/include/drm/intel/late_bind_mei_interface.h
> > @@ -0,0 +1,62 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright (c) 2025 Intel Corporation  */
> > +
> > +#ifndef _LATE_BIND_MEI_INTERFACE_H_
> > +#define _LATE_BIND_MEI_INTERFACE_H_
> > +
> > +#include <linux/types.h>
> > +
> > +struct device;
> > +struct module;
>=20
> Not needed.
>=20
> > +
> > +/**
> > + * Late Binding flags
> > + * Persistent across warm reset
>=20
> persistent where?
>=20
> > + */
> > +#define CSC_LATE_BINDING_FLAGS_IS_PERSISTENT	BIT(0)
> > +
> > +/**
> > + * xe_late_bind_fw_type - enum to determine late binding fw type  */
> > +enum late_bind_type {
> > +	CSC_LATE_BINDING_TYPE_FAN_CONTROL =3D 1, };
>=20
> shouldn't you have mei_ as a prefix for the enum type and the values?
>=20
> > +
> > +/**
> > + * Late Binding payload status
> > + */
> > +enum csc_late_binding_status {
>=20
> Same here, what is "CSC"?
>=20
> > +	CSC_LATE_BINDING_STATUS_SUCCESS           =3D 0,
> > +	CSC_LATE_BINDING_STATUS_4ID_MISMATCH      =3D 1,
> > +	CSC_LATE_BINDING_STATUS_ARB_FAILURE       =3D 2,
> > +	CSC_LATE_BINDING_STATUS_GENERAL_ERROR     =3D 3,
> > +	CSC_LATE_BINDING_STATUS_INVALID_PARAMS    =3D 4,
> > +	CSC_LATE_BINDING_STATUS_INVALID_SIGNATURE =3D 5,
> > +	CSC_LATE_BINDING_STATUS_INVALID_PAYLOAD   =3D 6,
> > +	CSC_LATE_BINDING_STATUS_TIMEOUT           =3D 7,
> > +};
>=20
> This enum type is never used.
These enum used by CSC firmware to=20
These Enum used in 5th patch of this series by xe_late_bind_parse_status() =
to print the error status=20
returned by CSC firmware in push_config().
Thanks,
Anshuman.
>=20
> > +
> > +/**
> > + * struct late_bind_component_ops - ops for Late Binding services.
> > + * @owner: Module providing the ops
> > + * @push_config: Sends a config to FW.
> > + */
> > +struct late_bind_component_ops {
> > +	/**
> > +	 * @push_config: Sends a config to FW.
>=20
> What is "FW"?
>=20
> > +	 * @dev: device struct corresponding to the mei device
>=20
> Why not pass in the mei device structure, not a 'struct device' so that w=
e know
> this is correct?
>=20
> > +	 * @type: payload type
> > +	 * @flags: payload flags
> > +	 * @payload: payload buffer
>=20
> Where are these defined?  Why are they not enums?
>=20
> > +	 * @payload_size: payload buffer size
>=20
> Size in what?
>=20
> > +	 *
> > +	 * Return: 0 success, negative errno value on transport failure,
> > +	 *         positive status returned by FW
> > +	 */
> > +	int (*push_config)(struct device *dev, u32 type, u32 flags,
> > +			   const void *payload, size_t payload_size); };
> > +
> > +#endif /* _LATE_BIND_MEI_INTERFACE_H_ */
> > --
> > 2.34.1
> >
