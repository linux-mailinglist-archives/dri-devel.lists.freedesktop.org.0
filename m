Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C97DC314F90
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 13:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016A96EB1D;
	Tue,  9 Feb 2021 12:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5896EB1D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 12:57:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6DTXgoKLIMdwD/Duuqz/pU45bUQpzPN30F0I0KwhnaliMFIpA9phkp64JUIoa6+GJk36W8TFWcGYzsxNb/R0IRpQg6Rn/+TGqIkcYHObjw1ntT+/rw9e7Xm46del7j4sgWIrz2ahIRlHnYnFU67w8w7nKKWJzUYjyn41mgS/Me9QyXLusp6ygl0DH7DluBITWfUvBOsTQmdK58fi+lDurjy9HtLmJlmhjtOPNhpK/G2u8exH+Zy54voRQAmkzu47CRnQBuRvKj0bww71zgfVNOPI1Isf9VwRRQRgXWPBrfHcFh9vzrMZ/OuSWce2TiJ9AFs+gDEiWUIwNj8ifcnhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7TVz2SNlNGDsXPz9H7DHI+Ho9841dvFoCFeN6meTB4=;
 b=EwEreemipiOZmTaQwDucoICYLkS2rrgEp9WF8l0LAfHlI9xkb1ilLXEInhb/40V0Bhp/9OuwD3aCQ7qdFULPgAuF9XVBnzExlVqnHafYN6042rZlS2+JJteddP2Omx/n649uvNYFmcOtw9yvM8BxzZRqdeNRqmrJqBXIuzd6AFd/ZCdZ9U3KrMHrBWZJI6424MEHlu/qdbojKtHQGC4cQRneiHEtsyJ3zTOCW/2LD8cO2BGI9+/BK6jtNDfwt6BDI0m12yAp+3VeNb5NZ8NKq9/hjJYSI9JOHyJKnAi0y1NJJUje8IPV9bo78q/OyBthZT7MTTEF8t0OyGAbhS2IJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7TVz2SNlNGDsXPz9H7DHI+Ho9841dvFoCFeN6meTB4=;
 b=XYUawUjxRiRVNHkM2K4/Ftfaaa6oePlD9+45PCWdEURZYIJrSHeYA72wW1d0GP+BN8Ud1NE7tGn1W36AyRpP8PHxDq1vaboLuTshsX++eyfoTh7olX2ZV3eJo2rEAiwcupnlEOAdvLr/V+zlnGaxO/fO1e4o0ohQOJlnFqm9cyQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4898.namprd12.prod.outlook.com (2603:10b6:208:1c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Tue, 9 Feb
 2021 12:57:26 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 12:57:25 +0000
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool
 implementation
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
To: John Stultz <john.stultz@linaro.org>
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org>
 <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
 <48225879-2fe1-22ac-daae-c61d52465aea@amd.com>
Message-ID: <a9dd7f8a-ef30-9eb4-4834-37801d43b96f@amd.com>
Date: Tue, 9 Feb 2021 13:57:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <48225879-2fe1-22ac-daae-c61d52465aea@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:444c:9a67:948b:2493]
X-ClientProxiedBy: FRYP281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::13)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:444c:9a67:948b:2493]
 (2a02:908:1252:fb60:444c:9a67:948b:2493) by
 FRYP281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.11 via Frontend Transport; Tue, 9 Feb 2021 12:57:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0fbb95b4-7204-49f8-6ee2-08d8ccfa3fbf
