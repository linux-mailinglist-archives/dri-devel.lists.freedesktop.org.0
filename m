Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 157227FAAE5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 21:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C15810E0DA;
	Mon, 27 Nov 2023 20:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1C310E0BC;
 Mon, 27 Nov 2023 20:05:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLyC7OXPkk3CZbNfZvvrGQBta3wKDCd3rcw5Ch8yg6FBhZvhWhYMPqgoI/wyxa/bZ8uU30P93MC19nt+xFTEXmqapn78i7gOXiDeVJM0VbZLJYNH+7R5diWdF8Y+L2ssOfzZpFj0MJIqtCcVOZ4TbvAiwDWv4bqBzIHBCxDNEtHG4JSn3YL/MKw/0Nag1D8KYP4zHcFdP8+qK7aC1M2eE+OWRME6WByt7YyTeOtTeHneTT6k5CyQqL+YWqfw2lo8gga5IR3mDiiIwmOetT8PAnr7tT06ksVDWxfknVzJbVQBHzkydK6pvdSZsfHdOgfnN/PLue7ozsNoOed1xcZJ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3xt7MWrWzpe5onpnuzv0S1slSvLg3ijncxGpXmxCUo=;
 b=jjF2/NiG3B81korgOQ8j8D1rb6OSwfjjkWEg3392Ad6NTszJs310s2+vJG4kJgV4tWswBNDMO/ZcncO2g/8W8gc9J68g+JPAp+LJ5hPRtbHoTCkODBWMFus446xHp8Rtxva0TwH9EeO8fIWMNkSlnZyImU/hb/8IpFNXrG9TEr8aFSOHWEW6nX9DSO3UO2tqnaIKA8n4yCbKbryrmYvA40qafh/R990eck9SbgiccUzUe6Pz+trEVXYpShZKP9II7+mSl9oObHYCZKk+ilauIusidI+rIYc9wbdfRfuWuaEm25lvPYPlxX8j+nvaG9nwS+gy2CAXmznczQGw4xpGcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3xt7MWrWzpe5onpnuzv0S1slSvLg3ijncxGpXmxCUo=;
 b=WqcGc+erlwT1n//kmY44qyygHayuZiSTONRTMVweywCPIfnjAzn4KkhisqJE3CL3AU77Q+Le19P6pkkp4dpnJ1qbRn7vqg8U4Wx/EDAQoLnQhGCxkz+aWj1s+W9j6HKWxAQwyVc8tkoOCRpp03KweiTOkppEV8TTxgWGY/zzpu2UpQjn/6f0OwcFauDD4oZ+1Y4rlQv5hSitj3neBpwL6EQj+sTIyJe1pu1Xglc/+MSUVM9ThBgXgnGOqgn+g/Uorp6byLcoRMZkjquE7ACyrklj0VV71XyklOl4Uqycc/VPAtA27yV6lp65M94fClT3wIMO9UgjMCszfrwIJoQfDw==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by BL1PR12MB5125.namprd12.prod.outlook.com (2603:10b6:208:309::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Mon, 27 Nov
 2023 20:05:18 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%7]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 20:05:18 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "kherbst@redhat.com" <kherbst@redhat.com>, "dan.carpenter@linaro.org"
 <dan.carpenter@linaro.org>
Subject: Re: [Nouveau] [PATCH] nouveau/gsp/r535: remove a stray unlock in
 r535_gsp_rpc_send()
Thread-Topic: [Nouveau] [PATCH] nouveau/gsp/r535: remove a stray unlock in
 r535_gsp_rpc_send()
