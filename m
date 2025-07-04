Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDCFAF926A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 14:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B2A10EA13;
	Fri,  4 Jul 2025 12:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGmt/Kl8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698D410EA13;
 Fri,  4 Jul 2025 12:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751631720; x=1783167720;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jQvRZMEII0PHSKQP90bzx8jlPwv4cLqQn7C+SNMWSvI=;
 b=JGmt/Kl86K+Ul608PApiXiXtP8q0mfYCKMXFpVVhE7DYyjifAHO1wG/R
 cmbuZM+YtDyivK6WJ1404dutn/HZThdJmb3PykCj00ublhvNA+r/gtGrz
 tMFZoQkWL+8XDkhx3KP2VLs4Lhn7EBFlj/JZXbs1pWY5ipBO4BCJR6twz
 JgDoB5M9FLCuFc+OtykLgAbNeculq+b/m/2G6ao/Z+cIMeRAcc8rNGHwT
 fLMWhsvW85XPlG2WHFG9bd7c3PTPQdYC9WEpuxbqBmryvy6dmOGdpLbZx
 8R3rnxQwiqzrJQmh6o7GtBbQWAmsjMmi8DGm8RubdQ/AOEDYa1MaZOD0w g==;
X-CSE-ConnectionGUID: P6V7hCgYSTa8ZKf/4w4F9A==
X-CSE-MsgGUID: PbPEkDCnSuu51LEKBCnsxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64658066"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="64658066"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:22:00 -0700
X-CSE-ConnectionGUID: x960mZr/QyS2lV6Bwul90g==
X-CSE-MsgGUID: VDmP5pOeQkqERwzOBB7qtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="178297832"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:22:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 05:21:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 4 Jul 2025 05:21:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 05:21:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHR/bwcerBIbLRsS1JFCg1E6ExBBA4v07b0S8Ubgp9zrtXa4gwyMVQjL5lsABaIbDPz/h/XD6noiGanN+Sqx+DpGMC/BaQBkEp8WfTnMJzfkCyglO2gUpP5HHbYHfAnxsHUJpPDS2mvBlYugjQdsehQtkq3lc/rNSZtfbyIauV1/JoDpU5cAwP1zrMkNksFx9CRZ1HuI2RgmhlFBJoYy/DKiWn4hoY3Ghwfe3eXShWZMJsiEAAM0tN2qBQL6Q6Jrp+ZUI2c2k2IWlug/tCgPNwFGsEcYIoEahRi4ZpUd6iz4MtskXrnVQUEbXqDMkLE/ymrNoIk80wOthskHasQ/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJjK5Lu/76Gnhg6jRJkB4q+0XLDKlMViRGQ3APbFmxU=;
 b=ohGul6crS3eUVxxWt6vmplkI+t1jfdUhlOcAygerG0/gNm1E8Syoe2A6vOa906YoFlMnRQxf3nj4NcA9ui55n27LMiVmW9ekHmB/AcFYL+g1VTcRE9wucWGD9H/Jrtpl95PkmVDjrnFfAmv7CI4UYgjl54z/emtdwBhfpxoOovhzpZBTwE+YS1Esx9YBNyKgqa7Nd3TWep+pvq5chWvGZbGDWS1tuFgDLHr2bcz1HdfcC7zs3QbGtpfZVO8OVkezaeMLK0bAEEdSvJxjHMEFUStkvutuBGN13ylZ6WPEEwfWifUpqNTsMUhxRg50jS3ubhA1QC7l45Qnr/Q5zurrmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by CH3PR11MB7795.namprd11.prod.outlook.com (2603:10b6:610:120::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 12:21:42 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 12:21:42 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Usyskin, Alexander"
 <alexander.usyskin@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH v6 02/10] mei: late_bind: add late binding component driver
Thread-Topic: [PATCH v6 02/10] mei: late_bind: add late binding component
 driver
Thread-Index: AQHb7FB2fXDElcAcw0OxxHsHQb3qz7QhbIeAgABX8ACAAAE2AIAAFOQAgAADXQCAAAPmwA==
Date: Fri, 4 Jul 2025 12:21:42 +0000
Message-ID: <CY5PR11MB62115F7951B6045CF254B6A19542A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20250703193106.954536-1-badal.nilawar@intel.com>
 <20250703193106.954536-3-badal.nilawar@intel.com>
 <2025070421-cattishly-buffed-d992@gregkh>
 <0b40eadc-c763-4cbc-910d-cbeb03b432d4@intel.com>
 <2025070452-rendering-passover-9f8c@gregkh>
 <fe774af5-76fb-4056-9eae-e2ccb0e0f078@intel.com>
 <2025070445-brilliant-savor-a98e@gregkh>
