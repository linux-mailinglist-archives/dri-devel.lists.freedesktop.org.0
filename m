Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C4F349156
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 13:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97066ED14;
	Thu, 25 Mar 2021 12:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D2E6ED14
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 12:01:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJxRPD+czrwekw9vWFmeoKwnSKfHiibwDA3roc+yz8jXj9kKMKn0I7S1mJOGcxGaR734IXW84/OSKgmYwnMxruA68lN11zpYMSGcpC/wtxXquEEl0CaQ70kh4dMY/riGzeJW0n2fUKeGC7zNpPUQZwVEpjntqGziWcYnQrMFPiQAI8RoDBDLWToHPo/k5/8fmsBwyzi26syHLxXqhU5xXoJCW9sqgNx1t4EJivMTutLG1R1dV6FWSk/BWaFXMlumnQuF+QE+IYP1kAw5IwxVpYAzkgvcKHucm1OLN10FzoVH+GlMAo/CeuCLJoHdJxV5hSCiF1EM4S0vKae5fizgTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8iG5vl2N09Ic3bEBrnqZpuvKvIPEqACnv7r+y0sttg=;
 b=DgwN00m/e2ryLzCSG5QGYClk16cMAbyAcUDJOYYFYq5OBwm0bloa6/0WXSZVLWO1nwXUv/nc8BZKcGKQrrP5w8Sved5asBSmCkdJnGe/EZRHB8s1pbj6kH0QoHAFF2AYwHfIeTNN8ouwMfivAT3/Mg6/RviT7cCpUYRBqMKg3hBrQRYnr4tNryWfbXTQaU/YaHg57/AJNsirvYjKMJdViN0tiAZNuLzRYTjGIDT6VM1MlbkqyMmMslu/QPLtEea3Cxz9x3dFD6y9bfdEIDgEQXamaZUlo1cx2f4HWlU63QECd2eWYaE3tghg6dpDfjm7PXX0bAGbyJjWWpsknzV4Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8iG5vl2N09Ic3bEBrnqZpuvKvIPEqACnv7r+y0sttg=;
 b=YuEQFFd47gXGea/3MAx/S5MqJsJ9N/qRgprey4cUNoltBaKV0TeHWhUFd7CX7+E49Rpywps9jPy7HaOns/setetAMQwcumrqNoKti3p8lBZFn2VCYVb3y6hF7Cc6Ht6KHtrA0YmssRupagC1vpuNULHAjZ5W+kakU4mW0V4hWnpDSwxf0U1911BsqUcOpVCI48LbMNmM0WdEW8CVpuCe9idtpdNyd/rnEc/wbiG03yFdKv7e+yNIVsIpiz34XRZcKoVFGpYl1BJQlAMXBG6HQHrznsAhoFqFrn7h39NOy7j/BDyLM7V6cSnOMTQ7LSmjopvWEdJsFqNhiqXhULKivg==
