Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B322ED609
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 18:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D6F6E4C7;
	Thu,  7 Jan 2021 17:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318BF6E4C5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 17:50:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkBEkK/s8IKzy3X5F5rxu+MKfhRPoSqbQz4p0pUYg86Dsg41xmupqjOoLAWa3Zk8hVqFOiDoqzqRms172cTD/E7PzA2o6AdT2ayYOB3me5t2V4W2Y9mgFsw2qHVOWwLNunBod6QaV7bCIpHiCIfyqEmSTPWokb0brE9pUxa+8sN2pb5GyZQXHUKi4WJyHdKI/9Yfd53lVVdTXtPj1KnsoOiH2r00R0eveXwVcWRhVRiIYyh+Ar9N1PjzCEJWd5pl6j7CZ+IMLhcoRkSq4BDi7bKYNhb2vLPYjIRXGmAKRXJZ2ms6XSPoHlbpA4Pn2AcD/bdg9NwISewC2BrEXGixBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nqo0XN9w5s1W+dvGkDagPDeomYvgxU34Cpkxni469KM=;
 b=VFU1o5DBROif/a9UE0VIZ5RMv4x+6sV0bEt9QELiiOde8v8MvTCtPHD1Lywi8qQFPhz6nGKg2Zx5/quiLkA01H2IZlmVTfhJZzVVvxymLmQrxNfehfJTCzK5ekYuSh8zvRFEL5UDebhDSqcvemmTAiGnx9UQcZlbJF1dQ6m4cgq4zdYlup1QaVyFFDpX9B9C3Qh+prMkgvWrGsu59AyvXmhV29rbXllY1/q2GCUWn/76puUdStERWHXVMwoB7HFvoWg26u4z4sMkYQ8t0MmEPM6qbFkTwXTqdA7RJmzOL2Me3TrFq6b/76caCoBLdrecFCWH0z0RI72AmJSLFOCcWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nqo0XN9w5s1W+dvGkDagPDeomYvgxU34Cpkxni469KM=;
 b=D3PCz7HXFnbSSsxL02L7Fmy1fuUN+tJ7AYc+SX6z/T3Snr3hjKdZ9dBDyDwuMPWfp5DEEsnfCyLhbI9UP9GP0Fu9sHw7efQ9UQVZ2BgFoS2iXHHbrLKx8dWHxNgAMgdCXVI84fSg7UVpCjETG8HGyEGJ9sN96YKgnZYl7s0L0Dw=
