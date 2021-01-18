Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8A22FA32F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 15:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49B56E2ED;
	Mon, 18 Jan 2021 14:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E1C6E2E6;
 Mon, 18 Jan 2021 14:37:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZ+DbG1St5alGDEcqo7MW9/oMO7RsTUV6BiwnmL1Wr4/Sf8NG6DYMUXThUd3nX7UduoSdT3tXsM5zgM7kNTfUmiDHV18SXVNQx915SMuyqEkQC18GKZIxmOSik2qBztlBpnNEyV0mZPQF+UQwG1D+9uZMK4IOsHzCmIgApniKJF6FunOS6azQcYIh5dCBXi+9YNa7GIJSRFonxj0NjquLz8KCBHh5616BPcpi3K1Zc/ynK/6AnMQTtE1ONCkkuOrFidXLXbXmwqT3lNsZI92Q1Iv9VuCBC3buaXeyvuiQNitplnNJzT6KJVXNzUZUBvdbrjWspOyQpOX4UlmZMvPdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bd3kpdetBOsbJ+80tewnWjpKX3vYkDI/80J0GNK275c=;
 b=CGojGpqgSCC+MplBqlhQXXy5oBqawzP5BCtbnlmsClDTlc8Xk8hKiMsfx4B2gJl1eR2//IFCIPNOU0O4wJ2NdHx2+9KegCKWTujeK/2ktma1nRe6A6rSJyBcaHpqbk9017QU13K4Md8nbqqnuyMdz/92AQ/6wMJ89x4+Ly7vlJNTx/m0XpJJPzXa4vBEkgWpN3ycoFQ3t6ES2hZog8MJZTX4/2WWomZ9C14Sc+36VB/AqYpUvofvViph46GqQOcKKzPdIdZZftEZGR+V2eeF70KSX43Rh0zkEDtW1iTmgAGdO5eQwwY/9ZL9g2bPOl2EJaMz4PpX0LWz8+JbVTFeLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bd3kpdetBOsbJ+80tewnWjpKX3vYkDI/80J0GNK275c=;
 b=czh88I+Ch78sCTDIpwCpd8kF6OsERPz4JwbzOo/fo2uE7oX7m5NyeviV4hJS2kTJnvIrruswzvfOpf9cRxbMk0LNeLGNFDQpvhlA2oLY9IYTtbMXhoaPc47TZ3RnkKax6DC9e/naYLGwAiKwkUaWWs1FmInyLCA6dQOgX/od92M=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from BN6PR12MB1939.namprd12.prod.outlook.com (2603:10b6:404:107::12)
 by BN8PR12MB3107.namprd12.prod.outlook.com (2603:10b6:408:46::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Mon, 18 Jan
 2021 14:37:17 +0000
Received: from BN6PR12MB1939.namprd12.prod.outlook.com
 ([fe80::584b:493b:4126:e042]) by BN6PR12MB1939.namprd12.prod.outlook.com
 ([fe80::584b:493b:4126:e042%7]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 14:37:17 +0000
Message-ID: <b38e46b7707ba9a899384baedc7efe4e70c439bf.camel@amd.com>
Subject: Re: [PATCH v3 1/3] drm/amd/display: Add module parameter for
 freesync video mode
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Date: Mon, 18 Jan 2021 09:36:47 -0500
In-Reply-To: <20210114111445.1d2bbf62@eldfell>
References: <20210104210800.789944-1-aurabindo.pillai@amd.com>
 <20210104210800.789944-2-aurabindo.pillai@amd.com>
 <20210114111445.1d2bbf62@eldfell>
User-Agent: Evolution 3.38.3 
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN3PR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:400:4::13) To BN6PR12MB1939.namprd12.prod.outlook.com
 (2603:10b6:404:107::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.5.217] (165.204.84.11) by
 BN3PR03CA0095.namprd03.prod.outlook.com (2603:10b6:400:4::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.12 via Frontend Transport; Mon, 18 Jan 2021 14:37:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7083f990-b6ff-468e-77e8-08d8bbbe8d91
X-MS-TrafficTypeDiagnostic: BN8PR12MB3107:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR12MB31074E60D5F9EBBCB45599388BA40@BN8PR12MB3107.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZFNigy46UEFB91ivf66By4mFZ6iqIePIedA1TffjsQHJBiUHfWhyj7tROIyF7oQANTpCzanGXsp7HI1ZKkc6oV3FYeOqEatLWkwItXWMXQdf54Do5Q65AjhPCthTNN6KLu2cN3mFXy4LN9yqM5BB3+qHKpNaI+Yz25FM2E/pMZkLb18aDWfCgbUgMGi/CvQjqPs6rTsE/7KK08ES2zVVTY/sALOH/h8/yez6jrZs+i4JHk01Z7FsxSJoEPT1q0+4ZwlG2wpOd4YQ1IiRkIS7vtPLP67wdjaTFa6pdJwrZ0EU+VtvI7sifANlXAqBFmKeIHtbHYLdG6gyQquqBax6bAWexiF2wehYj62kDSukyOxhQW0lu/K9FaFYxzZe6GVdJVo92xNUNI0+t8fRys+WrSzp8SoGoRQp0r/b4OuxJKs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR12MB1939.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(86362001)(2906002)(66946007)(4326008)(83380400001)(66476007)(36756003)(8936002)(26005)(66556008)(478600001)(54906003)(2616005)(52116002)(956004)(316002)(8676002)(16576012)(5660300002)(6666004)(16526019)(6486002)(186003)(6916009)(966005)(66574015)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SEM5aUpJMG9jZCtOQjFQSHFxNkErQnpEMXlKZjJUQnVGMXFQMVhJa0Q1dFZZ?=
 =?utf-8?B?SlQ2TStuRmptVzd4RytHRHo2b0NBNEhwRWdvclBESnRHQUc2Mk1VZkgwMWlj?=
 =?utf-8?B?V1ZVMXZFemlBRnJ5dDNJMCtHYXl0Rm5tSHpJR3IxUUExZzZ0MHJhcURncFBh?=
 =?utf-8?B?dWI4U1krRWFTZkpEeHM1UTg5QTdiSFZGM0U5dFpMWml3NUJTWjdpbGRIMVlS?=
 =?utf-8?B?THo5WDdVSmFxZDZmKzYrTDF6Sm9OTEJiRE5WNWVzcFN1MExBZnUrT1N3ODhB?=
 =?utf-8?B?TWNQZjBXV3puR1ZxVUhlN29MMzFBNlJPbmIyejR4dTlCRWNJelV0cUhvZGpB?=
 =?utf-8?B?R3pFazhRQklyaWxtUHh5V2xySEFxZTNaMnlobmhMdms2WmRKd0tYU3V1ZTRo?=
 =?utf-8?B?U04zcWNaSktIUDhBZDcrZnMxdEtQV3RBdlJxa0FnK0lTNTFtYVBtQ1hRcVl4?=
 =?utf-8?B?cnN0b29rS2RFZWJPTnhRdDVmNlNLWVhSNmVlbnY3VXRDWlZjT3hTdmkrbldZ?=
 =?utf-8?B?MUVjQ1dMTng2T0hrTC9XcktPa3p5b3ZISndsbXNzSStEbjIvTG1Ia2NYbTBC?=
 =?utf-8?B?SDgrVWRmSGhPZ0tGTVRvOXJZV0tIVWNQSUNVSlBqY3laQnRYQ1l4TUFOQTRW?=
 =?utf-8?B?Zmt4RjlJekRtRENTU2dseHN3WHBOaTNOeUF0cytrUm1Fc2ZJdjY5Z2ZpN2dr?=
 =?utf-8?B?bFBOSk13SzdlcWplQlJZcUU3aGszcitKblNUVGhsYnBmdjFVWDR3OHlVSERz?=
 =?utf-8?B?OWVRajNyV1dFSDh4UkkxTC9Ta0MvZXNtNFVSengwcEc3aDJOUVo2WkpOWXlZ?=
 =?utf-8?B?NDE3VWhpZG1teCtpTW02R3ZRVHV5M1IrRmlSZkhxb0EwU1VqZ0lzNzdzREI5?=
 =?utf-8?B?eUI4RmU2UlRBeE8ycHRXMXJSRE4yTTRJdjIyNGZ4Wmh1UkY0by9tRFVQN0VY?=
 =?utf-8?B?aVl5QmFhVEI3dHNNNHN4VXN3d211RG96ZlFUbVAweisvOHo5cWhzbHphUWpM?=
 =?utf-8?B?ZXI0VnZZVUx2VG5RcGlwNU8zeFdsUVRzNG5ISFducWtHTGxka0xRSk1PUXJI?=
 =?utf-8?B?endqeFppS3FmNi9rOUFXeDkxNEtRZUpJT25ML1E1a2V0QXhnbUtHTW1nSllB?=
 =?utf-8?B?b0dkV0x5Tnp3bXQ3MnZxQmU1N2U5bnl1Qk1yNXhja3ZGZGYzVUhwbmlFc2RI?=
 =?utf-8?B?cW5vMXZtYlBKdnltTXRBVHJvVFJlbnlUWEIwYmtBdE1BeVRnb2tHcUtvU0I4?=
 =?utf-8?B?TGlYQzcxdVYxVGU5YUg0UE0ycTk0d3ZmQ044Q0F4aG8wam5JSTVzY2RhZDNu?=
 =?utf-8?Q?VgCwP3pwU/QjfQbpHgrtFE3ZNK9OKZgqZl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7083f990-b6ff-468e-77e8-08d8bbbe8d91
X-MS-Exchange-CrossTenant-AuthSource: BN6PR12MB1939.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 14:37:17.0144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /RFxRXd2neqHt0xpkDnKG3o7Mk+W/W5FBX8QvbC2z7Ep94f22JRvjO5kMiMi079oY409KOdUoy03PWqOXdDFZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3107
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
Cc: stylon.wang@amd.com, shashank.sharma@amd.com, thong.thai@amd.com,
 dri-devel@lists.freedesktop.org,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, wayne.lin@amd.com, alexander.deucher@amd.com,
 nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIxLTAxLTE0IGF0IDExOjE0ICswMjAwLCBQZWtrYSBQYWFsYW5lbiB3cm90ZToK
PiAKPiBIaSwKPiAKPiBwbGVhc2UgZG9jdW1lbnQgc29tZXdoZXJlIHRoYXQgZW5kcyB1cCBpbiBn
aXQgaGlzdG9yeSAoY29tbWl0Cj4gbWVzc2FnZSwKPiBjb2RlIGNvbW1lbnRzLCBkZXNjcmlwdGlv
biBvZiB0aGUgcGFyYW1ldGVyIHdvdWxkIGJlIHRoZSBiZXN0IGJ1dAo+IG1heWJlCj4gdGhlcmUg
aXNuJ3QgZW5vdWdoIHNwYWNlPykgd2hhdCBDaHJpc3RpYW4gS8O2bmlnIGV4cGxhaW5lZCBpbgo+
IAo+ICAKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwv
MjAyMC1EZWNlbWJlci8yOTEyNTQuaHRtbAo+IAo+IHRoYXQgdGhpcyBpcyBhIHN0b3AtZ2FwIGZl
YXR1cmUgaW50ZW5kZWQgdG8gYmUgcmVtb3ZlZCBhcyBzb29uIGFzCj4gcG9zc2libGUgKHdoZW4g
YSBiZXR0ZXIgc29sdXRpb24gY29tZXMgdXAsIHdoaWNoIGNvdWxkIGJlIHllYXJzKS4KPiAKPiBT
byBmYXIgSSBoYXZlIG5vdCBzZWVuIGEgc2luZ2xlIG1lbnRpb24gb2YgdGhpcyBpbnRlbnRpb24g
aW4geW91cgo+IHBhdGNoCj4gc3VibWlzc2lvbnMsIGFuZCBJIHRoaW5rIGl0IGlzIHZlcnkgaW1w
b3J0YW50IHRvIG1ha2Uga25vd24uCgpIaSwKClRoYW5rcyBmb3IgdGhlIGhlYWRzdXAsIEkgc2hh
bGwgYWRkIHRoZSByZWxldmFudCBpbmZvIGluIHRoZSBuZXh0CnZlcmlzb24uCgo+IAo+IEkgYWxz
byBkaWQgbm90IHNlZSBhbiBleHBsYW5hdGlvbiBvZiB3aHkgdGhpcyBpbnN0ZWFkIG9mCj4gbWFu
dWZhY3R1cmluZwo+IHRoZXNlIHZpZGVvIG1vZGVzIGluIHVzZXJzcGFjZSAoYW4gaWRlYSBtZW50
aW9uZWQgYnkgQ2hyaXN0aWFuIGluIHRoZQo+IHJlZmVyZW5jZWQgZW1haWwpLiBJIHRoaW5rIHRo
YXQgdG9vIHNob3VsZCBiZSBwYXJ0IG9mIGEgY29tbWl0Cj4gbWVzc2FnZS4KClRoaXMgaXMgYW4g
b3B0LWluIGZlYXR1cmUsIHdoaWNoIHNoYWxsIGJlIHN1cGVyc2VkZWQgYnkgYSBiZXR0ZXIKc29s
dXRpb24uIFdlIGFsc28gYWRkIGEgc2V0IG9mIGNvbW1vbiBtb2RlcyBmb3Igc2NhbGluZyBzaW1p
bGFybHkuClVzZXJzcGFjZSBjYW4gc3RpbGwgYWRkIHdoYXRldmVyIG1vZGUgdGhleSB3YW50LiBT
byBJIGRvbnQgc2VlIGEgcmVhc29uCndoeSB0aGlzIGNhbnQgYmUgaW4gdGhlIGtlcm5lbC4KCi0t
CgpSZWdhcmRzLApBdXJhYmluZG8gUGlsbGFpCgo+IAo+IAo+IFRoYW5rcywKPiBwcQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
