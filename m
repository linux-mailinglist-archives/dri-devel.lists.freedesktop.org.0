Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFEB56D113
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 21:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5EC18AF8D;
	Sun, 10 Jul 2022 19:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E67718AF8C
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 19:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1657481971; x=1689017971;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1jopqVqZjlZonGknYBZnD7z03CRuZQK7TDwif9DIxv8=;
 b=g0MdEbtMNIxmFmBlK12Q4w1IS7hOjfPb32DdM2khm4GHhJ6oijnk+RbB
 FvWgcdpzD/A8JrnVaSeQk5fKKvEhVpw9SUMOfbn7DKUiGGDYPGRoXUzLK
 WE7Dd6fvQ4mwwUNm0abjPvP9tD0lkKYJxrTKfmHZag0EmHSb12WyJumGV
 4n1/DRkB3XQmtXAELNadsYcqlFti8A3xMRgCBIA/h217smW9TRa8o2quv
 ew8wkcWZYb+q9vvXRWEkxzcD7nFwYMVUDgtaMjE3NWlTc+3AJhUwuiqtH
 TdURWZr/+Bodh2YqSrgHee34BUScAaw+NCST3VkughtESyYbHpPtiLwak A==;
X-IronPort-AV: E=Sophos;i="5.92,261,1650956400"; d="scan'208";a="164109211"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Jul 2022 12:39:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sun, 10 Jul 2022 12:39:29 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Sun, 10 Jul 2022 12:39:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjnpHe1VdhlWD+SpOIMrB/II8hdxVr00fT046W7/vqtihKjeBQpQz+Yyb19HHVP+Ty+jAUEYEZqbl7hlJPN8oB1eTqJ/2T/jyrqUKg9XXRDRa3AUOkM3bmGNRmHcQFADoI2ci0x3/8kR88DN6MeAnumrZSX+oMyYIXfb2UgMEKMAUR4ObEKiUS73yQUjeAID8wnPkNz4ixIi/nPUu9O1iALW1P67yBi/sQ8PRDjxuN+3H0QSE7mEWyZjpUotcZHmrkXiMt/C9uw0Kx7kQz9ei/Ih6t6iNPxmWhnqe51DNFYVpr4gNOLICzRhn7X+lxIc7hrzkx25nKQ3XF9F0wayzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jopqVqZjlZonGknYBZnD7z03CRuZQK7TDwif9DIxv8=;
 b=g7IhIuiQXdcaZ/1jIOk8aqFYUg15GY7W1grDJzTRAU2p7bNyvRxPrqCOBvQO8CZLu/THODUnhKRw8Rd5WRFSa3RRjTbF4lsKMAuSNJy4ejh5FrGXza/+R4GdSq7Y2+u2QbXd9UeJ1IgVhVaGV9RT78MEp8Zyd/r1eemr0RGTC5vaLnPGSOETtJf2dUDSM97WGf5NQV7876zlB/wUTb8vLb+LjDccOkRb6PZWV1OizV76/4qAOdNUDI+5MWLaqjIQNY7MHZQo2ZFd4wfdrWyRPEMQYnwYHuKtMmBgIy0cwDpGG8JQ8BzXKoai8JMqpiaMJ9AI/ljMoG1PgpEzaSScyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jopqVqZjlZonGknYBZnD7z03CRuZQK7TDwif9DIxv8=;
 b=diTSBoDXcCyRZCse3gpk/cQof7ym+zbqiVZBNaCWlxGmOrQ4QPnLWeM2nxb4ikyrwAcUIVpyxDcRZMdM01ouns8poVNXyzDVMsxrQP09GGPDd2Q6I8gPCqo6YTl14uLoBHgbIj+yUzwekWoDvycjJo7oImjbFjn13dorehBvQB8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by IA1PR11MB6370.namprd11.prod.outlook.com (2603:10b6:208:3ae::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Sun, 10 Jul
 2022 19:39:24 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.026; Sun, 10 Jul 2022
 19:39:24 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski+dt@linaro.org>, <damien.lemoal@opensource.wdc.com>
Subject: Re: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan k210
 sram controller
Thread-Topic: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan
 k210 sram controller
Thread-Index: AQHYkLmpMN95aImTj0GtIyfn+RYzcq14CA+A
Date: Sun, 10 Jul 2022 19:39:24 +0000
Message-ID: <a516943f-3dac-70a0-3ebd-9f53fd307f25@microchip.com>
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <20220705215213.1802496-5-mail@conchuod.ie>
In-Reply-To: <20220705215213.1802496-5-mail@conchuod.ie>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e244c075-bc2a-48b9-3042-08da62abe4c9
x-ms-traffictypediagnostic: IA1PR11MB6370:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?YXBSQStoc2paOUFPOWd1dGp0VkpLeXcwLzJvQWZUQVlIQUZCeG5WN0Jpc3FB?=
 =?utf-8?B?WURRVW1HKzcvZUJpQ3VNTStLVk5mcUVQTmZ1ckRrcTVBTXFGU0UrVW9EZUVW?=
 =?utf-8?B?OTFQV3Z1WGJkNlc4UUdONFRqekRwTmNMRlN5SFZETk1DWE5JQzJUNFJyUFgy?=
 =?utf-8?B?aWVXcGxmU0d1azBZdk83VVFMZGUzbjBjT2FzMXE2WE1QSGVPOHduL1NSSGo4?=
 =?utf-8?B?cHVYRm8vWUJ0NWVmRVNlR05pZ09Rb1d0dHJ1OElEeGxGTkFsZ0I2dU0rYXox?=
 =?utf-8?B?SG5RbHRZcjI2QXo0QXdKc24rTzlPenZUekZZdnpTT3NlVk55WGZ2aXFFY2Nk?=
 =?utf-8?B?NTBBWWgycU5PRHpMWmhlQlg4S1RPaFkzanYzQUNLVFhrUWNuaFdYV1RWcW0z?=
 =?utf-8?B?am1wVEVlcThWU2xZUE10ckJ5aGdhZlpyaTFndVJobkt3MUc2dzdnelk5c2hq?=
 =?utf-8?B?b2xXQnBTaVovZFdEcno5cjVlcTUza2dUaVg0NGE0US9GWXZWTUpYcEltMGFW?=
 =?utf-8?B?RlRMOE5vbTRZMm1vS284bThlOEtUMlhFdkdWT0JJLzJWS1drSFFKMWJ1ZHdT?=
 =?utf-8?B?WjQvemp6QUZyWXVOWEJpZ2d2by8yL1NEZ3dUTzJoZWdCaDRMemZTVU1IM1RC?=
 =?utf-8?B?VXpIV043TGF2bkYrQVQ0aTRaMWkxcThOTldWb1JtZEU3KzE5MnpCYVRCKzN6?=
 =?utf-8?B?MWpOZ2I3Rkt6QXBTWk9uMFZZZXRCQUJxbGhiUDFwekZ3NlFTYzV3YnRWZTF2?=
 =?utf-8?B?bjlOM1ZURFhxc0xiZFZBQUlZZ0Vad05zNk1aOW1lTHl4Ri9Celcyb1c4THFO?=
 =?utf-8?B?QVRsZmVzT0hXVlJCdkFoaXg4NktCYTNHTXdHTnhNYmZLZHRvR0dqbWZVWTBX?=
 =?utf-8?B?MVNoMy9rSEFQRGVmcEp4TkJ5cGFqTGpMMFlqVjVlN3VaWnVwK3U4N2hsV1Bi?=
 =?utf-8?B?MFlnSjEyL1RFSHpkOGJWL0gwblpvMVpuWGhzc0R0ZWhrQXZHT2VtUlRTekRS?=
 =?utf-8?B?c3dhTEU0d1JSRDRNbFUxOUtzYWEvN0hCTEpPcmhHQzhUUG85KzdvaWdONGhz?=
 =?utf-8?B?U2xhWklXRjhHbDR5NWxuUE4yUFlCNVowN0YzTUErQllPcjZuTUpHTm9SYzlo?=
 =?utf-8?B?RFVRdWhMWHN0ODllbSsyOHlJbGFDaGpLd2Q2V1E3M01MQVptYVlYMTFZMnV2?=
 =?utf-8?B?MWZoVDB3R25zS29BbW9UcHA5K3A4MHQxb1daaWt3azhqSEVGL3hqc1luZHND?=
 =?utf-8?B?ZHpzQm9PL2c1MURIa1lqMEE0enFEUkczUnZVeFpPeUlaSkVrdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39850400004)(366004)(396003)(136003)(376002)(346002)(86362001)(41300700001)(53546011)(26005)(478600001)(66446008)(122000001)(966005)(6486002)(2906002)(6512007)(31696002)(38070700005)(7416002)(5660300002)(6506007)(8936002)(31686004)(54906003)(83380400001)(2616005)(186003)(38100700002)(66476007)(76116006)(36756003)(8676002)(91956017)(71200400001)(110136005)(4326008)(64756008)(66556008)(66946007)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFZ1WDEremlaekFGS29QZWJhSVFoUFJYeC9UVjJJRjVQUnVXYkxiRTRFdERW?=
 =?utf-8?B?TGxuVVI5WjF6UU5aZC90Q2RSamlmTUFnQkJCd0xyZTkwU2htVnUwczVYN21j?=
 =?utf-8?B?aCtZbm1PeG5GQStSaFY4WmFaZzVZeG1iYnoyQUZNY1pQenlKVkFFTVd1RWUw?=
 =?utf-8?B?N0VCQjhSZml6QjNJK2N2Qk9lUE11cTk2WjRxUllkSisrVDRXVjNYUzJ0ZEx1?=
 =?utf-8?B?MGVyRnRCOWlQQlU1Rnlab2g0QStvaW8zdi91cnBKN1ptNDNWMU5KQWxRSzk4?=
 =?utf-8?B?VnZFY3dYeml2NHRXWEZyajl3dEp2WjVOWGY5UlV2MjdqTlFRMVl0LzZUZmZy?=
 =?utf-8?B?cFpPUFdlZnQvNnVPcGlUOTdsSjVzRXRva0c1RDl0LzI5d2tQZk5wcVRMZEJR?=
 =?utf-8?B?dEZ5cjQ3YTA2SFBHeTRFcnJISXhLSW9hQmtBR25vQ2hQT0NQelRObzNFRkdt?=
 =?utf-8?B?QlpxOEZXLy9QS0FDOWFNM0tPQTk5SHNzNUdsc0FnQ3NMZ0lGanQ2cGd4UXFE?=
 =?utf-8?B?S082TkdlWFZUMGVoRVNwdzM4U2tJbW9OUzNIOU9tWFZ6dDBPUnYxM29OVFBS?=
 =?utf-8?B?b2dmRGtqTVg3dkJ6OHEvUkc5MkZ0TU1wcW5EbVdzWCtCOW96UURLL0tyd1Vy?=
 =?utf-8?B?YjY2Z29DNmFGN0tMZ2hkT2tkOTNrOWczM2txMTJvWDJwVkJLQTNsMFBlMmt1?=
 =?utf-8?B?QUJrMksxdkZYMHJkaThITlFiMkc2TzI0T09lZWJBMnFJODVVQ3dzY05pbU1P?=
 =?utf-8?B?VU4vZjBGVmlmZkROSXFzT2ptSWVNcUcxRzlLcFoxNGRvNTdxbVFYYjV1NE9r?=
 =?utf-8?B?ek5WZ3NjUERDbzF6NTJIOFdmcUJ1c3liY09Rb1JWcmZMTXJXbnJiQzFWejdW?=
 =?utf-8?B?T042R1g3anZGMnlyd2l5dnN6TlFlSEVCemhvQlpWVWtPclBLMjY1Wm0rWjBT?=
 =?utf-8?B?RldmMUxkWTh5bmFNYkdoM1QveXN4Z0tVT3lXTE5Xamt2elRoNjRwbllibVdz?=
 =?utf-8?B?QWI2WW9JVllVOXpWNEZhQTI0SkphUHdpYkloS282aEUwRGQ0R280SzJmRTN2?=
 =?utf-8?B?Z1dMNzhHY2NSckRrNkJFa2UwWUllbjI5bmcwaDF6bDNBdTM1TWx4cldaTXdW?=
 =?utf-8?B?VVBDN0lyUDFNMUsrZGJZcmVSVEtpQ09jcld2T21wOTcxcTg2K0pITVZMUUdU?=
 =?utf-8?B?enlHdzk4Wk5CSEpLejB6ODdyTk5yeTNPRTNQdEo3ekVabnFTZ3o1Ymc5d3A2?=
 =?utf-8?B?VUJodlVSVk4raVJVUVNlOExwTWZJcjhxR2xDa2t1Z0h6NFVlZzdZRmMxOXNJ?=
 =?utf-8?B?LzdtcXB0c0xyVlZQa1Nza2xNd25EZE5qSVRaQTRNOTJwZU5wa2phbU1qaFpE?=
 =?utf-8?B?dEY3czZKWHd0aTlnNWlSck9ZYmxoS3ZkNTNzK0RmY29iWTQwanlmYzA4RXRV?=
 =?utf-8?B?TDNvbXNST25WMDVWMG55VWI1MEhCVFdaV2tGdEhUZVJCWkVHdmxLZzM1bTh6?=
 =?utf-8?B?Qk5jaXZITnc3djhtS3NhR3RlbjRmVDdmSzhQQWlTTC9udEY0ekZXN3h2OThS?=
 =?utf-8?B?NUxpRytkR25aYkxhSzJWQ2w4c2o4TmJEcXJ2RDVlT1FzVXEvVjc5TlhKYy9S?=
 =?utf-8?B?MlZvWE1YSEMxYXZtVVdFSE9mY3RkMUtTWXdIa1k3MndRSkR6U0tRS3lPblox?=
 =?utf-8?B?SUNlVHN5b0U4ZGtkQjNnd0Z6cTE3SkQwenZVelNSTER4NzdDUFhnbWFwUmgz?=
 =?utf-8?B?UkQ4STgzeCtNLzR4VkNOVDN5MnY0aUhTMVRKVlNVRndtbE9qeGNhMUtQdW1F?=
 =?utf-8?B?d0VpbWV2L0liVmEwSXdWaDRFZ2x3akEzb3JGWlp2eTQ3K3RmUGVpd2NKcWtl?=
 =?utf-8?B?UENiUXhzb2wwN2tKNXYxY21EOVRZcE14a294QktsUGc0S3c0QWR0MmlxdDVz?=
 =?utf-8?B?ZkFqQ2tnUzZVOTl2U3Y2VFR4dUpHcFhnd2s2ZFc5TWNnY2VHa3NqOE52dmNI?=
 =?utf-8?B?T3ZvaUk0aUg0RUViQlg1V002UC9QN0dNeCtPaCtrMjRKY0xibGN3U3Q5SEs3?=
 =?utf-8?B?NGwyL1phQmZmRmFzZUFJYlFNbExHM2RCbHlxUFdnM1pFdUpSSTFoMFAwSFBC?=
 =?utf-8?Q?s3oCMBPpebqkuyoyHfCtEVZ/q?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BCD10CE1E9875B408B078CAC9B6AF971@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e244c075-bc2a-48b9-3042-08da62abe4c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2022 19:39:24.3510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oXbiP2Muc+eTRQG2pHroAdmCdat1UsbxLId1+924b/36igh4jn+7dhpBCJg10V027cs8U41REAGoVtSyA2XgYa/8tBVffgcL2pKmGLk7H3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6370
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
Cc: niklas.cassel@wdc.com, airlied@linux.ie, palmer@rivosinc.com,
 thierry.reding@gmail.com, linux-riscv@lists.infradead.org, sam@ravnborg.org,
 masahiroy@kernel.org, daniel.lezcano@linaro.org, geert@linux-m68k.org,
 Eugeniy.Paltsev@synopsys.com, devicetree@vger.kernel.org,
 aou@eecs.berkeley.edu, robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 paul.walmsley@sifive.com, mail@conchuod.ie, dillon.minfei@gmail.com,
 linux-kernel@vger.kernel.org, fancer.lancer@gmail.com, vkoul@kernel.org,
 palmer@dabbelt.com, dmaengine@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGFtaWVuLCBLcnp5c3p0b2YsDQoNCkkga25vdyB0aGlzIHBhcnRpY3VsYXIgdmVyc2lvbiBoYXMg