Authentication-Results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3916.namprd12.prod.outlook.com (2603:10b6:5:1ca::21)
 by DM6PR12MB3066.namprd12.prod.outlook.com (2603:10b6:5:11a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 17:50:54 +0000
Received: from DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::f872:3677:28c3:660b]) by DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::f872:3677:28c3:660b%5]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 17:50:53 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: bhelgaas@google.com
Subject: [PATCH 4/4] PCI: Add a REBAR size quirk for Sapphire RX 5600 XT Pulse
Date: Thu,  7 Jan 2021 18:50:17 +0100
Message-Id: <20210107175017.15893-5-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107175017.15893-1-nirmoy.das@amd.com>
References: <20210107175017.15893-1-nirmoy.das@amd.com>
X-Originating-IP: [217.86.111.165]
X-ClientProxiedBy: AM0PR03CA0093.eurprd03.prod.outlook.com
 (2603:10a6:208:69::34) To DM6PR12MB3916.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.fritz.box (217.86.111.165) by
 AM0PR03CA0093.eurprd03.prod.outlook.com (2603:10a6:208:69::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 17:50:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6963acd3-640f-4aa5-d02f-08d8b334c784
X-MS-TrafficTypeDiagnostic: DM6PR12MB3066:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3066D6822FD737183EEE7D4E8BAF0@DM6PR12MB3066.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ArjC5EaHuX8NhcuV3FpOUcFk1GWSRl0lO8HjkVAzp1BeyQsyIot8qQ0EknxqpLwESsfQeOMel3UCqK020tUug3IgTw0o86n1rswjVdspQzaCaF3cuujZ4UOz4cjGsf9IwDzGZQml492TZjAgtWizuxsZ+FEGwbor3eP25tVnwh/D1vQFvi/7SbWXw687v+4LD84Uo6wx0cDLCWZWQUffO75twXnqcHlsLX7xpUxqfxHc19/JYwF/PtdbZJv2TtFNg4CGaMkVrZBQVnecU2K/Q3FGuz0Ara+JVgt7/r/XtsRnIXrK+WcncO132V1fy8l+eW9kApQtkjZ1bPQhdXe3UW07B5pROZUEYFU38eZVZ7i1SQleNMk9G1HyQu0McWR0XN/TCeBkHhAAPRihgZyBJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3916.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(4326008)(6916009)(316002)(1076003)(66574015)(83380400001)(478600001)(6486002)(54906003)(36756003)(26005)(66476007)(66556008)(5660300002)(8936002)(66946007)(2616005)(16526019)(44832011)(2906002)(52116002)(6506007)(8676002)(86362001)(6666004)(956004)(6512007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NnB1dCtzTWl2dWJnR0pmN0o5VEUvQWFaNXlRNGRwREVsN0UrZGozblFST2t1?=
 =?utf-8?B?Uk45S0FRMjEwSVFqUmIzM1pzUi9ZeGdtTG5FYUJ4elQ2RWVnMDVxMnlTQ2dI?=
 =?utf-8?B?WDhJeUNXRC9IM0U1WDE5R3JYdnozVW5rZjJWTXNZb0xOT2dmZE5rYTBaMllF?=
 =?utf-8?B?Q0tGY1R5aG1nZmZuV0Z0Y3hYRjhrK1pKMGVYVmNSc2tHdmVjeVBpa3FMVVNx?=
 =?utf-8?B?dWoxZTYyWDBhR3V2MFlnaTdFQ2VrYUgzaUN4OU4waldJV1g1Wi9rUHFJWmxh?=
 =?utf-8?B?b1J0YnVJeVBPSFlRNjhCOUtEK3B6UVRXK1VyUGlWOVorNmpMN0dmNnViRGVN?=
 =?utf-8?B?WkNzZ0pGM1R5dVlCd0wvakp3dUxUMFprSm03eW5iajlHczhHdzFhU3ZPZElX?=
 =?utf-8?B?aWtYc1dGOUlBWHNkL1hMTllPQzlrZDlzRS9uL3B5emdCNmlmK3ozc0FnUVo4?=
 =?utf-8?B?d1A2ZDd4SWI5M3pweG5lVDNwcE1qSjJINEdSLy9UVDgvd3c2akdNOFhEMEZC?=
 =?utf-8?B?djJnV2t1VER2ZDBXbUdVdloxVk5ZaDkrSmFBb2krQVEwVEwvdzlvZHNaem0v?=
 =?utf-8?B?blNuUjFYcFJtRWNjNkIzMFYwYWVaTUIzMUJlM25HZnoyd2JEVmhxZ0h1eGR3?=
 =?utf-8?B?QUI0cXZUOTA3Z0lTL2ZNVXJLRnJkTThDTkU2R1M1RmVzaUt0Zi9UUWNEaTFs?=
 =?utf-8?B?aWM0bFFHUllPOWd1N2VoQzdpdkx2a09RcitlRkZiQmlXdHpoNGc5OVlKd2xX?=
 =?utf-8?B?Q1VMT25TY2dxS3NJcWhiUTRZNHlaWEh1b3cwc3gycmg3M2xMd3hHTVBpUHlZ?=
 =?utf-8?B?SlNiQUdaSG5QVEdWUVUvZzdvMEM4VkVnUlp2ZXkvZzJVTUZzSi9iY0ZBekVP?=
 =?utf-8?B?RWNURnNkL3Z0VkZJcVU1ZWcycWdNQ1RYUE4yUFUvQmVCTURRdUhEdkNaaldn?=
 =?utf-8?B?M1RLaXpRWDUxbTdrVFN3OUd5QUJIWGREQXQ0djdOYi9nTXZFVnIvOFNEVWhB?=
 =?utf-8?B?eDNFeTd6MGFaRG9CdmJieUc0dWZzZXN1S3lncjAyUE9DRlNBSUZ3bUg4S0Uw?=
 =?utf-8?B?NmpLeWdOOUh0MDI5NGpMVUtlRTg2YTBaSEFvMWJBZzBjaS80TEc2QklTeExo?=
 =?utf-8?B?Y0tJT1ozckI0T01PQ0Z0c011eTJRTFdTTkJRQ0xiOWt2R2U5WWxHaTFaS0F4?=
 =?utf-8?B?T3k5Ni9GQzhtL2R0SXhOWld0blJSNW15RUh6dldXblRSZFhxQ1NCeEFaODIz?=
 =?utf-8?B?WTBGak5XZ0xGU2lYUGM4VGVEQW04ZVFZenBnQ21LM002YkM3ODZaMVpwS0FD?=
 =?utf-8?Q?smoiJDMRKAM0Oed+7LPA6k0h8S9UAp6xLy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3916.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 17:50:53.8637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 6963acd3-640f-4aa5-d02f-08d8b334c784
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHVbAVxDIg4R1MvrgQZwjAMxiMiw2VDOpH6+8oIzRYQlxYlNfx67AkJ+ENvasg0R9VJVAb3v2+0pfOd5RWQP+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3066
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
Cc: kernel test robot <lkp@intel.com>, ckoenig.leichtzumerken@gmail.com,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@amd.com>,
 linux-pci@vger.kernel.org, devspam@moreofthesa.me.uk,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UlggNTYwMCBYVCBQdWxzZSBhZHZlcnRpc2VzIHN1cHBvcnQgZm9yIEJBUjAgYmVpbmcgMjU2TUIs
IDUxMk1CLApvciAxR0IsIGJ1dCBpdCBhbHNvIHN1cHBvcnRzIDJHQiwgNEdCLCBhbmQgOEdCLiBB
ZGQgYSByZWJhcgpzaXplIHF1aXJrIHNvIHRoYXQgQ1BVIGNhbiBmdWxseSBhY2Nlc3MgdGhlIEJB
UjAuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+ClJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KUmVw
b3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KU2lnbmVk
LW9mZi1ieTogTmlybW95IERhcyA8bmlybW95LmRhc0BhbWQuY29tPgotLS0KIGRyaXZlcnMvcGNp
L3BjaS5jIHwgOSArKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9wY2kuYyBiL2RyaXZlcnMvcGNp
L3BjaS5jCmluZGV4IDE2MjE2MTg2YjUxYy4uYjA2MWJiZDRhZmIxIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3BjaS9wY2kuYworKysgYi9kcml2ZXJzL3BjaS9wY2kuYwpAQCAtMzU3Nyw3ICszNTc3LDE0
IEBAIHUzMiBwY2lfcmViYXJfZ2V0X3Bvc3NpYmxlX3NpemVzKHN0cnVjdCBwY2lfZGV2ICpwZGV2
LCBpbnQgYmFyKQogCQlyZXR1cm4gMDsKIAogCXBjaV9yZWFkX2NvbmZpZ19kd29yZChwZGV2LCBw
b3MgKyBQQ0lfUkVCQVJfQ0FQLCAmY2FwKTsKLQlyZXR1cm4gKGNhcCAmIFBDSV9SRUJBUl9DQVBf
U0laRVMpID4+IDQ7CisJY2FwID0gKGNhcCAmIFBDSV9SRUJBUl9DQVBfU0laRVMpID4+IDQ7CisK
KwkvKiBTYXBwaGlyZSBSWCA1NjAwIFhUIFB1bHNlIGhhcyBhbiBpbnZhbGlkIGNhcCBkd29yZCBm
b3IgQkFSIDAgKi8KKwlpZiAocGRldi0+dmVuZG9yID09IFBDSV9WRU5ET1JfSURfQVRJICYmIHBk
ZXYtPmRldmljZSA9PSAweDczMWYgJiYKKwkgICAgYmFyID09IDAgJiYgY2FwID09IDB4NzAwKQor
CQljYXAgPSAweDNmMDA7CisKKwlyZXR1cm4gY2FwOwogfQogRVhQT1JUX1NZTUJPTChwY2lfcmVi
YXJfZ2V0X3Bvc3NpYmxlX3NpemVzKTsKIAotLSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