X-MS-TrafficTypeDiagnostic: BL0PR12MB4898:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4898C6941A4848940CB73C7B838E9@BL0PR12MB4898.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LMMJ7ztuRF8F94pR7JKRERabxD1JUARFY2EUHavOU3WtpqV6uxwS9S9/49mOkMkK+F08IWKnlckOjnfzfd04LVKYLGYXRqvKSIJ02furmSSqXgER9nOdr2/5u5GK4uUeaN9eQawwIZPxyGW8cXxe2VFKEYLcYdVXYTPdiEPsDUt+4MXYLVCyKIjOL72T46slbVVVVmeQSU+WtPNtmEwEvp+WJMKcTjdfyP+yJEWwfk2wg9W0mAgrYgsu9LuXu6vObgoLc4SjhyTLnY8S/HmVg7+eWkInM7zy42Y3ohjv1Wcuzq6WJAcP0N0KNRdB6jrTU0WNgYddkKTerS62XSK9PlzyNypUwML1FsDgs0q/FCznN2k6UDeBNqKBy8HNDgyiWTcTzDtVPm9x47d9EksRgEV5zYGa64vMtZ4ci5DC5HZwb2wlglJwcbklc3ropnereaj0+7j5EoJBvsIeFtTwp7DKqahjtumtB5C8bdnwcp42DlaIf41MC3jPNhkzkjTJ3mCkYVOiwqscNNK1SN/AM5y0xzOzh4TwbXgk9uvBEcgWEbBmzl2iOMJk4C557pgnw7HlGan4UPZCDi+9BUH7xYKhxakjrDAPW/rBKb142ogFB3ZE7gQsoNgPH5DtvmB7jYGNiOztzhyBCCWqoLJRI82Ms0d1/pr350MMWcaiGsHkmgREht4rvSSlCCRVjknd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(136003)(376002)(396003)(45080400002)(16526019)(478600001)(966005)(5660300002)(66556008)(4326008)(8676002)(2616005)(186003)(2906002)(8936002)(6666004)(6916009)(36756003)(66574015)(31686004)(86362001)(52116002)(316002)(31696002)(54906003)(7416002)(6486002)(66946007)(83380400001)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MDNBT1Z1Q3o5T091YktTRlViajlzeHV1WFRUZWZHSDlIdzVpT0VrbFZQRG1U?=
 =?utf-8?B?eFFTUUNRWUJTNEp3NEZ4TVU3bHFpRUsrRXk3djh6L09heEJEUnJiMmdWUExZ?=
 =?utf-8?B?YTcrY3VKSE9MbE9sNkVVa3F6L0U1N2F4bW5SdmpDcVNUNldFQVkzN01qbkpE?=
 =?utf-8?B?TE9NaHd6a1NsUXJtUXNGekR5bktsY2xVOSsrQXlDbWVPR1VaekhldktGb05R?=
 =?utf-8?B?UHc3czVJL1ZWN3NOelA4MHh2OUxkbjNzaVlVZ2hGVzF6OWRWZE52bkZabEQz?=
 =?utf-8?B?STFGZk9sTGFuQXdUNEZHT0JHZFdrcitCYnloQVFsdFYya1RWMzZnY3Nmc3JZ?=
 =?utf-8?B?NFc1L2xwSjNXdGJ6UTU0djZzMnc5Q2ZKbll6RjRwejc5WGlQdDJYUWxtS2hK?=
 =?utf-8?B?Zk9NQ3lweU9TYUFsR2VzN2JvUG84UmpyL2NyR1VPckNJNFl4dkZsV1Q2MUNv?=
 =?utf-8?B?RmtIaW8weG1Fc2o2Z09iekpqVSt1Rm4rT0dZaG9DVkVob2FoU1ptOTE2b09w?=
 =?utf-8?B?RXdrQkJmN21MRjI0WCtWU2ZZaEEvbTlGYjNmMUdWNnZ2dHE3dlZsVUdIa2VG?=
 =?utf-8?B?aWlJcEtnWlhCZW5BcmJsa3VOMG85dEVVN1BOdFZLdHlaZC8rS3R5UFJnUFdU?=
 =?utf-8?B?KzE5ZU9JVlN4SWFQaFRBaWoxbUIwOGd4c09CL1dYcktyRHc3a3JMUXl2RElj?=
 =?utf-8?B?NjllMGNTYWJWUk5RVVk0NUxxTkNGUm54ZTVUUCtERVhNUml1TGsxaXlacDA2?=
 =?utf-8?B?MFcvaGxKVU1xQ0F1bm9yZnFEZlQ3MGhyLzhjWDFFUko2MVJWYkl3SlhJcWV2?=
 =?utf-8?B?TXltTnZuVWxwQk91Q0U0TTB0U21GOHFWempqMjJkMWwwVmx1enRobDhLcEl2?=
 =?utf-8?B?cjdkQkN2K3BxTFh0VXZRd0FBVlNoK0h2cjA2bnNreVZiVzZNUG4zSW5Fc3Bm?=
 =?utf-8?B?VncwcitMS05aU3o2ajNtcmd6ZzhYZDVzQTFSbDQ4KzFqcEVpNm9KbXRHYWNH?=
 =?utf-8?B?aFVpQ3V0RmJJNk1iSXd0em1QMmp1WUdQeDFyY3FucVBkR0wxR2ZiWGdMZmFs?=
 =?utf-8?B?SmE0eHB2a0VzYkJ4eExTdnptamY3YTA0ZVBRUXdOTlBxRGdPRDVLT0FDZVVU?=
 =?utf-8?B?YWtoNW03T0lINmVCR2lqUHZVYWxRd0VsUGl3Mm1ObFY5c2tqVjYzVCtQV25E?=
 =?utf-8?B?UmRZUEVDSzc0TGZKM281K01pTW5RVmFac29xTGoxQlpZSStWQjJ1VXVkNUpm?=
 =?utf-8?B?dXFBanJ3TTUwaGYxOFliUnU3aUdycEFjZ3hGTFAzZmVhQWo2OXVIWGNaZCtR?=
 =?utf-8?B?MUpnSVVaRk5NaUpoZmk2WDU4QnBVTTVLWFEyK1ovVVNCQitBYjE5TEVQNTgw?=
 =?utf-8?B?UTBGamIwWGxBck5idExDU1VzN0gwWFVUSElmOGRGcWlNTGIrbWVaVG84SXhC?=
 =?utf-8?B?cmlROURRUE5qcE1namtpR3ZyaXpiaGZ6QjhDMXBuaUQwWEJuQkt4cWErMDFP?=
 =?utf-8?B?WkpFcENtVXBINGdmdWpFTFV1NHgvRVJhNHJCQklKK1hZY0FOTlo4SzRCY3J0?=
 =?utf-8?B?b1lWWko2SloyRFpuY1dmSW8yZUR0dUg0VzdLZ1RzV2ZjbXk0Zmk4cHprUXcr?=
 =?utf-8?B?d2xQWnM2Y0tqK1MzQmRzS1lLYXZ6UnBieHhCZktFdHpBMUkrdkRmVWY2OEtp?=
 =?utf-8?B?S2UrV3VBOWFOOUhWbEtFbDhuOWw3SlZ4WjV0WGswNlZZLzRRRXFrc0RTLzll?=
 =?utf-8?B?K0EyUkVLMGxPYzR2aFozeHVCQVM5RFFxZDBnU0lnNUxzRStqTllwY0U4UHMw?=
 =?utf-8?B?TEFJWmtpU1ZmeXI5YVdkTjZDNTdtQWs3ME8vTC82TzN6Z3IrekRuOWtNbEY1?=
 =?utf-8?Q?1Zc+DZ81O+sET?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fbb95b4-7204-49f8-6ee2-08d8ccfa3fbf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 12:57:25.8274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fA9wfk84+w3lioFao64Dln+tqAnPqHKwckjWWjm7IidocvqU6Ml1dMh8XuLV5zJ4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4898
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Sandeep Patil <sspatil@google.com>, Ezequiel Garcia <ezequiel@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, James Jones <jajones@nvidia.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=c3=98rjan_Eide?= <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDkuMDIuMjEgdW0gMTM6MTEgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IFtTTklQXQo+
Pj4+ICt2b2lkIGRybV9wYWdlX3Bvb2xfYWRkKHN0cnVjdCBkcm1fcGFnZV9wb29sICpwb29sLCBz
dHJ1Y3QgcGFnZSAqcGFnZSkKPj4+PiArewo+Pj4+ICvCoMKgwqDCoCBzcGluX2xvY2soJnBvb2wt
PmxvY2spOwo+Pj4+ICvCoMKgwqDCoCBsaXN0X2FkZF90YWlsKCZwYWdlLT5scnUsICZwb29sLT5p
dGVtcyk7Cj4+Pj4gK8KgwqDCoMKgIHBvb2wtPmNvdW50Kys7Cj4+Pj4gK8KgwqDCoMKgIGF0b21p
Y19sb25nX2FkZCgxIDw8IHBvb2wtPm9yZGVyLCAmdG90YWxfcGFnZXMpOwo+Pj4+ICvCoMKgwqDC
oCBzcGluX3VubG9jaygmcG9vbC0+bG9jayk7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqDCoCBtb2Rfbm9k
ZV9wYWdlX3N0YXRlKHBhZ2VfcGdkYXQocGFnZSksIAo+Pj4+IE5SX0tFUk5FTF9NSVNDX1JFQ0xB
SU1BQkxFLAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgMSA8PCBwb29sLT5vcmRlcik7Cj4+PiBIdWkgd2hhdD8gV2hhdCBzaG91bGQgdGhhdCBi
ZSBnb29kIGZvcj8KPj4gVGhpcyBpcyBhIGNhcnJ5b3ZlciBmcm9tIHRoZSBJT04gcGFnZSBwb29s
IGltcGxlbWVudGF0aW9uOgo+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91
dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXQua2VybmVsLm9yZyUyRnB1YiUyRnNjbSUy
RmxpbnV4JTJGa2VybmVsJTJGZ2l0JTJGdG9ydmFsZHMlMkZsaW51eC5naXQlMkZ0cmVlJTJGZHJp
dmVycyUyRnN0YWdpbmclMkZhbmRyb2lkJTJGaW9uJTJGaW9uX3BhZ2VfcG9vbC5jJTNGaCUzRHY1
LjEwJTIzbjI4JmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3
Q2M0ZWFkYjBhOWNmNjQ5MWQ5OWJhMDhkOGNhMTczNDU3JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFh
ODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQ4MTU0ODMyNTE3NDg4NSU3Q1Vua25vd24lN0NUV0Zw
Ykdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhh
V3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1GVWpaSzVOU0RNVVlmVTd2R2VFNGZE
VTJIQ0YlMkZZeU5Cd2MzMGFvTExQUTQlM0QmYW1wO3Jlc2VydmVkPTAgCj4+Cj4+Cj4+IE15IHNl
bnNlIGlzIGl0IGhlbHBzIHdpdGggdGhlIHZtc3RhdC9tZW1pbmZvIGFjY291bnRpbmcgc28gZm9s
a3MgY2FuCj4+IHNlZSB0aGUgY2FjaGVkIHBhZ2VzIGFyZSBzaHJpbmthYmxlL2ZyZWVhYmxlLiBU
aGlzIG1heWJlIGZhbGxzIHVuZGVyCj4+IG90aGVyIGRtYWJ1ZiBhY2NvdW50aW5nL3N0YXRzIGRp
c2N1c3Npb25zLCBzbyBJJ20gaGFwcHkgdG8gcmVtb3ZlIGl0Cj4+IGZvciBub3csIG9yIGxldCB0
aGUgZHJpdmVycyB1c2luZyB0aGUgc2hhcmVkIHBhZ2UgcG9vbCBsb2dpYyBoYW5kbGUKPj4gdGhl
IGFjY291bnRpbmcgdGhlbXNlbHZlcz8KCkludGVudGlvbmFsbHkgc2VwYXJhdGVkIHRoZSBkaXNj
dXNzaW9uIGZvciB0aGF0IGhlcmUuCgpBcyBmYXIgYXMgSSBjYW4gc2VlIHRoaXMgaXMganVzdCBi
bHVudGx5IGluY29ycmVjdC4KCkVpdGhlciB0aGUgcGFnZSBpcyByZWNsYWltYWJsZSBvciBpdCBp
cyBwYXJ0IG9mIG91ciBwb29sIGFuZCBmcmVlYWJsZSAKdGhyb3VnaCB0aGUgc2hyaW5rZXIsIGJ1
dCBuZXZlciBldmVyIGJvdGguCgpJbiB0aGUgYmVzdCBjYXNlIHRoaXMganVzdCBtZXNzZXMgdXAg
dGhlIGFjY291bnRpbmcsIGluIHRoZSB3b3JzdCBjYXNlIAppdCBjYW4gY2F1c2UgbWVtb3J5IGNv
cnJ1cHRpb24uCgpDaHJpc3RpYW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