Thread-Index: AQHaITEwlyFubIM5CUmHqPD/hGGKubCOl7KA
Date: Mon, 27 Nov 2023 20:05:18 +0000
Message-ID: <0c08f93b02df48745342a04a7d3f603f84064a67.camel@nvidia.com>
References: <a0293812-c05d-45f0-a535-3f24fe582c02@moroto.mountain>
In-Reply-To: <a0293812-c05d-45f0-a535-3f24fe582c02@moroto.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|BL1PR12MB5125:EE_
x-ms-office365-filtering-correlation-id: b17545bc-71e2-4751-f693-08dbef842d7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pEZNDdDpaZg80XBVkxzcLs9Z4cnwvO+qkrS3VjS/GQGF61ZgbjB0owbvhd9xQYm0WQTyX6xH4EIkX/aHDYG8B3ljoM9aeP/y9tuOO2gq9CJKpwWnstC6P/Ii7WAocQrTD/IWeNmA53ECvLVvoRL4U1YsBC9crWgRY2W4rC1jZcn0vtl4PZicfKnMLb9dzlOcSjGTkxIR1+34t+sf8tgq6D7t1eeTAj8ZD1gFpjdpOJdhRRnZtE1U0xkXnupsi67oD/AqtCChklu5U/Y6d1QliScW3C9RNHLQKcrfeQhSrYweRWMYL53+L/KGbVfBz3r3DR3SVclVjYnfsal8H6DDoPtqvgaAoUHe/T3yc3uoyj1BXHzp/5X8fhSCowPX0X+WmCbPciS5/+xAebwSLdxGX7jsa05ebtZy3T/4CikqWyJHLf9f+rwcWG8raGBKFvlUa+ilIIbikoe+CBtyv+3JPUuApcMrp5bbR/7QK8wZ2pHOiXAu6kRbx7qN05iFLdQKIYfWiRw7TT64w4n27ielsCncLDgaJKMhQ3CBR/EnmhYsuCBrFpZDyTFRSQVzAeMQ67eQN1rO2QfEfCbEy0i2uSrXxTsK247ipvLv2yI4Hfvigz8YHDm9Lb+LSjW4GWF4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(39860400002)(366004)(396003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(71200400001)(8936002)(8676002)(4326008)(6512007)(6506007)(66556008)(110136005)(54906003)(76116006)(64756008)(66476007)(91956017)(66946007)(316002)(6486002)(478600001)(122000001)(4744005)(36756003)(38100700002)(41300700001)(38070700009)(4001150100001)(86362001)(26005)(2906002)(66446008)(2616005)(83380400001)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0lVdWZ0SnZLL2YzSmhFZWdKalFjU3BZMXEreFZZR2tGUWtwSXNKR2t3b0Ju?=
 =?utf-8?B?VGJ3ZDM4SThleEJpUzJuTUhsS0tJTldLVDdwdUwvYTBjOWk1Z0NsUktaa3BC?=
 =?utf-8?B?MVdOcFVmTnBjZ3ZpR0VleVowU29LZGpuYjBUa0crMmIra001UVBHMmZlcG5T?=
 =?utf-8?B?dGtwWkk3dUUzRmd0WjBqN3NhTC9XbmlYbWxRMFVKRDlCODJwa0tJTVhvV20x?=
 =?utf-8?B?SFFLOVdyT2ZYUXlBellPOU9TMVIyOVE5ZGFTTzkvTThNaW5QTU9zQUpkUVhp?=
 =?utf-8?B?cHFQQ0JCMWNyclY1MDRmQkduOFJiaGh3TTdzTUR5bUdwMGhXSk9sOEYvUGFC?=
 =?utf-8?B?VTMzdHNOY1kxTFdpU1JJb212Vmd3a080VnEva0t0cVhBL0toMGM0cHNtalVh?=
 =?utf-8?B?KzVrS3dOV3NsUm9WanpoK1hveFoxRkM5bzhtTXlBeHZkczVKTDVYWmZiVzFu?=
 =?utf-8?B?TWtUNGZLNWpVZ3o4enAzcm1CUXptdlFEM1ljcXJYblBpandEWGI1cWVvRkJS?=
 =?utf-8?B?Q2tKblZWL2YybGRjQnAxaTNWUkpVL2hpU09uRW1tUEJhcHhIaHVvdE5DOGJm?=
 =?utf-8?B?MUdxRVVLTDJESU9NMEZpV3pMQVB1eVNVQTNJNXdueHVyWnkrN2hONnN4Zi9s?=
 =?utf-8?B?N0YwMWVTY2V1ZmEyN0ZRQ3o5cXl4TGxCdllXRE1hYk44WXJyaUdBSFRscjd5?=
 =?utf-8?B?bWJCVmtqYmdzTWVkYzFWK3BMbWJtU05SVUlvWDNId1FvbEdvNDBuNlNCYzFM?=
 =?utf-8?B?UDhabStiWnRYbk5wc3oxYjBhZWtEOGc5SFFlb3YvQUdpUXhUUzlqTGNYeVh1?=
 =?utf-8?B?bWJUNms5b2FLTG5RVmNkeHJ3eTQ2NDhTU0pqbnRVcDUyYlhLTktqYlRTSGZR?=
 =?utf-8?B?UlNrWTZ3N0gybWFzM2UvakZ6NzlLNC9zaEp0b2N2UnNFeDdHdTVkakI4QlQz?=
 =?utf-8?B?N3ZQaytVSHhIclliZmFtTVdsR2VFSXMrdzcrQUd0Y29KNGc2TStSM1RqMlJH?=
 =?utf-8?B?cHFwU3Z6WFpwQnJZWlJ2aDNkTThUdEs3Q3gxRnovS05JZFBmMDF3cnhVbHRF?=
 =?utf-8?B?dW1PK05FdSszak81ZXdBOWJETEtHaWhOM0xsOFFydlRZTzZ3RnNVOEdiSmJw?=
 =?utf-8?B?YmptOHpLTlluU3FDWXpxdTNNSFVpZ0JFTUs1TEpLUXk0RFN3aExUWTdCQ0pD?=
 =?utf-8?B?SzNXQ3lFK0JVa2czRzBQSVQwL0ptdWwrWG5JVmdhak9USER4N2Z3MjJ5YlQv?=
 =?utf-8?B?OWVoWWxvMWc3c2RPV0diY1diaEVURDFkYXdmalkzNUJpSW16RFF4REdXRFBU?=
 =?utf-8?B?Y0lZenBmWWo0T0lWTlhmOWtuK2V6enBhS1psZmxKSUVQYlhkY1dGQWFJNlpJ?=
 =?utf-8?B?UkVXaTZHV3Z2VzJ3eFltNVE4Q3M4bldKYjRaaVF3K2lzR1FpcmdCbkx5ZW1M?=
 =?utf-8?B?Kyt0cXdNZnlEWThpWS8rSGphS3Bxb3FwOCt6dEV6a1J3OWVhYjdiZ1FTTVJE?=
 =?utf-8?B?aE4wZnpndThINjRFaVluLzV0ZmI0NW5oNEhJYjRnSlZUd0toUFNKUlJnVEN5?=
 =?utf-8?B?eUQwY3pDT3JzY0F0KzZ0SndwQmR4UldGUWY2Yzc2WENFTktpVDk3ck5zNHdm?=
 =?utf-8?B?NVBrbmVGMDc2UEhMQnJ5aFpsd2lQVUU2WktmUkoyUmdoR1ZmUmlGZjk3cXJO?=
 =?utf-8?B?VmZ4R0h4eFdVd3h2R25TS2dSTUw5anNjRnZkaVBJT3A3Snl3UENTMGdkaTcr?=
 =?utf-8?B?b1JLT2hJN0FKUFdlWmxOWGI2Z05wa0NQWUxXVmZPQ2ZuOElYcVlTNEwxVjdp?=
 =?utf-8?B?c0lyV2M3Z1owaFRqZDZLNzhJQWxnb0xEYUpqV3NmRUVsS3pWRWZnOGp2dytH?=
 =?utf-8?B?UGNHanNadC9qQnNuVzRodUdpR01MeHcvMW5JQlZMNTRmZWhaZ0ZGSDVpd3A0?=
 =?utf-8?B?bEpHd1pYbHJpQXlDNUFhdFl1TTBjUHpLVEovYmEvdG5PTXpoazJ3VzFON1dp?=
 =?utf-8?B?TVNzNWd6U2RDQW9NRzJteGZzSmlreXhKTFdQS1NIa3hrWWtmVEZiS3N2aTJo?=
 =?utf-8?B?Z25LOWt2RGlTU2lzTStsYjkxQ0VveS9CT0FRQzNVL3ZwODk1MldIanA3Mmdn?=
 =?utf-8?Q?mvEzjsK+tYiN3Q8YtqmZFRpnp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B972D80209266042BEF9E67F8CECE9E7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b17545bc-71e2-4751-f693-08dbef842d7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 20:05:18.0451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R2qWyaK1hjSm1ubUFxJccAWWF1wBpG1uczytyPsNaQrdMnpWH08S+hsckkLTs9DGWb+D6or3xZXEfa/6uSf8+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5125
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@redhat.com" <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTExLTI3IGF0IDE1OjU2ICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBUaGlzIHVubG9jayBkb2Vzbid0IGJlbG9uZyBoZXJlIGFuZCBpdCBsZWFkcyB0byBhIGRvdWJs
ZSB1bmxvY2sgaW4NCj4gdGhlIGNhbGxlciwgcjUzNV9nc3BfcnBjX3B1c2goKS4NCj4gDQo+IEZp
eGVzOiAxNzZmZGNiZGRmZDIgKCJkcm0vbm91dmVhdS9nc3AvcjUzNTogYWRkIHN1cHBvcnQgZm9y
IGJvb3RpbmcgR1NQLQ0KPiBSTSIpDQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRh
bi5jYXJwZW50ZXJAbGluYXJvLm9yZz4NCg0KTmljZSBjYXRjaCENCg0KUmV2aWV3ZWQtYnk6IFRp
bXVyIFRhYmkgPHR0YWJpQG52aWRpYS5jb20+DQoNCg==
