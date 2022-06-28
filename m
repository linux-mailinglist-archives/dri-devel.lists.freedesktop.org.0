Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 998B255BEFE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 09:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C6710E5A0;
	Tue, 28 Jun 2022 07:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7588210E4A4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 07:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1656400443; x=1687936443;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wNKTA5hH7f4OaxxJZYVO+xweOYGITLosZ1WkX/gxAOg=;
 b=nxX1yqNqOg24CxY0qaC9EQcLG9BdGDEqqOk4rpEEdyKTRCq6f16hTBlL
 Z6zwEiElr92xhalfoEApURoDAMmKWyv8P+iAIKPOeZFwo2cWSmleE1iuJ
 Sm63TYM60rQt0v2QEb6shp/iDgkS6OMxtqADh/19sM/kvtjdmu8hirnJJ
 2RtMM46b26vK90IPwrHS07Fk0HrG0cwjV6S9ZGNOhzwpFIPgFcLyNIzSx
 pPXJtxaDpret/mMrqXuw9hGR4Fru8VH/SlcrqWiLfLWbK5LoRBqkZgOfB
 QVcv/UZboD7ulwLIvS1f+Fpnt2XiygeXsN0DCQbUEzNmIB+xDtEC0KwHp w==;
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="179795308"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jun 2022 00:14:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 28 Jun 2022 00:13:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 28 Jun 2022 00:13:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRz2sJX+dDalvx3dImz8hMB8UJ3vRpCYYnP6JOfecKQhnpAe4rR6xnGLPlWnqmcJfwxR8eL8qu6isnwKTGQaDK0pmevx/sWPsDAqvMU2yO24XUA74yi2X5Qhegvdq2Bhx/sXHANnB/ZscYaQ4Z5KUstdbw4ZXJLWHqTrergCkVqFNe52HoRpb5bUjunrRA2YxxbSQ2/TBYM0HQlEfDw7943v8Zv0ioUsiEsC/xTk6i2YOEHsaHiwGPCOMHot5DP68brjMMbvaE/MWHcOPEZMV09XYnGnHLy3j7zapCBud+BlLcwH3XL4cYY831gAG8+A1TKG4P2rOL661uYgnvmQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNKTA5hH7f4OaxxJZYVO+xweOYGITLosZ1WkX/gxAOg=;
 b=F7zg7r5v8ynqxQE9quR9PQ5RHEJ+hZ2C1nRNGe6reZHeu0C6shWsCIriW+4yLbftD9+mul5scePGFihz998B8Xie9a8An5pBgL1sK4wJakX/csPK9TJN/Y/UfMAg3A7oblFZ2Ku6+qBvl52ytNTHHCXeL+NBABrJzYcw7QGoD3QPedCU7r5/S+8nAAMFU4C956/vAW/FQyUANQABak1PVRahyyk0SXzK29jhtwcZKfv9FbNZcoaVt7RXKifKwUStrpFELjO5LphA71U4IS2gBlihLhjrf45nGszs8n5N0MmNQL2nBNHWU6Jahhxynh+UTNFAPXkm6J9UUNF5+uay7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNKTA5hH7f4OaxxJZYVO+xweOYGITLosZ1WkX/gxAOg=;
 b=KDxrMQWh5OJ32w5zmyX1vIJJKSVW2xn8TaDgYIOwaM4D3aiu9vZ6m1eh92QMragFQrfs8PA4C8fQRLz9tGV+Dy+zlW0o9Db6Jgh2CdC1mO4BObkddz67k70Q9WzD7H1tpj6pcHkW46Zd+ZCIiuOrDp1krj0bhNj0DcYWnuNRFHQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR1101MB2113.namprd11.prod.outlook.com (2603:10b6:405:51::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 07:13:44 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 07:13:43 +0000
From: <Conor.Dooley@microchip.com>
To: <geert@linux-m68k.org>
Subject: Re: [PATCH 04/14] dt-bindings: dma: add Canaan k210 to Synopsys
 DesignWare DMA
Thread-Topic: [PATCH 04/14] dt-bindings: dma: add Canaan k210 to Synopsys
 DesignWare DMA
Thread-Index: AQHYgw9+LDzD+WbZ2Eu77tOt94oRs61j9VOAgAB1sYCAAAqdAIAAAWuA
Date: Tue, 28 Jun 2022 07:13:43 +0000
Message-ID: <1c8da6c5-bf42-0112-3828-0f86d9b8665b@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-5-mail@conchuod.ie>
 <20220627232919.GA3158390-robh@kernel.org>
 <40d76866-34e3-baef-c3fe-8836cd2430f6@microchip.com>
 <CAMuHMdXjXGBi8S+bTG105q63zZw2ScQb9nXBSp2baiLNWKQAkg@mail.gmail.com>
In-Reply-To: <CAMuHMdXjXGBi8S+bTG105q63zZw2ScQb9nXBSp2baiLNWKQAkg@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d64017b9-6551-4044-f4d6-08da58d5bc6c
x-ms-traffictypediagnostic: BN6PR1101MB2113:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lb5q4e1umrKV8yYzGNnKjiBErjlK9WvyAWOVkeoJuXHQxDa2jsWXXCP0+fmARXg8emPDeU+Se4hypX9PkGqgKLjuUY8d9UIq2EqVagByQbyY2N9tebhD37vxoT3QC79NotQudna7XK2FtyjHRoGcGbcFN2ug3m0O+5+0B9D4acszZPsXGSDctw87YVqyNPegWlrjph9PE6Ye10VR7M/m7r+sx9GMvOAtF6SWDalaZ2IDDUpuHfAHFGmuv4aSIoZmwK9sgKhZGEF885uvVxaoSOXDLoKO1qVsg5K3tUdveIsbk9eASvijU0zgaiEW5vWQTff8q+T6iWuMACHlP5Ou4Tyr/4DfgS9RhcPs36RBw/KyBthV9/4ePbXCjPfH2t8oy0e5sij0zXg8aLTdBYoe2+zWlWSMKbN0EzX2vYx8VJbF6y+VXP2b4ku9jxPnL2SaNV87vicfe6hhHdPwdvj1IZ2jnvEUyQ3am3e2EmUOvHBbqNtmzhu5JRrPmmiIFAK2arpWRuZBrehZvgpMkpnSbZUYjxCzEWJNprPQuXDhPQ4Z739XsAVFYALykITKjsBkr0eHD2QP8sQqCyfg/7Pja/b7YSzDDQ4gwI5bhN5kh3/Wi9PJ+nmNC1wA69qgWHxy8Xw7CG5mIEV77oaKjOY5qYmo1ac373g+DLYhJOuvCjS0nwwf+gKvSLY/c48n5UV6dYFKIHBNuM9thh8KsxgS5eF9g1MeOJjfS/0b2YZAlj1oWMBhWG+uihRH3xjnh15BVxILhGMId8nd5GQ84FPBx0AoHYQ8J1sdcVCBgxewL0hHqD7hcE72TyepWbGv9MVwhMK7q8yIRKMyLqU67HhMmHmEdYZHOOib6H1MhMQoXpQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(39860400002)(396003)(376002)(366004)(54906003)(2906002)(6512007)(4326008)(38100700002)(64756008)(8676002)(7406005)(6916009)(316002)(66556008)(66476007)(38070700005)(8936002)(5660300002)(86362001)(7416002)(122000001)(66946007)(66446008)(91956017)(6506007)(26005)(53546011)(478600001)(71200400001)(4744005)(76116006)(31686004)(6486002)(36756003)(186003)(2616005)(41300700001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0lXdVBFVE9NN21QKzg5cnROc2xieUNncTJEdUVneVlIejdHc0NsMGVORlpG?=
 =?utf-8?B?ZWlCVXNFUzBCa2p4OU90T0NCajlZR2UveE9mNWNOTEJsZjA0WWNJSmxtRmlI?=
 =?utf-8?B?WXFkS2xVeWIxQ3pZSEJPV2FvakZDckN3L1l1dVJnWGJtdGtRNE5hRXFoWTdP?=
 =?utf-8?B?NGFvbnBaT2RGUkljdzFXekNPS3FvZ0JMSnM4am5UUmdpeGhSREF6YlNIcGpS?=
 =?utf-8?B?SiswcTRlRzFPYWZZTmQrYUtoNjJ0eFpkOWltejBwN3JTQ3lyK1lNM2Y2RGhN?=
 =?utf-8?B?cm1EYXpiVE5McFI0WlZRQ1poZENxaUtQR3FUb2lRUG84eVpZRUM4aXlOSFBm?=
 =?utf-8?B?cFZSNFdkanZYZFd0ZFhodUMzd2JUaktqeVlIU0tyVlRTeTlkSlhHYzJHaVUx?=
 =?utf-8?B?bDlyL1NIbDBkTnp2R1J4cGdENUMvd2krVXpWaEl3WTZWa2oyeEtvNEYyU1Fh?=
 =?utf-8?B?S3FjLzdYQysrZVRhL3FHcmtQOE1GTFJ5Rm9UUVFYQlJtSy9HazRlb2xBMTJY?=
 =?utf-8?B?VU5yZG9Nczlib1NzWHZ2MnR3VEdKU0pnNmdFdVlTdGhCK1JGTmJjRmx4VElD?=
 =?utf-8?B?dkJaeC9LZFJxSVA4Q1ZXeWNjd09EREg1M01GN3djK0dac0pQOU05VURIbUxw?=
 =?utf-8?B?Q3B0RTJTVlQxL3V1WldUZmVwbFppaUU2THBEZVV5VG1pYVIvQXF0ampwR21K?=
 =?utf-8?B?QmF1WWZEVHBUS3I1Yk50SVJvVTVuOU5pOXo5MDlEckVKb1Jya1FzY2lxalRw?=
 =?utf-8?B?UmhDNEhzc0JnSjVQZmc3UU81ZkEzdE1WSDR0NXdyK3VwOXN2WjZWUzRyUlJm?=
 =?utf-8?B?L1RlUnN3SjVRaTQ2VFBUbGpGdHRNK0FHNEJIa2ozbVFYQmNFU2doV2gwOCtM?=
 =?utf-8?B?bmZCa3VEY3RDMk1GcDc4cUh4ak9meUExOWt4ZFZ5ZlRGcFJuTVdzSnZMM005?=
 =?utf-8?B?Z1JCTFJ1MlVLVkR1K2s0QmlVRml5NHhQZkg3Wm5ybTZubHphMkx5V2hEbmc3?=
 =?utf-8?B?emdoRWZUTHIvSlhnYUxIOE1RaEZ4eG14SWJFNzRuc2drVDlDek1PVUppcEFY?=
 =?utf-8?B?cVJSR2xmZ2F6TEFuV2lza3FNMWdMZXE0dXA4S3dOdW9pVEpWOG1MblI4VDNn?=
 =?utf-8?B?N2pTUnNVeUgrQk1HU1FNQitGUjBDQjRQcEZGUnJSMkttQ3JRMVJUeWhCQXZC?=
 =?utf-8?B?Z005OEtEdVFrc3dyM3crOStUMmYyc3VyZ1FBSkpDOTc3TElJTFFhR2xWd0sz?=
 =?utf-8?B?bEg5L0dZMWh3dUVEOE1WcGlLRFhia3Q1elFqd2xsdmRBR3FvYTllZGhCZ3pX?=
 =?utf-8?B?ZWlveU9kYW15M0RlVGVzZlN6VmgvQjVidzZpdWloYUlEQjlVV1lXK3FVUzZn?=
 =?utf-8?B?aXFDQzYvN3c1YVNQYWw4K2UxeU10Sk14cnJOMFY5TmZBMkZGL2pObW5SWUEv?=
 =?utf-8?B?MXBrMEFhMnpQZWp4b08rNlZqQ25XNGNoNVI0L2hvTkNkNzJEaGx3TVpPV3oz?=
 =?utf-8?B?WTNqdFo0Y0ZMcHNnNUtMZklzZnBvQVNxeHNDZUVvYjRxZzNUTXVuQm85ZFNo?=
 =?utf-8?B?Tm0zazFYbnQvakN5VFdtNmlnaUhZT3A4SEZpdEZjVTZIN3Z2VVQxQmJZVXFp?=
 =?utf-8?B?aFNhdEtDZ2EwYjg5Y3k2c1NiRUhHU1k0NVJaK2tYRUR6YVZENEovalFtRzhT?=
 =?utf-8?B?WDhYdXFHQmxjU28yMFA1YXg1RTNqR2U2K28vKzRIOURNczY5MFJ0aE5xTGxD?=
 =?utf-8?B?aGpRY20zS0lVOFMvM29sYnc0Y0pVdmpKVkFKZUxEaEhUbG54SEJQRS83eFJv?=
 =?utf-8?B?bzNMNGdEdk5HNFZjcGxaMW4xQnhYVEQ3cm5heG1pMkxTeTQyblRoTjVYeVRJ?=
 =?utf-8?B?WnpXN2FYa0FKVUN0ZXM1NEVTVDNoVHEwcXFkdmU4L2lYNHZaa2pTelIxT2pX?=
 =?utf-8?B?cENWN2NNYVJLWXFhcVNCRDBjWW9DdGd0WkRpR0dvdjFqb3Q3V0JFM2VYWjZE?=
 =?utf-8?B?NmRQT0Exb3gwQW5jQVl0RmsrUzh1VHV0d1BiRStHcjY1TW9obFBKV1F1UkNX?=
 =?utf-8?B?N0dQREpnell5ZGxqcnFxS2RqK2RscUFTM1o5U0kwbkF0d0hXanE4cXhKOVN6?=
 =?utf-8?Q?GBdPX52rF+WoDkVroHfj2wHBn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DF0F8F9F1744748ADF32B9C8282441B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d64017b9-6551-4044-f4d6-08da58d5bc6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 07:13:43.8257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qfK9CrPIFHGom7uaxWc3DjvTb2D60eNWZ7NLpB/QBJx/8N5i5j1NQtoQY6wjy9vX7Ufj8Cbsygw+IszFqmFjYfXFcTub8MY2yh5LXm2nm0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2113
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
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 jee.heng.sia@intel.com, krzysztof.kozlowski+dt@linaro.org,
 linux-riscv@lists.infradead.org, sam@ravnborg.org,
 damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, Eugeniy.Paltsev@synopsys.com, devicetree@vger.kernel.org,
 aou@eecs.berkeley.edu, broonie@kernel.org, dri-devel@lists.freedesktop.org,
 paul.walmsley@sifive.com, mail@conchuod.ie, tglx@linutronix.de,
 dillon.minfei@gmail.com, lgirdwood@gmail.com, fancer.lancer@gmail.com,
 linux-spi@vger.kernel.org, vkoul@kernel.org, palmer@dabbelt.com,
 dmaengine@vger.kernel.org, masahiroy@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjgvMDYvMjAyMiAwODowOCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBFWFRFUk5B
TCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpIENvbm9yLA0KPiANCj4gT24gVHVl
LCBKdW4gMjgsIDIwMjIgYXQgODozMCBBTSA8Q29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20+IHdy
b3RlOg0KPj4gT24gMjgvMDYvMjAyMiAwMDoyOSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+Pj4gRVhU
RVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVz
cyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+Pj4NCj4+PiBPbiBTYXQsIEp1biAxOCwg
MjAyMiBhdCAwMTozMDoyNlBNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+Pj4+IEZyb206
IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+Pj4+DQo+Pj4+IFRo
ZSBDYW5hYW4gazIxMCBhcHBhcmVudGx5IGhhcyBhIFN5c25vcHN5cyBEZXNpZ253YXJlIEFYSSBE
TUENCj4+Pj4gY29udHJvbGxlciwgYnV0IGFjY29yZGluZyB0byB0aGUgZG9jdW1lbnRhdGlvbiAm
IGRldmljZXRyZWUgaXQgaGFzIDYNCj4+Pj4gaW50ZXJydXB0cyByYXRoZXIgdGhhbiB0aGUgc3Rh
bmRhcmQgb25lLiBBZGQgYSBjdXN0b20gY29tcGF0aWJsZSB0aGF0DQo+Pj4+IHN1cHBvcnRzIHRo
ZSA2IGludGVycnVwdCBjb25maWd1cmF0aW9uIHdoaWNoIGZhbGxzIGJhY2sgdG8gdGhlIHN0YW5k
YXJkDQo+Pj4+IGJpbmRpbmcgd2hpY2ggaXMgY3VycmVudGx5IHRoZSBvbmUgaW4gdXNlIGluIHRo
ZSBkZXZpY2V0cmVlIGVudHJ5Lg0KPj4+DQo+Pj4gQnV0IGl0IHdvcmtzIHdpdGggb25seSAxIGlu
dGVycnVwdD8NCj4+DQo+PiBTZWVtaW5nbHkuLi4NCj4gDQo+IFRoZSBMaW51eCBkcml2ZXIgdXNl
cyB0aGUgb25seSBmaXJzdCBpbnRlcnJ1cHQuDQoNCkF5ZSwgdGhhdCB3YXMgbXkgYmFzaXMgZm9y
IHRoZSBzZWVtaW5nbHkgOykNCg0K