bm90IGJlZW4gcG9zdGVkIGZvciBhbGwgdGhhdA0KbG9uZywgYnV0IHRoaXMgYmluZGluZyBpcyAo
ZnVuY3Rpb25hbGx5KSB1bmNoYW5nZWQgZm9yIGEgZmV3DQp2ZXJzaW9ucyBub3cuIEFyZSB5b3Ug
aGFwcHkgd2l0aCB0aGlzIGFwcHJvYWNoIERhbWllbj8NClUtQm9vdCBvbmx5IGNhcmVzIGFib3V0
IHRoZSBjb21wYXRpYmxlICYgdGhlIGNsb2NrcyBwcm9wZXJ0eSwNCm5vdCB0aGUgcmVncyBldGMu
DQoNCkkgKGxhemlseSkgdGVzdGVkIGl0IGluIFUtQm9vdCB3aXRoIHRoZSBmb2xsb3dpbmcgZGlm
ZjoNCg0KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvZHRzL2syMTAuZHRzaSBiL2FyY2gvcmlzY3Yv
ZHRzL2syMTAuZHRzaQ0KaW5kZXggM2NjODM3OTEzMy4uMzE0ZGI4ODM0MCAxMDA2NDQNCi0tLSBh
L2FyY2gvcmlzY3YvZHRzL2syMTAuZHRzaQ0KKysrIGIvYXJjaC9yaXNjdi9kdHMvazIxMC5kdHNp
DQpAQCAtODIsMTEgKzgyLDE0IEBADQogDQogICAgICAgIHNyYW06IG1lbW9yeUA4MDAwMDAwMCB7
DQogICAgICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsNCisgICAgICAgICAgICAg
ICByZWcgPSA8MHg4MDAwMDAwMCAweDQwMDAwMD4sIC8qIHNyYW0wIDQgTWlCICovDQorICAgICAg
ICAgICAgICAgICAgICAgPDB4ODA0MDAwMDAgMHgyMDAwMDA+LCAvKiBzcmFtMSAyIE1pQiAqLw0K
KyAgICAgICAgICAgICAgICAgICAgIDwweDgwNjAwMDAwIDB4MjAwMDAwPjsgLyogYWlzcmFtIDIg
TWlCICovDQorICAgICAgICAgICAgICAgdS1ib290LGRtLXByZS1yZWxvYzsNCisgICAgICAgfTsN
CisNCisgICAgICAgc3JhbV9jb250cm9sbGVyOiBtZW1vcnktY29udHJvbGxlciB7DQogICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJjYW5hYW4sazIxMC1zcmFtIjsNCi0gICAgICAgICAgICAg
ICByZWcgPSA8MHg4MDAwMDAwMCAweDQwMDAwMD4sDQotICAgICAgICAgICAgICAgICAgICAgPDB4
ODA0MDAwMDAgMHgyMDAwMDA+LA0KLSAgICAgICAgICAgICAgICAgICAgIDwweDgwNjAwMDAwIDB4
MjAwMDAwPjsNCi0gICAgICAgICAgICAgICByZWctbmFtZXMgPSAic3JhbTAiLCAic3JhbTEiLCAi
YWlzcmFtIjsNCiAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JnN5c2NsayBLMjEwX0NMS19TUkFN
MD4sDQogICAgICAgICAgICAgICAgICAgICAgICAgPCZzeXNjbGsgSzIxMF9DTEtfU1JBTTE+LA0K
ICAgICAgICAgICAgICAgICAgICAgICAgIDwmc3lzY2xrIEsyMTBfQ0xLX0FJPjsNCg0KSWYgc28s
IGNvdWxkIHlvdSBxdWV1ZSB0aGlzIGZvciA1LjIwIHBsZWFzZSBLcnp5c3p0b2YsIHVubGVzcw0K
eW91J3ZlIGdvdCBjb25jZXJucyBhYm91dCBpdD8NCg0KVGhhbmtzLA0KQ29ub3IuDQoNCk9uIDA1
LzA3LzIwMjIgMjI6NTIsIENvbm9yIERvb2xleSB3cm90ZToNCj4gRVhURVJOQUwgRU1BSUw6IERv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUg
Y29udGVudCBpcyBzYWZlDQo+IA0KPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBt
aWNyb2NoaXAuY29tPg0KPiANCj4gVGhlIGsyMTAgVS1Cb290IHBvcnQgaGFzIGJlZW4gdXNpbmcg
dGhlIGNsb2NrcyBkZWZpbmVkIGluIHRoZQ0KPiBkZXZpY2V0cmVlIHRvIGJyaW5nIHVwIHRoZSBi
b2FyZCdzIFNSQU0sIGJ1dCB0aGlzIHZpb2xhdGVzIHRoZQ0KPiBkdC1zY2hlbWEuIEFzIHN1Y2gs
IG1vdmUgdGhlIGNsb2NrcyB0byBhIGRlZGljYXRlZCBub2RlIHdpdGgNCj4gdGhlIHNhbWUgY29t
cGF0aWJsZSBzdHJpbmcgJiBkb2N1bWVudCBpdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENvbm9y
IERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+IC0tLQ0KPiAgLi4uL21lbW9y
eS1jb250cm9sbGVycy9jYW5hYW4sazIxMC1zcmFtLnlhbWwgIHwgNTIgKysrKysrKysrKysrKysr
KysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xs
ZXJzL2NhbmFhbixrMjEwLXNyYW0ueWFtbA0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvY2FuYWFuLGsyMTAtc3Jh
bS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9s
bGVycy9jYW5hYW4sazIxMC1zcmFtLnlhbWwNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5k
ZXggMDAwMDAwMDAwMDAwLi5mODFmYjg2NmUzMTkNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2NhbmFh
bixrMjEwLXNyYW0ueWFtbA0KPiBAQCAtMCwwICsxLDUyIEBADQo+ICsjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gKyVZQU1MIDEuMg0K
PiArLS0tDQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21lbW9yeS1jb250
cm9sbGVycy9jYW5hYW4sazIxMC1zcmFtLnlhbWwjDQo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gKw0KPiArdGl0bGU6IENhbmFhbiBL
MjEwIFNSQU0gbWVtb3J5IGNvbnRyb2xsZXINCj4gKw0KPiArZGVzY3JpcHRpb246DQo+ICsgIFRo
ZSBDYW5hYW4gSzIxMCBTUkFNIG1lbW9yeSBjb250cm9sbGVyIGlzIHJlc3BvbnNpYmxlIGZvciB0
aGUgc3lzdGVtJ3MgOCBNaUINCj4gKyAgb2YgU1JBTS4gVGhlIGNvbnRyb2xsZXIgaXMgaW5pdGlh
bGlzZWQgYnkgdGhlIGJvb3Rsb2FkZXIsIHdoaWNoIGNvbmZpZ3VyZXMNCj4gKyAgaXRzIGNsb2Nr
cywgYmVmb3JlIE9TIGJyaW5ndXAuDQo+ICsNCj4gK21haW50YWluZXJzOg0KPiArICAtIENvbm9y
IERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4NCj4gKw0KPiArcHJvcGVydGllczoNCj4gKyAgY29t
cGF0aWJsZToNCj4gKyAgICBlbnVtOg0KPiArICAgICAgLSBjYW5hYW4sazIxMC1zcmFtDQo+ICsN
Cj4gKyAgY2xvY2tzOg0KPiArICAgIG1pbkl0ZW1zOiAxDQo+ICsgICAgaXRlbXM6DQo+ICsgICAg
ICAtIGRlc2NyaXB0aW9uOiBzcmFtMCBjbG9jaw0KPiArICAgICAgLSBkZXNjcmlwdGlvbjogc3Jh
bTEgY2xvY2sNCj4gKyAgICAgIC0gZGVzY3JpcHRpb246IGFpc3JhbSBjbG9jaw0KPiArDQo+ICsg
IGNsb2NrLW5hbWVzOg0KPiArICAgIG1pbkl0ZW1zOiAxDQo+ICsgICAgaXRlbXM6DQo+ICsgICAg
ICAtIGNvbnN0OiBzcmFtMA0KPiArICAgICAgLSBjb25zdDogc3JhbTENCj4gKyAgICAgIC0gY29u
c3Q6IGFpc3JhbQ0KPiArDQo+ICtyZXF1aXJlZDoNCj4gKyAgLSBjb21wYXRpYmxlDQo+ICsgIC0g
Y2xvY2tzDQo+ICsgIC0gY2xvY2stbmFtZXMNCj4gKw0KPiArYWRkaXRpb25hbFByb3BlcnRpZXM6
IGZhbHNlDQo+ICsNCj4gK2V4YW1wbGVzOg0KPiArICAtIHwNCj4gKyAgICAjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvY2xvY2svazIxMC1jbGsuaD4NCj4gKyAgICBtZW1vcnktY29udHJvbGxlciB7DQo+
ICsgICAgICAgIGNvbXBhdGlibGUgPSAiY2FuYWFuLGsyMTAtc3JhbSI7DQo+ICsgICAgICAgIGNs
b2NrcyA9IDwmc3lzY2xrIEsyMTBfQ0xLX1NSQU0wPiwNCj4gKyAgICAgICAgICAgICAgICAgPCZz
eXNjbGsgSzIxMF9DTEtfU1JBTTE+LA0KPiArICAgICAgICAgICAgICAgICA8JnN5c2NsayBLMjEw
X0NMS19BST47DQo+ICsgICAgICAgIGNsb2NrLW5hbWVzID0gInNyYW0wIiwgInNyYW0xIiwgImFp
c3JhbSI7DQo+ICsgICAgfTsNCj4gLS0NCj4gMi4zNy4wDQo+IA0KDQo=
