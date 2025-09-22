Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BEFB8F345
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 08:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05B410E3BF;
	Mon, 22 Sep 2025 06:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QXHIn/Do";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194D610E3BF;
 Mon, 22 Sep 2025 06:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758524361; x=1790060361;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IQ51p0+plePLZx969x3Q3axY7bMQkfQv2qq4/qAgeJA=;
 b=QXHIn/DogYv+sNf0in6mXsCOlOJxSggJ6XOOgKYqClQrTIEoW6hDxJy0
 O/7ZaygiO4C2SPgQeuRsxKxQ7cAXtUQM0HZDjZybxhv5a4+ju0ngXshjA
 TrD4rCN3wGhGXiQ29do44NSuAy9QNoEOI9u+jQGCqn3UlKFfXm5lD4H68
 9gWJi3DdWoJ1JbiTK1VNQffCuiA9b3f2F4raxUpXJ7De4HnyysSHxUHRU
 GGTh27OfOBAf77TKV6jihCJCQJ3k2J0yhW/m5EO8zZBOYSvWVyNAmdGWc
 YrXNr6SxaH6x25arFBdV05VyRFUnasJJw9/2c2a6qx/o5KZFZs5iF3CSJ g==;
X-CSE-ConnectionGUID: yiHGznJuQcWEYkBX7Tj3sQ==
X-CSE-MsgGUID: UdzXRar8RcubHXQsML0hEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="71404305"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="71404305"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 23:59:20 -0700
X-CSE-ConnectionGUID: 4HW/4YaZSZisTFxK9onsHQ==
X-CSE-MsgGUID: 5Et/Qcj5QqesSuyVtU9BEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="176007401"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 23:59:19 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 21 Sep 2025 23:59:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 21 Sep 2025 23:59:18 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.27)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 21 Sep 2025 23:59:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqZsVZRH7nf/xSF1aRmom1eenxVAmKWBnuvKec+z6BRbBrJtRZgIa8qytKDTHWHgFg2vAbyfF4Q6+zcwIUpJJwdAdKihRZdRqVuEiNU8k5p8YuOmDmL2we76B2QXfZcfuTz3yF0pEXyoRUxxhRs3viLqpgIXQE0/ujaFTnhI+2F4F92vfEmUkf7Yrul5EnpUTHQ1dzYRp4mg7YeDCj7ZS8Mh5nTUzP0we5n68kU6N5rIcmF3yB8ug7EKYLkTWhZ81LZMCHEx0sQ18XytSWPhmlp6DV84WWYZuKxcK/T6SyCl57drUEMWyhpaog6Ar2TGzthnJN9k17PV1PCxWKyuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQ51p0+plePLZx969x3Q3axY7bMQkfQv2qq4/qAgeJA=;
 b=gIYxejILmWMzkpQCuRg21E3GZyW9gG0m3SDmHSGtp5nvf3uyj0EPxya51WwIJvRvyLGeEzlNFZ3kyRZRcqA2snjeyj2Ahl8/Mm6TCV7pndhiORM7FkG0zYfUEYF2YsIsGhwTO2maDfpvXOPhzCDercYEC6OakdVPzC+SOGYryNe8h/XOK0XhGdrGNRpIfYEqOf7e4Y53rYiNQA4x+6e9G9R4zJMsyKKTePXEXMUCvzA3p4pIL+KseLvHs399PXUnKkGfYMuO6wxDPd90j3Q5jkWtzLXrpgB91HThvqoflvVZlg7uC9zTEbs+sYF2mjf+X1Dv7J9ZSn0DXACeMYzGag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH8PR11MB6683.namprd11.prod.outlook.com (2603:10b6:510:1c6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Mon, 22 Sep
 2025 06:59:10 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 06:59:10 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: RE: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Thread-Topic: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Thread-Index: AQHcJhH5Hi/XzGn7NEC5e+4cxcvJFLSWGoCAgAIWItCAAKwBgIAASuAwgAFOcYCAAGQ08A==
Date: Mon, 22 Sep 2025 06:59:10 +0000
Message-ID: <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
 <20250915072428.1712837-2-vivek.kasireddy@intel.com>
 <20250916175709.GA1324871@nvidia.com>
 <IA0PR11MB7185186F6AB160AA7F8F0FF3F816A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250918120431.GL1391379@nvidia.com>
 <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250919122931.GR1391379@nvidia.com>
In-Reply-To: <20250919122931.GR1391379@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH8PR11MB6683:EE_
x-ms-office365-filtering-correlation-id: fd8f2eb1-e02c-4163-e738-08ddf9a58818
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?g9QzWOUrelWpk8yL5W5kvacfcnqP+tv454QXgHmzN/SZW7IPhkmaD3+fpq?=
 =?iso-8859-1?Q?yIGPujLQivDvJgAA/23wKwHJn9CQPEYo9EtpoFiXwU2wrUhdhIyU49BjXT?=
 =?iso-8859-1?Q?W0e1OvsLiW/y8tA2MqDCFRlxWp0Iw+AxQ9FAfvbr80fJz/6L0QsWcUontX?=
 =?iso-8859-1?Q?uiSCe4YM3cUXtZQHMLSNZO8/bJOp4aAr/SXDntqSSCJTUx/IoZCUtr1g6t?=
 =?iso-8859-1?Q?KwlKMZT8KACGS1clRyN/LInlF1J3UrS+/90kl6QOAdRNRMVfLgZs0F5Kge?=
 =?iso-8859-1?Q?9e+sv6b5+Zf6JzrKZ9k2esbujsz4/IHa6hczabm+dCoVM5i6GE2+O+ksfL?=
 =?iso-8859-1?Q?VaJXQVLB3sMsYGvvcdjQ/RSrdXwBbyOzJy6KwGCH79xg8ggNNMNOiw/maO?=
 =?iso-8859-1?Q?TRaHCgTWqRhlIf9WBEYEmYyMJykzz41FF19wNPCaSCrnckyrs+9Hav2scW?=
 =?iso-8859-1?Q?Xfmu6kD5sbO3jZKnAnGa++12oWJKSnFAf4ruEscHaB20CY5DW0Pug9t+0B?=
 =?iso-8859-1?Q?SNBy2TaSMnRKx9QZ7s/X6AM+QXNt+199+k00XcneGFWs1ym/YA1/6uykFV?=
 =?iso-8859-1?Q?xPz8bkKtlmhg9NX5serWT8bNcNFbTrFyUTaubK1oGFD1QzFVrlIBZogUNH?=
 =?iso-8859-1?Q?jUmFkmjKsUluc7EE13TiA39y3AXKoHbbjEMt2Q+zc1uAFpJj/einEdxv+A?=
 =?iso-8859-1?Q?aACGmpDlMOVjHLEcRTDSXBlH1uwEITheYa8ldWyAfAD6YUzXgEN0Pwytv1?=
 =?iso-8859-1?Q?wl7IyFWmJR28MdQRO2TyUAqwnosQAPgAkCYbuPStYyTorOCq9dMXLjEAEs?=
 =?iso-8859-1?Q?vj2wB0ltWTbDvwGYchjCDxATdUrt/EHjjMtJgRmS8id+3WqbaHcRIZG0rr?=
 =?iso-8859-1?Q?nReCePz3ZZjf2IRvYgfEaZuUxR7XGOOhzSubhsNH4d0BqXoMBxbkbk2Tg0?=
 =?iso-8859-1?Q?BuoVzXFbbl88tM388q3codA25jfTzgZtHWBdBD85tGjnx+BgzoMnhctcG3?=
 =?iso-8859-1?Q?NXM9j67hIZ4hgWIKWIQ06Mz9aqw8UFPI/pf6jiNM0BufI1LZhygHgdqhsC?=
 =?iso-8859-1?Q?HdSlbTVOd6bBsO8Mn+amaiT+3RZy3fvfw1bZJ1jiTe6OJ32lgJODa/NvMJ?=
 =?iso-8859-1?Q?0CCoiR6yVR9Z4eeQxivMQKox+pWM2zj2ehHt2IlvzkJE3DUiMVWo0Dcm2/?=
 =?iso-8859-1?Q?awmSDrcF/uSPanLmVBYvJchdeA7Tdb+lkdMlLJMI4HUMnoBVnfq1Ed0cxH?=
 =?iso-8859-1?Q?IfediuLQDvBOjmJmkB0FzbWi7L2VMMb7fPpqOWbn9JVH+FBJ9xd7VWMXKP?=
 =?iso-8859-1?Q?1gqCchcVc430bjFsE302/NHdRlsd2WkJs+YtW46wgNJE3mfMeo885AmFXC?=
 =?iso-8859-1?Q?J0w+W/ObHyz816Jd+tsmh4iN/SR6POGKS7bUsKnClmtxdHFvAk1TS8PUkQ?=
 =?iso-8859-1?Q?/alDtrVSbz/OjTGsOqqMUeIo7VTBg4RWX8RkTzCv3diJqYc32K7Rl00HtK?=
 =?iso-8859-1?Q?U3djifetTHzOhaxY9SwiYTD87XQ1cfxcy/Bg41/iWyatKGhJBrr7mTCeOR?=
 =?iso-8859-1?Q?6MVXbI0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?t6tBKl9IDsHyxcRvQ8qv1irrJa4SdOQzwBqPyV7Qia39H7FmbZsbCPdKfs?=
 =?iso-8859-1?Q?1hriDWoWi2J6d0oZr1Hes6vwsTMIwpQ0G9zfDZaxErMc+4iXQnsfCJMnLD?=
 =?iso-8859-1?Q?72/wb3A5XsbVPXVHEwvnw8SkOEw3wKOwpCNmlvGoysNhyAOZMhl/yqZojL?=
 =?iso-8859-1?Q?u8Ns49xBgaBxpEK5vwdAyeYcsSYrVrNzoPLOgyHYadyCYBj7WdKsd8zwCv?=
 =?iso-8859-1?Q?W+AlduD22c42rsg+qy3RvVjM3g54hnwgbx3cwJJJMa3fjJ+WT/mQUMWH4M?=
 =?iso-8859-1?Q?3wY1Fu+4stLE0VsiAb/MSxBzYVf95EX3LPPv5Wl6XK9sfEScEiMEJQ+Bz8?=
 =?iso-8859-1?Q?eSRLsuDTFfT1lvsLNK8LKea6FSOwzDITBeOIFGnAE7Lu0hzLWTE4WEYlaW?=
 =?iso-8859-1?Q?R7nwFXmJUQ+6d3ffh92lVTHOSPpM1ZPp0Yqn1y4Z7o6gV0ArNBdzSpWVxW?=
 =?iso-8859-1?Q?xKoKO40urP/Ct/IWXMCYoLmRy+0cgGeOLJOXvttFOdAanzX/2ngergpt1m?=
 =?iso-8859-1?Q?xFDw9wajjmY31VNIaLjnjTKFop9xDIVgDORhrlELxuFykUha4z9q3/GsU0?=
 =?iso-8859-1?Q?yPAQ1zznsOm6Zf1Xa8eoj5AAIfVPcJejRLUqYiZhTId63dCbOTX57+beiD?=
 =?iso-8859-1?Q?PeytaY0pnowe/pHImkvrrPQr2e5/bArgBWIRwM85GLFMvdqi2OKq49LkQR?=
 =?iso-8859-1?Q?olQwnI1NhpXWoqCtghUGoqfQSzG/sRFeOgMRi9GEkXjV5p6/8gkLU5kYaR?=
 =?iso-8859-1?Q?ACwIPV7PgPVJ5PofCwCzuCza7oge0mI+KY1j+7iJuo7HHU7PQGJ3lsI92z?=
 =?iso-8859-1?Q?vm2aelq/EtGUWZPRBEStfObCoVmFwwq4D9xSmKw+U+uhdxatsN3Vx9LuaO?=
 =?iso-8859-1?Q?zg9e2W3wOWjIw7v1aSNSTpoI6V7DaaqsYJEOsxYEtL5YcPI/OuC76FmNeO?=
 =?iso-8859-1?Q?RKBXik2vqlVrIjA+SiqMqz2ofsLiX05fWR9+L6y2x07gU3xEx4OCrWIV7o?=
 =?iso-8859-1?Q?A+IHVMvx299iKoTkGnSL/ZZNpPBUCPeUbyVeKUOZV1jhTQxr48gOj5Yefe?=
 =?iso-8859-1?Q?hei93BaQar0iRvKfcSCz/8hac6G1EYzAtJVEAtIOYVbhoA8jwoarqmtQNA?=
 =?iso-8859-1?Q?GTXWeDkoa6zohngfpcW2FYFuXJilkgZfTi1kdR93WUo1Sky3YCgwhFjgk6?=
 =?iso-8859-1?Q?TRblVfAXOL4bX8lIlTj2iZXEMRrs4VhF3piNAgmGj1v83wt3kdKDSvoQOl?=
 =?iso-8859-1?Q?sQqHWFijN38xrl0R346iJybzSC5UAKtnClHyVzyT31AKdavnsiLYIL3YsW?=
 =?iso-8859-1?Q?oM0L/vEjfFOjjsOKgMi8bqUP3tuxdtU3fw62pMo9v4adU8teO+xthoVFIl?=
 =?iso-8859-1?Q?UOLVetR6p515lW54h+wj7D1cnnRHUEThGihr0MRh+kyHQK1tTr8O0ZvjGH?=
 =?iso-8859-1?Q?J23aTNCyk87oHe7ata+gMBjYwChitW8KhhDH1SwmuMvZi68x5fwyTdAl8a?=
 =?iso-8859-1?Q?pkBwS6TfaZwGmU84GJ783YHcTpD/TgvWhqbTTexm2B78yUoJwODfLHxsTq?=
 =?iso-8859-1?Q?MJyZ4lH9IItCoHx7E6+9EA8Gjz0qnA28odFvjRRoX8xOO73JQ8DEutxZKZ?=
 =?iso-8859-1?Q?/fzYEvPU7T+lyafOrTKodCzX9SCfaH6ML0?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8f2eb1-e02c-4163-e738-08ddf9a58818
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 06:59:10.4590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DVkdZcFNHR1TCHbqyCl5f3gVQMZ2pMmnfFnLRHlwG24M5esopZGCH8gLCQClDaAOnAI9+bTi939BhgJENK0R0WTd9L/YcPjC9FUN8pDmFNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6683
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

Hi Jason,

> Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for devic=
e
> functions of Intel GPUs
>=20
> On Fri, Sep 19, 2025 at 06:22:45AM +0000, Kasireddy, Vivek wrote:
> > > In this case messing with ACS is completely wrong. If the intention i=
s
> > > to convay a some kind of "private" address representing the physical
> > > VRAM then you need to use a DMABUF mechanism to do that, not
> deliver a
> > > P2P address that the other side cannot access.
>=20
> > I think using a PCI BAR Address works just fine in this case because th=
e Xe
> > driver bound to PF on the Host can easily determine that it belongs to =
one
> > of the VFs and translate it into VRAM Address.
>=20
> That isn't how the P2P or ACS mechansim works in Linux, it is about
> the actual address used for DMA.
Right, but this is not dealing with P2P DMA access between two random,
unrelated devices. Instead, this is a special situation involving a GPU PF
trying to access the VRAM of a VF that it provisioned and holds a reference
on (note that the backing object for VF's VRAM is pinned by Xe on Host
as part of resource provisioning). But it gets treated as regular P2P DMA
because the exporters rely on pci_p2pdma_distance() or
pci_p2pdma_map_type() to determine P2P compatibility.

In other words, I am trying to look at this problem differently: how can th=
e
PF be allowed to access the VF's resource that it provisioned, particularly
when the VF itself requests the PF to access it and when a hardware path
(via PCIe fabric) is not required/supported or doesn't exist at all?

Furthermore, note that on a server system with a whitelisted PCIe upstream
bridge, this quirk would not be needed at all as pci_p2pdma_map_type()
would not have failed and this would have been a purely Xe driver specific
problem to solve that would have required just the translation logic and no
further changes anywhere. But my goal is to fix it across systems like
workstations/desktops that do not typically have whitelisted PCIe upstream
bridges.

>=20
> You can't translate a dma_addr_t to anything in the Xe PF driver
> anyhow, once it goes through the IOMMU the necessary information is lost.
Well, I already tested this path (via IOMMU, with your earlier vfio-pci +
dmabuf patch that used dma_map_resource() and also with Leon's latest
version) and found that I could still do the translation in the Xe PF drive=
r
after first calling iommu_iova_to_phys().

> This is a fundamentally broken design to dma map something and
> then try to reverse engineer the dma_addr_t back to something with
> meaning.
IIUC, I don't think this is a new or radical idea. I think the concept is s=
lightly
similar to using bounce buffers to address hardware DMA limitations except
that there are no memory copies and the CPU is not involved. And, I don't s=
ee
any other way to do this because I don't believe the exporter can provide a
DMA address that the importer can use directly without any translation, whi=
ch
seems unavoidable in this case.

>=20
> > > Christian told me dmabuf has such a private address mechanism, so
> > > please figure out a way to use it..
> >
> > Even if such as a mechanism exists, we still need a way to prevent
> > pci_p2pdma_map_type() from failing when invoked by the exporter (vfio-
> pci).
> > Does it make sense to move this quirk into the exporter?
>=20
> When you export a private address through dmabuf the VFIO exporter
> will not call p2pdma paths when generating it.
I have cc'd Christian and Simona. Hopefully, they can help explain how
the dmabuf private address mechanism can be used to address my
use-case. And, I sincerely hope that it will work, otherwise I don't see
any viable path forward for what I am trying to do other than using this
quirk and translation. Note that the main reason why I am doing this
is because I am seeing at-least ~35% performance gain when running
light 3D/Gfx workloads.

>=20
> > Also, AFAICS, translating BAR Address to VRAM Address can only be
> > done by the Xe driver bound to PF because it has access to provisioning
> > data. In other words, vfio-pci would not be able to share any other
> > address other than the BAR Address because it wouldn't know how to
> > translate it to VRAM Address.
>=20
> If you have a vfio varient driver then the VF vfio driver could call
> the Xe driver to create a suitable dmabuf using the private
> addressing. This is probably what is required here if this is what you
> are trying to do.
Could this not be done via the vendor agnostic vfio-pci (+ dmabuf) driver
instead of having to use a separate VF/vfio variant driver?

>=20
> > > No, don't, it is completely wrong to mess with ACS flags for the
> > > problem you are trying to solve.
>=20
> > But I am not messing with any ACS flags here. I am just adding a quirk =
to
> > sidestep the ACS enforcement check given that the PF to VF access does
> > not involve the PCIe fabric in this case.
>=20
> Which is completely wrong. These are all based on fabric capability,
> not based on code in drivers to wrongly "translate" the dma_addr_t.
I am not sure why you consider translation to be wrong in this case
given that it is done by a trusted entity (Xe PF driver) that is bound to
the GPU PF and provisioned the resource that it is trying to access.
What limitations do you see with this approach?

Also, the quirk being added in this patch is indeed meant to address a
specific case (GPU PF to VF access) to workaround a potential hardware
limitation (non-existence of a direct PF to VF DMA access path via the
PCIe fabric). Isn't that one of the main ideas behind using quirks -- to
address hardware limitations?

Thanks,
Vivek

>=20
> Jason