In-Reply-To: <2025070445-brilliant-savor-a98e@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|CH3PR11MB7795:EE_
x-ms-office365-filtering-correlation-id: b91c4c38-df9d-4a9a-7048-08ddbaf555c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?f2mHl6zQ9sJ1Kw3rfyU9NCgrXUCr6nzTF/0NdSWb0e4RYp+4vSShaF7oyu?=
 =?iso-8859-1?Q?hpJ1XBJdBKtonBRpxIFV5wOpXx3dz/+WuhQiyseMhbFzo6Symb+kNxFpOO?=
 =?iso-8859-1?Q?SX8bCWyL2eM0dgS/COmNBNQybuAXCQ/PLBbRar0t3yQs0xacz4ZJ3z1qzn?=
 =?iso-8859-1?Q?H7j7fRndWpq9ty8yqcE1JS1UVohBBKPOxS3msDd8/c1Vfot0Evn4p2YyMt?=
 =?iso-8859-1?Q?alY8y8Tuwm5mEXh1MZOejtjdW/N4zVswjQEpcJnCjOus7Y8+MG7iDw7phc?=
 =?iso-8859-1?Q?Wx3xuaMVN0i/8d1CwRRjHVwW5Z1vQ71CCMC9D83iEF1uIIWxeDtNY8M2Z8?=
 =?iso-8859-1?Q?nWzxKlMzsaWNaFSPNBbX7ltTRcwuUjik7LgOUhtJHX3MKdVwVQKsKU/ZZR?=
 =?iso-8859-1?Q?HDNRPSI/9ouT+IjWjKqh6Mw3HXCb0o222n9U5h7DUC6CmrJZKSzD7VdCEB?=
 =?iso-8859-1?Q?IOvgoIPDv/aeuE+KVAptOBKVWaFWwPkjI68+dETsWGVzkOetI9IA9VtVOI?=
 =?iso-8859-1?Q?Av4XZht/i+iGLjTkdJ4uGUOoCL+FeKlwbb+JJ3JPCbHnnTKImdU6tVC70u?=
 =?iso-8859-1?Q?u+fT1/V/3yxEPkRGRxoynf1dhRygDkxJkcuDIRMResD1PxJpl0/rBPelUr?=
 =?iso-8859-1?Q?XO1SqSOe0I+ehVCuiOmwqkCiI9nawCOLzVX7K0B6x9EfdzGwrZxWiENnRb?=
 =?iso-8859-1?Q?YjSzUTtaqr/fSxCPsgOP0VxoN0r0+jLNukqSh9PVgrNpjsRZgqDk7gCwQg?=
 =?iso-8859-1?Q?tyjZBwYcHYhNsJT3U5vMKOirRd8zAyKVbNM6ynPlagPWxPD3gJWdyA1ZR6?=
 =?iso-8859-1?Q?CH1aRTk+qTqKB0ejtmJv+O7kLAm9QrENptK9WGGnQKGEmXej0OwpcyPrjF?=
 =?iso-8859-1?Q?k8P1kO0w/G660dqHkxjDltk57Qz6Un2b9XmaBf3l0bKmLp0aet3IEvD9Id?=
 =?iso-8859-1?Q?pbqg6OZWoEZk1BF/sgWGfApSaWJizeXSXCoOpJvuHJGMLMCOMcQsS4onQX?=
 =?iso-8859-1?Q?G9D0DUF3yOknujhE/ztGjBVNEK9zd/QVm20ZBWWsMMkvjjvfcs6lASdENe?=
 =?iso-8859-1?Q?EjDWTGAZRewEMZt45NvzuXlokwytz7x0NNgs6J0q+rDb2/srKVblrYTNZe?=
 =?iso-8859-1?Q?AT4/peGWHSHdeh1JGrsnXuU3BZSX+Z61npGFWj86tuJzRIqCGgeW+fpl0k?=
 =?iso-8859-1?Q?bd3S3hQELu2iLtcbyP+4nKk6JAAebHsWOpnHr21UVjf1YNFzrqu6VgQz7E?=
 =?iso-8859-1?Q?HL/b+t1f8JBToso5fEJqpc7i67nrgZdJIw41Gvc9aJGY2QPTarvH6bzQj3?=
 =?iso-8859-1?Q?kGyhH6B9lfqz+PJNS+mmDv+K7+tyO++96+aAW3s8BscXKjYdH46IlVDgo/?=
 =?iso-8859-1?Q?r0KNZIYS37L9L8xPevQi8HJgu1qbpDUcMljtqcznwVV8hmkMDNE9BD95k7?=
 =?iso-8859-1?Q?FcjUS4JyB2ybsvchX6SH0Ime+cKGxEr7leBxhZNvI9Z/0c+S8DUvaATOOb?=
 =?iso-8859-1?Q?AIuuAkIk6vW3XCVcxXjxuQQBHDPJF6vMpUqw1r1bQDh8z7PoLLdQC79VI6?=
 =?iso-8859-1?Q?T79+LNY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?faLpfulynrPCsRaYauhzhLWUrkmeZcNOPFgkEVMxh5J1dSehBqyGN54RQZ?=
 =?iso-8859-1?Q?TeCuhvCzje3lB3q1HUgPDidkFnpZK+AzfZiuuX2G+LeJcbqiTlurOV6r1/?=
 =?iso-8859-1?Q?UMoNzKOOabVIJQXgW+16+Keb0vT6pvl83+zdPhhN2Tuj3e2yrX9YTnsL6r?=
 =?iso-8859-1?Q?36P0PnL+XfVIJh1im21ijYAMl7ure6KS1vqXQO+9aPKhoiBlBZcyD37PhB?=
 =?iso-8859-1?Q?nVS1Yn+Iw9RGnwoKd9un2sw44ENWyvwKhOkNeV6wVtXcEhTf+RCFf7vBgy?=
 =?iso-8859-1?Q?InaZVB+GAo39uzDGLQavtd4RavKq4CTsBJQjUsm9SaU1Tz1U5eS2iiYXfN?=
 =?iso-8859-1?Q?nd5LvNNe3RQ94kEacvKYD4dXktK1uO2M/OuacMr43bYff2L4GoxPIPO6xj?=
 =?iso-8859-1?Q?1I9lqcWRvmiTxc7WMOOTh9gOmFxwNwBZ/2AEcKMk3BbIcrTyfIApF/7kW+?=
 =?iso-8859-1?Q?ialcbb72ZA8s5xPyj2syoJUYKpDdTCCXFyKeV01QRztnSC2hToNw5BdZqe?=
 =?iso-8859-1?Q?WhmRvJUdOn8aAKbQVq3i3bTkuNb+ya2fJrIGM5kehvB9oM/NE2Dq5nHyHy?=
 =?iso-8859-1?Q?ygTobO/sIp62KQVeBoWh5cg0PqS/xn/Cov2xqBFIC0E1It+lYKf/PZzrCM?=
 =?iso-8859-1?Q?q/GfwSA9BnzgKUZtcanLUbDph7CgQ/t+DM2pGj3Ja2s5GU4802vfhJLVKL?=
 =?iso-8859-1?Q?+j3boompch/GUeqDx+jlzN8MO9TJRYLGVmIheXzcAHj9tYb4qM55LjpVi+?=
 =?iso-8859-1?Q?MV2uosBKnaLXXT5p6GcjiO6wsHbXqTi9OByUr1UvGDjWkSWdS2eDMWvmec?=
 =?iso-8859-1?Q?xVbDPvwTsGMHkyoxi6y+WZ8DkDJbA2aqUKurGPqF0b+w2O2LWQNuWfHxOi?=
 =?iso-8859-1?Q?IX2puTdm8fD+jJsbS4KkdCoM4ZPpsJkrq9y96TmczW43AzsBkQbSdhJNZy?=
 =?iso-8859-1?Q?1lrKCQFt0yxOtj/HtP6hrXY65ki4pyx/EL4ne+LFNRoxKbLimTq5MWll4i?=
 =?iso-8859-1?Q?uGDapr/5Vxxe4K8sd+DN39zoSFnMdQPG6UavHMkFfxaQ6cFvcfjlShIlWz?=
 =?iso-8859-1?Q?CzKPg9DkO6yqpruon/tkzxDUMucKqg/wgzI+UsxqoyZTz3Z0a8H6fuIG9l?=
 =?iso-8859-1?Q?q6JTBIO7V0tDHzmf8b9DYkHBk1CnLOpUg2fRneIfV9QazaBeA+KAdsUyjM?=
 =?iso-8859-1?Q?GF/fjBq8D2V8pWmDUAteC6ppTaJbPwBD7EFiGiIqLxQsOm13OjltTwyi7d?=
 =?iso-8859-1?Q?MpbIhpYCEJumaCK5L/NG8I0X/LnuSC24bTVSs8Flxw8kr7GOHdRZH8CLDZ?=
 =?iso-8859-1?Q?R5sebbQ4uBAq5127DDLWICz1Vnh+Yk9l0hpBDy28juZxh1Y8IU2/dLmNfd?=
 =?iso-8859-1?Q?GC5MoUjwcVTpGPMa59xek0Labq/1HgC0JRBuvgSCpXP0WGs3Th56vnUihA?=
 =?iso-8859-1?Q?vfMEQmubbEC+F9d8clJ9fP8cJJJZFBi5BnOTO52Y/LN53z9eUDAWC4mDJJ?=
 =?iso-8859-1?Q?eXXpaKX+fLRlJzb89d3ptk63yvv9PH6H1uw5CYuIdCqHlH05Av6da9Pr4t?=
 =?iso-8859-1?Q?iYGmwly0n+8AKf7CSV3DSDASEx8jqUpoSh2W5GScQ13Wj+IxTwmf3O7bdQ?=
 =?iso-8859-1?Q?tzjR7N0yVQkuaDZi6HB20pcbDvUM/Zmp3h?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b91c4c38-df9d-4a9a-7048-08ddbaf555c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 12:21:42.5028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +p0TRySgPonhFbDphQ80o7V+4dCL2guhXo/lEwny4XWDNsV1yuEzS1qQqZOwSeHAXdjBS157fiRQwQjwQpfMNycQdOecdlL4c2oZfeyfmkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7795
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
> Sent: Friday, July 4, 2025 5:31 PM
> To: Nilawar, Badal <badal.nilawar@intel.com>
> Cc: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linu=
x-
> kernel@vger.kernel.org; Gupta, Anshuman <anshuman.gupta@intel.com>;
> Vivi, Rodrigo <rodrigo.vivi@intel.com>; Usyskin, Alexander
> <alexander.usyskin@intel.com>; Ceraolo Spurio, Daniele
> <daniele.ceraolospurio@intel.com>
> Subject: Re: [PATCH v6 02/10] mei: late_bind: add late binding component
> driver
>=20
> On Fri, Jul 04, 2025 at 05:18:46PM +0530, Nilawar, Badal wrote:
> >
> > On 04-07-2025 16:04, Greg KH wrote:
> > > On Fri, Jul 04, 2025 at 03:59:40PM +0530, Nilawar, Badal wrote:
> > > > On 04-07-2025 10:44, Greg KH wrote:
> > > > > On Fri, Jul 04, 2025 at 01:00:58AM +0530, Badal Nilawar wrote:
> > > > > > From: Alexander Usyskin <alexander.usyskin@intel.com>
> > > > > >
> > > > > > Add late binding component driver.
> > > > > > It allows pushing the late binding configuration from, for
> > > > > > example, the Xe graphics driver to the Intel discrete graphics =
card's
> CSE device.
> > > > > >
> > > > > > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> > > > > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > > > > Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > > > ---
> > > > > >    drivers/misc/mei/Kconfig                    |   1 +
> > > > > >    drivers/misc/mei/Makefile                   |   1 +
> > > > > >    drivers/misc/mei/late_bind/Kconfig          |  13 +
> > > > > >    drivers/misc/mei/late_bind/Makefile         |   9 +
> > > > > >    drivers/misc/mei/late_bind/mei_late_bind.c  | 272
> > > > > > ++++++++++++++++++++
> > > > > Why do you have a whole subdir for a single .c file?  What's
> > > > > wrong with just keepign it in drivers/misc/mei/ ?
> > > > There is separate subdir for each component used by i915/xe, so
> > > > one was created for late_bind as well. Should we still drop late_bi=
nd
> subdir?
> > > >
> > > > cd drivers/misc/mei/
> > > >  =A0 =A0 =A0 gsc_proxy/ hdcp/=A0 =A0 =A0 late_bind/ pxp/
> > > For "modules" that are just a single file, yeah, that's silly, don't
> > > do that.
> > Another reason to maintain the sub_dir is to accommodate additional
> > files for future platforms. If you still insist, I'll remove the sub_di=
r.
>=20
> Move files around when it happens, for now, it's silly and not needed.
>=20
> > > > > > + * @payload_size: size of the payload data in bytes
> > > > > > + * @payload: data to be sent to the firmware  */ struct
> > > > > > +csc_heci_late_bind_req {
> > > > > > +	struct mkhi_msg_hdr header;
> > > > > > +	u32 type;
> > > > > > +	u32 flags;
> > > > > > +	u32 reserved[2];
> > > > > > +	u32 payload_size;
> > > > > As these cross the kernel boundry, they should be the correct
> > > > > type (__u32), but really, please define the endiness of them
> > > > > (__le32) and use the proper macros for that.
> > > > If we go with __le32 then while populating elements of structure
> > > > csc_heci_late_bind_req=A0 I will be using cpu_to_le32().
> > > >
> > > > When mapping the response buffer from the firmware with struct
> > > > csc_heci_late_bind_rsp, there's no need to use le32_to_cpu() since
> > > > the response will already be in little-endian format.
> > > How do you know?  Where is that defined?  Where did the conversion
> > > happen?
> >
> > Sorry, I got confused. Conversion is needed when assigning the
> > response structure elements.
> >
> > e.g ret =3D (int)(le32_to_cpu)rsp.status;
>=20
> But these are read directly from the hardware?  If not, why are they mark=
ed as
> packed?
Yes, these are read from firmware, that is the reason they marked as __pack=
ed.
IMHO, don't we need change the explicit endianness of response status to ad=
dress your comment.
Are we missing something here?

Thanks,
Anshuman
>=20
> thanks,
>=20
> greg k-h