Authentication-Results: shipmail.org; dkim=none (message not signed)
 header.d=none;shipmail.org; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4137.namprd12.prod.outlook.com (2603:10b6:5:218::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 12:01:06 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3977.029; Thu, 25 Mar 2021
 12:01:06 +0000
Date: Thu, 25 Mar 2021 09:01:03 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
Message-ID: <20210325120103.GV2356281@nvidia.com>
References: <0b984f96-00fb-5410-bb16-02e12b2cc024@shipmail.org>
 <20210324163812.GJ2356281@nvidia.com>
 <08f19e80-d6cb-8858-0c5d-67d2e2723f72@amd.com>
 <730eb2ff-ba98-2393-6d42-61735e3c6b83@shipmail.org>
 <20210324231419.GR2356281@nvidia.com>
 <607ecbeb-e8a5-66e9-6fe2-9a8d22f12bc2@shipmail.org>
 <fb74efd9-55be-9a8d-95b0-6103e263aab8@amd.com>
 <15da5784-96ca-25e5-1485-3ce387ee6695@shipmail.org>
 <20210325113023.GT2356281@nvidia.com>
 <afad3159-9aa8-e052-3bef-d00dee1ba51e@shipmail.org>
Content-Disposition: inline
In-Reply-To: <afad3159-9aa8-e052-3bef-d00dee1ba51e@shipmail.org>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Thu, 25 Mar 2021 12:01:05 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lPOff-002VD3-KG; Thu, 25 Mar 2021 09:01:03 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb51c72f-4372-4a84-eb23-08d8ef85ab45
X-MS-TrafficTypeDiagnostic: DM6PR12MB4137:
X-Microsoft-Antispam-PRVS: <DM6PR12MB413780DE27F1BE24A927AE32C2629@DM6PR12MB4137.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NUJhG0JmUhiW9lnKGM729ncCYqpbFymjkCNaQm0QU7KwsJE75Te8Kmn2LMP4q7sSFjmW6MOjQJhP5o5rAIYUcayFMvm0rt18x1FsO7cYb0GdvYA8/vhBKjJ8UR4dsE22nqDRi/FW8IxoBHu+aJEGikFE1V1VCmVrJ4a1S/L6WEmCvcdu2rduF3v/0PBs/G5NqaFgZwBwGI6bRee3rwM5zMHB+3D7VlRGJrPy4HS/3vaah+F911iNHIaljtoP/IfZu6YNcT15CxwuPyAZM7W1ty+eUhPVyDgGc/f4fZ0UPpLj/2QIKFXH75uIscETcc/W2qC6hMSEIbjP2WgLnrX3FG0RgbrADp2AemnTQNRTEUeWMIKzwusdFfM2v1wFVH5hzNHiFM+PdDAAIDd/vqDEtzKGCTYimLyWABp6e+OgjmH5m6/oj5GnaU0vN5Nc1F9HeX5sy569Tw6NuCkgx47j9+Ymg4KOQZfS+jDM6E8+io8H41/XjrnGrR39pRUrxJ+RDw3M1Sr8JiLg+E5fLVxozvdK1bj+id23/A4IT93TMPKbkRWLVlyLL6AykT3z67wbMVoyEIunNwiSbtRtsM5+lWLTxrsNlPifl3JVCQE7zK9SeqTAUmJb4yBYGNzVJVuJgciwQq+oeEKJfHf/OQAbFQX+nOzwfdirmO3bz6ydTR4Mm7oG3+cz82LDjBqLyx6p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(66556008)(1076003)(66946007)(66476007)(2906002)(38100700001)(8676002)(26005)(9786002)(9746002)(5660300002)(4326008)(2616005)(36756003)(6916009)(54906003)(8936002)(33656002)(426003)(86362001)(316002)(478600001)(186003)(4744005)(14583001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eER2ZjgwbG9vRC9TaWpicVNRWXhhWTY1ZjdDT1p0djFNZkZYL05PclB4K1Qz?=
 =?utf-8?B?V0l6emNCT09pQzh1cG9WYjlzanRQRUFiZUlGdzZkb1hST09HandXU21hbEh2?=
 =?utf-8?B?YmpWWlJweExBWGFhQTk0RTNFcFlhZUVwWE9MZjZBTWhCOVJ2S0VPbDBFR3lG?=
 =?utf-8?B?Q0I3YmxxQzQ3TEI3U05zbzdjZU9kL3gyNkdzNlRTL1U5TVVMdDVNOENYRzky?=
 =?utf-8?B?cW9yRlFvWFYrU1ZkdUM4SlpuTEdvOE5yNVVpekprN2oyYUp1WjdSL2oxaWZW?=
 =?utf-8?B?SXE0VFlGeFpzUDgvbDNaSzYxa2JiTms1NXc3NGd4ak43R0NVbHJyWHZhOTRF?=
 =?utf-8?B?K2VPbUQ3WC9vTVZnbTJtMk5xeWp5T01Zcm9xMFlubWE5UnFlVUtOUExUYVFw?=
 =?utf-8?B?czVTTXBMTDNuajVlcUtUUWJBbmd2SnBhNkNPbzRWMWhydjZMbWtORlhXZFRQ?=
 =?utf-8?B?LzhSdXoxajN2cGJCRklCZWxYY2xDUEU3NkE2OElHZnh1N05zN1A1V1QvdFda?=
 =?utf-8?B?UXdWdkNtZmN5ZEVQWGJJenBZWGdGM1lzVTVRNUdxSy9zUTV5TElyUlNET1hk?=
 =?utf-8?B?aDdxNkRSdW5BaUNMZFRRb1dqMEhYTTcxOHdyelpoZUp0NmxRaDJROS8wV1BZ?=
 =?utf-8?B?bzdQUjQ3ZTBrdERyYWpDNXFIeHVXOVZVSmhSQ2N4TFkyVDZUS0hZck83YzdL?=
 =?utf-8?B?ckhqdHRLZ2ZpclF2Z25TWFEycGdGbG4vYzFGUUdEWnlkNG8rZGtTYTBHOEZl?=
 =?utf-8?B?UHRldy9vWlJwdGhKNk1oMzF0bmc3M1BYZ2piZmNTMjVzUjZyR0I4YkVpU2NW?=
 =?utf-8?B?cC96ai8rWTNOYlF1RzZ2QXlJdEhPRHY2cmNtZ3VmZWZVWjZqUEgzdzhjUWxK?=
 =?utf-8?B?cWdvR1BMb0graFI1N1JWb3RxL3RSUzVvRXNoUmViY3BIVlRyZXhVN09oTENy?=
 =?utf-8?B?UmtuUlZBZnFkZ0dZem1BbjZOaTY3ejgwcnU2NGdZYS94TkpmSFhCcXdTek40?=
 =?utf-8?B?b1lCNDlTVnJZVWtpd2NpOFIzd05iUmNMb3A4ek03UzZpcEFjVjJ6akpic0hr?=
 =?utf-8?B?VS9USENpNUZBRVJFTDlVRUpDUTJjbjVBQlY2RFlFczd0WW5NY1RGT2FEVWlV?=
 =?utf-8?B?UlkzNHFaRVZzSjJSMkk1RURQTk9GVXE1S2FSMHArWXpiR0Zad3hmRFhjUHQ3?=
 =?utf-8?B?VVZpajcxQys3ZWU4NXdPNGRHQ2ZBNjNRZlM1MlFXd3pPOHdsbjJaQWtENWxQ?=
 =?utf-8?B?Z2NYcitCY01kQlZ6R25OaXQ3RG9IYlhsOGJMQ2FpbWtLb2o5RGJRS2NuYURk?=
 =?utf-8?B?b2YyL240L0JXL2VrTlI3UVRXQ3JidkdoQk1tQTBYM3crTHpYMC92cXNuVmR1?=
 =?utf-8?B?dHBQWGNlYU9KS3FSVm9pVHlOTXQ2VUo2aGF6Z0UrbXVESmtNekRjbFUvWjY3?=
 =?utf-8?B?SDFwbTVQR3RXcXZ2Ry9DTElUejEyV0hzL2RJcW9mK0xhaUczaEZKZU1lT0tL?=
 =?utf-8?B?aFFmSit3OWlnMnF3MHYrNjZhVFNxb25LK1Y5RUNETWV0ZUp1VTF1RUhPeVdl?=
 =?utf-8?B?Y2tHZDh1K2h0QmdLcEFPOTZ0cFZRS3IvVHFUU2p6enIzZlF1VjdEczZ4Z0pP?=
 =?utf-8?B?ZE1iZHUrUDdqYVlnLytvNkd1WE5va3ZBSWtpOGdJVnVlN3VFV1RMT2VoSmlZ?=
 =?utf-8?B?cElja0lzMDl5ejRadVVOd0ZBU1pqVTNFR1hGZndma2ZLcUdGakFKcE10OGVF?=
 =?utf-8?Q?HTrok8mZ9P905B98rmDYmo5qgKiX+J0dk7f0aA8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb51c72f-4372-4a84-eb23-08d8ef85ab45
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 12:01:05.9258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aoweMP5MeVENl2JUqMlFVDfoy8ND6oUEJGODq+4RoBPbBWg/zkOG/IRwfCNQ1QWL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4137
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXIgMjUsIDIwMjEgYXQgMTI6NTM6MTVQTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKEludGVsKSB3cm90ZToKCj4gTm9wZS4gVGhlIHBvaW50IGhlcmUgd2FzIHRoYXQgaW4gdGhp
cyBjYXNlLCB0byBtYWtlIHN1cmUgbW1hcCB1c2VzIHRoZQo+IGNvcnJlY3QgVkEgdG8gZ2l2ZSB1
cyBhIHJlYXNvbmFibGUgY2hhbmNlIG9mIGFsaWduZW1lbnQsIHRoZSBkcml2ZXIgbWlnaHQKPiBu
ZWVkIHRvIGJlIGF3YXJlIG9mIGFuZCBkbyB0cmlja2VyeSB3aXRoIHRoZSBodWdlIHBhZ2UtdGFi
bGUtZW50cnkgc2l6ZXMKPiBhbnl3YXksIGFsdGhvdWdoIEkgdGhpbmsgaW4gbW9zdCBjYXNlcyBh
IHN0YW5kYXJkIGhlbHBlciBmb3IgdGhpcyBjYW4gYmUKPiBzdXBwbGllZC4KCk9mIGNvdXJzZSB0
aGUgZHJpdmVyIG5lZWRzIHNvbWUgd2F5IHRvIGluZmx1ZW5jZSB0aGUgVkEgbW1hcCB1c2VzLApn
ZXJuYWxseSBpdCBzaG91bGQgYWxpZ24gdG8gdGhlIG5hdHVyYWwgcGFnZSBzaXplIG9mIHRoZSBk
ZXZpY2UKCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
