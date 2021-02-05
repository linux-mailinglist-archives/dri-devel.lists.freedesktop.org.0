Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BEB310936
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 11:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC14D6F3F2;
	Fri,  5 Feb 2021 10:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2C66F3F2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 10:36:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBLEx6B2VZKcA9oyzI3cIH13uK29bHCfLUeWKyA6LlmKGGEwxF/yHBlLyNi2QIn+LQYWMEgZAqOnYxzEfXh6oA9Q6CkzFRnFYBSzOad10FKQEOwvh42Q/hLzbuDIwmMIPTpkjoDrVz066UbJCcIsg1mUeNZUaAUGOUqgV6zuaIVHD1AkPiW7SqLo4ON/iyIlgsSRx/tZ467rA61iZiZu8WMKpSRAYbd4iRe9HZxH8tohfiyBle/jhCfP3v1z9qbp0JBd16GdshNl6SIlDQDm/qAzIqH1zEE5PbaewPXYqX5v345OYbnaOZcG/5+FOYbdn33ivvO1wI0kgDWakHhSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjtMvA23UpP9595/61adkwqEcNI/T/ErIEX68PTmikQ=;
 b=JyfgbPX2/V6H/kPsi5MhFv/z5mcOXjMV5bfLm8UVJCtPE3ZLtM094kYE4A7hTIgnD2IFza8vpZvXSA39bu+4sSha2fk071+0npbJUyJ53zYMpca+YeleY78OnkUH+/R9lLlvVnlDb/WtKYjVZ/QemykCoyW2JzoexCb6C6p/VmNIrYF24YrpVlW23vYpCBdztZYvRjCiA7E9ekeLr/W27skDeBO8ROfe5M+VaIJfqXI/3iA5K8ZazSCNshdMzuKUQ9gCcbD4EXZ2+BOKmNxRxoZRenmUt/rM7/yaZAMot8gbcztMH6Gdev1SZwbSqPOVTg5exFadzL2uU4ateBQUnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjtMvA23UpP9595/61adkwqEcNI/T/ErIEX68PTmikQ=;
 b=fasUYsFrobiDGSVOozV5f/JY14GUg+CW+00o4j0/lE55YCwH5p7C0kuu+afIyu9k2ESiHbZky6GuokJigWd1HURrbZK3PUjhlNYXmUJKogmenol1XYZlr+V3lYb08VxQT+BqOHjveKx8F1z99krnuWGFW+5P/cFNAYh2FtYkTvs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4898.namprd12.prod.outlook.com (2603:10b6:208:1c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Fri, 5 Feb
 2021 10:36:10 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.023; Fri, 5 Feb 2021
 10:36:10 +0000
Subject: Re: [RFC][PATCH v6 0/7] Generic page pool & deferred freeing for
 system dmabuf heap
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>
References: <20210205080621.3102035-1-john.stultz@linaro.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0864e2a8-3a44-e7db-828f-abdac7c64471@amd.com>
Date: Fri, 5 Feb 2021 11:36:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210205080621.3102035-1-john.stultz@linaro.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM9P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM9P195CA0030.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.21 via Frontend Transport; Fri, 5 Feb 2021 10:36:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 281f19d8-414e-4f1d-8aee-08d8c9c1da17
X-MS-TrafficTypeDiagnostic: BL0PR12MB4898:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4898FD111BA1336ADA40D09583B29@BL0PR12MB4898.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: juBsqG6hgm0EgaBSjX1fojEMJ39dQYBil5ObRyBUJH4X56W+NRZcIyqVojmbr2VrFk1FUYuGfL9nGO1Fic2tLeRYYM67Lns5WKIaD8Ki2Sb6PP4D1oBjsTuP92ZC8QsuoiKRFDfgilHkx0Fh3y3L6FxzfZj1cxAEOy6cuUe1hhQEAq5ZS9bkmJrALXobNmYdq+o7pU6G/OSioqMW70aZjaHKSyRrEjcWbHz8CR/hoxX3ucycsmjhEHMpf3yaRlCs9Wju2U/h+JhlPZR69DT5UES3mtEfBpNbfkdk03eiMKnUaGAiep8ZewupJPncpT1jiBJKakCH2Ip3PQrQkQ3zSS5pGvnp9/mhR1GvCaXiaNL17o7+ytp79YmFnESe5luuHQtX4hn9SUrEFLBybzuuaA5Ntxx1lPKaYRaX4u+kiJc7Z+1Fv4++qXBs/r2kmvk985s5rhivrk/CEPd65acaZybQbFtXLy9f6Yji3OF74btS7NUaB6q/gFO9+pu1zhEDW2zavyXpUauPh87z9G1vPhsoyRv3iy5uNWC4qKh4hJmY7NmUNmCVjoEkfsksHzP+wbVXsfwJuFiVQdeSFtwo5saMHmplWiU58ZS8hWQCmMRaJ+5TGrlLPDcPXZzYbzmVuwl0KtmHTVTw8RMILRcap2SZT/wJDTv8Eku1kAY47078eHkfbYXhek68QjMnW/CzxUrPuF49ZTLrmpPW88nH/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(16526019)(186003)(6486002)(6666004)(8676002)(86362001)(2906002)(7416002)(31696002)(31686004)(83380400001)(966005)(5660300002)(2616005)(478600001)(8936002)(36756003)(45080400002)(66556008)(54906003)(66946007)(110136005)(316002)(52116002)(66476007)(4326008)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?enV6SktXZ3ZIbllhUi82amxnNzNJQlc1UXp2VGFFSmhFdnJaM3lOY1d1NzY5?=
 =?utf-8?B?OFhsbENrdzJkQmxjMWNCOTZ4OEZKSkg5SkROckpuNUdHLy9pZ2plQXlTOElv?=
 =?utf-8?B?QVRkOXFrc3RoZnVXajlIYnZFRjZxcW1VVktuMExWU0N0cHA4blFnVnU2N3NI?=
 =?utf-8?B?STd2UlFhL3EvVGZ1akF0QmduRHZuMXFUVGNmeHpLUTlPQXNoVE1hWEtwbTU0?=
 =?utf-8?B?NnhlVHY0M3h6U0tzRFBlemVQd0ZKckp1ODNnVXRoOTdQYVlibEI4U3B0MDA3?=
 =?utf-8?B?ZEVDUVhXOTFoSnF0cXR1OXE5b3lNU09SVmpIWjZLVjRnQ3dRRTBuM3VRVkhi?=
 =?utf-8?B?SDVKK1lPdWFwNmJhMmM0Y1prSTN0L3VWMnZqaHFpV2dpeW9uT2l6S3RrSCt4?=
 =?utf-8?B?TzFROEMvaDdTTVdYZjdldVJkcnhpZG9kK3pSVllpSmtjZ2pMcFk1WjM1THhP?=
 =?utf-8?B?NUhVVkpXWWlTT1BRZkN2YXFneFhQelVUN2JmV25tM1d5K1BGZWlJR2tuVHVF?=
 =?utf-8?B?TTN0UWZUT05iT21rQlBxREZzSW9Va3JFZHJ4cFBocGNEZEVUbGYrZzhKOXRH?=
 =?utf-8?B?bHh0ckJXWG54cTBYSmoyOHdqanNxZkYxL2NMSVFLdktsZUMrWWZLMWNKUy9q?=
 =?utf-8?B?TjdGY0E4S2poUnRZdmJNeXdqR1UxL0hFelp5OGV5V3lyVmF6cWMyZ0ZlNTBq?=
 =?utf-8?B?RU1OeGNMakFtN25OUTVlWHFUQ0RKTDZoQi9iNzgyNlBDa2xxTnFPK2dWdlZk?=
 =?utf-8?B?NXllWGRveDVjYmJoVzJSVXlkMGtaT1Y1RzV4NWtFQURaME1NKzE5VkdsaEVZ?=
 =?utf-8?B?c2J4dHE1clFJQSt0QmM1UHZPNFUvLzlpZ1k1Q1FieGRyVUE5R1JwOWxHVkVY?=
 =?utf-8?B?aGhHZWVQOHFIMHkwRmo4MFkvUzNNS21WRmJqa1dWRWtwTGRyVjRZM1lyV1Zu?=
 =?utf-8?B?VjRtWmpMS1ZlWllhYityZWRlUGtXV3BVLzlmdXU2dnFwWC9rbjRVdmZ0VUNT?=
 =?utf-8?B?YVgzd0FGVjZzZUZ0TXUxQzhXSGhiU25nbzdzREdWd1d1Tmx0Y254ZmVMc0ZL?=
 =?utf-8?B?Q1NlcjN5cVBYN2d3UzFQZUR6d002c0ZCeFZHeVNpQmVsS0FLNEVjNnhzaWlH?=
 =?utf-8?B?UVNWSExxT20wbW51YkdBeFc2SmRGR2VweEdZWWhKVkg4RmNOVDJ3Z0QzekRZ?=
 =?utf-8?B?U1VFVWNONzBadkE4aWlwaEhSb3c1KzZMZW12a1JBZ0l6UC9FdmxOZ2x3LytZ?=
 =?utf-8?B?cytmcXZ6aGtJaUNMQUVpcVV3K0YvMXRYcGlIQmdaRnpxSStWZEdzU3IvYzMy?=
 =?utf-8?B?Z3Fzc0hvVi9rS0lMQ08xbElSdjh3eGVaQXUwNVFBSkI5MHJkVkdNMU00T3hJ?=
 =?utf-8?B?ZXQyUnNNWExPaERGdHNsYlZieWJ6R2hFWVBkanptQjAvNzltOXpJbDhtQ1o2?=
 =?utf-8?B?Y1NEbWcwOFJjSTBMVHBCa0F2N0thTGN4TGwwdUNhZmdxbzlwaVlOaVRyTUYz?=
 =?utf-8?B?ZVJiZjREYjVDTG1CeGRhTTlWNURWV0o2ZlI0UENad1M1K2s4SzhrV2hJZ0hi?=
 =?utf-8?B?ZXdKdTZ5dWlkMFA2cUVYaDRZaUJRYkxuR1FxVnhjNzRxRjRnV1J6S3FVL3pl?=
 =?utf-8?B?MW5YaVA4TUJnTlFpcGxscjRLVjhlOXZjNGlvUDEyaWlNaXF6cXFDa0RXUm5x?=
 =?utf-8?B?OEZ1YlZKSisyWkthajZFQVJkZGNyVHNyKzB4NkV6d2ZNQUphVlUwUG9RbUNI?=
 =?utf-8?B?LzRuRjV5bDBHanZqYzJTU2gzbURpSFBoSlRibHg5SU9Xc0tNcmYvakRpSjRL?=
 =?utf-8?B?RVlKZldXSkJES2VNd2VYQ25SdENxYXlqNHliL0pUMlZhcXVPL29FdFV4YlIz?=
 =?utf-8?Q?1hyakYX6Sn3yG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 281f19d8-414e-4f1d-8aee-08d8c9c1da17
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 10:36:10.0770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMN98aisSn71wtx0kzYhwTXEC0jg/0Z8jePAmQP65KWwuPRkhBdIXC2a9PDgQNLx
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
Cc: dri-devel@lists.freedesktop.org, Sandeep Patil <sspatil@google.com>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=c3=98rjan_Eide?= <orjan.eide@arm.com>, linux-media@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMDIuMjEgdW0gMDk6MDYgc2NocmllYiBKb2huIFN0dWx0ejoKPiBUaGlzIHNlcmllcyBp
cyBzdGFydGluZyB0byBnZXQgbG9uZywgc28gSSBmaWd1cmVkIEknZCBhZGQgYQo+IHNob3J0IGNv
dmVyIGxldHRlciBmb3IgY29udGV4dC4KPgo+IFRoZSBwb2ludCBvZiB0aGlzIHNlcmllcyBpcyB0
cnlpbmcgdG8gYWRkIGJvdGggZGVmZXJyZWQtZnJlZWluZwo+IGxvZ2ljIGFzIHdlbGwgYXMgYSBw
YWdlIHBvb2wgdG8gdGhlIERNQS1CVUYgc3lzdGVtIGhlYXAuCj4KPiBUaGlzIGlzIGRlc2lyZWQs
IGFzIHRoZSBjb21iaW5hdGlvbiBvZiBkZWZlcnJlZCBmcmVlaW5nIGFsb25nCj4gd2l0aCB0aGUg
cGFnZSBwb29sIGFsbG93cyB1cyB0byBvZmZsb2FkIHBhZ2UtemVyb2luZyBvdXQgb2YKPiB0aGUg
YWxsb2NhdGlvbiBob3QgcGF0aC4gVGhpcyB3YXMgZG9uZSBvcmlnaW5hbGx5IHdpdGggSU9OCj4g
YW5kIHRoaXMgcGF0Y2ggc2VyaWVzIGFsbG93cyB0aGUgRE1BLUJVRiBzeXN0ZW0gaGVhcCB0byBt
YXRjaAo+IElPTidzIHN5c3RlbSBoZWFwIGFsbG9jYXRpb24gcGVyZm9ybWFuY2UgaW4gYSBzaW1w
bGUKPiBtaWNyb2JlbmNobWFyayBbMV0gKElPTiByZS1hZGRlZCB0byB0aGUga2VybmVsIGZvciBj
b21wYXJpc2lvbiwKPiBydW5uaW5nIG9uIGFuIHg4NiB2bSBpbWFnZSk6Cj4KPiAuL2RtYWJ1Zi1o
ZWFwLWJlbmNoIC1pIDAgMSBzeXN0ZW0KPiBUZXN0aW5nIGRtYWJ1ZiBzeXN0ZW0gdnMgaW9uIGhl
YXB0eXBlIDAgKGZsYWdzOiAweDEpCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gZG1hYnVmIGhlYXA6IGFsbG9jIDQwOTYgYnl0ZXMgNTAwMCB0aW1lcyBp
biA4NjU3MjIyMyBucyAgICAgICAgICAxNzMxNCBucy9jYWxsCj4gaW9uIGhlYXA6ICAgIGFsbG9j
IDQwOTYgYnl0ZXMgNTAwMCB0aW1lcyBpbiA5NzQ0MjUyNiBucyAgICAgICAgICAxOTQ4OCBucy9j
YWxsCj4gZG1hYnVmIGhlYXA6IGFsbG9jIDEwNDg1NzYgYnl0ZXMgNTAwMCB0aW1lcyBpbiAxOTY2
MzUwNTcgbnMgICAgICAzOTMyNyBucy9jYWxsCj4gaW9uIGhlYXA6ICAgIGFsbG9jIDEwNDg1NzYg
Ynl0ZXMgNTAwMCB0aW1lcyBpbiAzNTczMjM2MjkgbnMgICAgICA3MTQ2NCBucy9jYWxsCj4gZG1h
YnVmIGhlYXA6IGFsbG9jIDgzODg2MDggYnl0ZXMgNTAwMCB0aW1lcyBpbiAzMTY1NDQ1NTM0IG5z
ICAgICA2MzMwODkgbnMvY2FsbAo+IGlvbiBoZWFwOiAgICBhbGxvYyA4Mzg4NjA4IGJ5dGVzIDUw
MDAgdGltZXMgaW4gMzY5OTU5MTI3MSBucyAgICAgNzM5OTE4IG5zL2NhbGwKPiBkbWFidWYgaGVh
cDogYWxsb2MgMzM1NTQ0MzIgYnl0ZXMgNTAwMCB0aW1lcyBpbiAxMzMyNzQwMjUxNyBucyAgIDI2
NjU0ODAgbnMvY2FsbAo+IGlvbiBoZWFwOiAgICBhbGxvYyAzMzU1NDQzMiBieXRlcyA1MDAwIHRp
bWVzIGluIDE1MjkyMzUyNzk2IG5zICAgMzA1ODQ3MCBucy9jYWxsCj4KPiBEYW5pZWwgZGlkbid0
IGxpa2UgZWFybGllciBhdHRlbXB0cyB0byByZS11c2UgdGhlIG5ldHdvcmsKPiBwYWdlLXBvb2wg
Y29kZSB0byBhY2hpZXZlIHRoaXMsIGFuZCBzdWdnZXN0ZWQgdGhlIHR0bV9wb29sIGJlCj4gdXNl
ZCBpbnN0ZWFkLiBUaGlzIHJlcXVpcmVkIHB1bGxpbmcgdGhlIGZhaXJseSB0aWdodGx5IGtuaXQK
PiB0dG1fcG9vbCBsb2dpYyBhcGFydCwgYnV0IGFmdGVyIG1hbnkgZmFpbGVkIGF0dG1lbXB0cyBJ
IHRoaW5rCj4gSSBmb3VuZCBhIHdvcmthYmxlIGFic3RyYWN0aW9uIHRvIHNwbGl0IG91dCBzaGFy
ZWQgbG9naWMuCj4KPiBTbyB0aGlzIHNlcmllcyBjb250YWlucyBhIG5ldyBnZW5lcmljIGRybV9w
YWdlX3Bvb2wgaGVscGVyCj4gbGlicmFyeSwgY29udmVydHMgdGhlIHR0bV9wb29sIHRvIHVzZSBp
dCwgYW5kIHRoZW4gYWRkcyB0aGUKPiBkbWFidWYgZGVmZXJyZWQgZnJlZWluZyBhbmQgYWRkcyBz
dXBwb3J0IHRvIHRoZSBkbWFidWYgc3lzdGVtCj4gaGVhcCB0byB1c2UgYm90aCBkZWZlcnJlZCBm
cmVlaW5nIGFuZCB0aGUgbmV3IGRybV9wYWdlX3Bvb2wuCj4KPiBJbnB1dCB3b3VsZCBiZSBncmVh
dGx5IGFwcHJlY2lhdGVkLiBUZXN0aW5nIGFzIHdlbGwsIGFzIEkgZG9uJ3QKPiBoYXZlIGFueSBk
ZXZlbG9wbWVudCBoYXJkd2FyZSB0aGF0IHV0aWxpemVzIHRoZSB0dG0gcG9vbC4KCldlIGNhbiBl
YXNpbHkgZG8gdGhlIHRlc3RpbmcgYW5kIHRoZSBnZW5lcmFsIGlkZWEgc291bmRzIHNvbGlkIHRv
IG1lLgoKSSBzZWUgdGhyZWUgbWFqb3IgdGhpbmdzIHdlIG5lZWQgdG8gY2xlYW4gdXAgaGVyZS4K
MS4gVGhlIGxpY2Vuc2luZywgeW91IGFyZSBtb3ZpbmcgZnJvbSBCU0QvTUlUIHRvIEdQTDIuCjIu
IERvbid0IGFkZCBhbnkgbmV3IG92ZXJoZWFkIHRvIHRoZSBUVE0gcG9vbCwgZXNwZWNpYWxseSBh
bGxvY2F0aW5nIGEgCnByaXZhdGUgb2JqZWN0IHBlciBwYWdlIGlzIGEgbm8tZ28uCjMuIFdoYXQg
YXJlIHlvdSBkb2luZyB3aXRoIHRoZSByZWNsYWltIHN0dWZmIGFuZCB3aHk/CjQuIEtlZXBpbmcg
dGhlIGRvY3VtZW50YXRpb24gd291bGQgYmUgbmljZSB0byBoYXZlLgoKUmVnYXJkcywKQ2hyaXN0
aWFuLgoKPgo+IHRoYW5rcwo+IC1qb2huCj4KPiBbMV0gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3Mu
cHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGYW5kcm9pZC5nb29nbGVz
b3VyY2UuY29tJTJGcGxhdGZvcm0lMkZzeXN0ZW0lMkZtZW1vcnklMkZsaWJkbWFidWZoZWFwJTJG
JTJCJTJGcmVmcyUyRmhlYWRzJTJGbWFzdGVyJTJGdGVzdHMlMkZkbWFidWZfaGVhcF9iZW5jaC5j
JmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzJkYzRkNmNi
M2VlMjQ2NTU4YjllMDhkOGM5YWNlZjlhJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4
M2QlN0MwJTdDMCU3QzYzNzQ4MTA5MTkzMzcxNTU2MSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhl
eUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZD
STZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1vTWdWc3JkbHdTJTJCcVp1dWF0alRpV0R6TVU5U2lV
VzVlUmFyNXh3VCUyQkhZUSUzRCZhbXA7cmVzZXJ2ZWQ9MAo+Cj4gQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KPiBDYzogQ2hyaXN0aWFuIEtvZW5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgo+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+
IENjOiBMaWFtIE1hcmsgPGxtYXJrQGNvZGVhdXJvcmEub3JnPgo+IENjOiBDaHJpcyBHb2xkc3dv
cnRoeSA8Y2dvbGRzd29AY29kZWF1cm9yYS5vcmc+Cj4gQ2M6IExhdXJhIEFiYm90dCA8bGFiYm90
dEBrZXJuZWwub3JnPgo+IENjOiBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFya2V5QGFybS5jb20+
Cj4gQ2M6IEhyaWR5YSBWYWxzYXJhanUgPGhyaWR5YUBnb29nbGUuY29tPgo+IENjOiBTdXJlbiBC
YWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29tPgo+IENjOiBTYW5kZWVwIFBhdGlsIDxzc3Bh
dGlsQGdvb2dsZS5jb20+Cj4gQ2M6IERhbmllbCBNZW50eiA8ZGFuaWVsbWVudHpAZ29vZ2xlLmNv
bT4KPiBDYzogw5hyamFuIEVpZGUgPG9yamFuLmVpZGVAYXJtLmNvbT4KPiBDYzogUm9iaW4gTXVy
cGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KPiBDYzogRXplcXVpZWwgR2FyY2lhIDxlemVxdWll
bEBjb2xsYWJvcmEuY29tPgo+IENjOiBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNpb24uZnI+Cj4g
Q2M6IEphbWVzIEpvbmVzIDxqYWpvbmVzQG52aWRpYS5jb20+Cj4gQ2M6IGxpbnV4LW1lZGlhQHZn
ZXIua2VybmVsLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4KPiBK
b2huIFN0dWx0eiAoNyk6Cj4gICAgZHJtOiBBZGQgYSBzaGFyYWJsZSBkcm0gcGFnZS1wb29sIGlt
cGxlbWVudGF0aW9uCj4gICAgZHJtOiB0dG1fcG9vbDogUmVuYW1lIHRoZSB0dG1fcG9vbF9kbWEg
c3RydWN0dXJlIHRvIHR0bV9wb29sX3BhZ2VfZGF0Cj4gICAgZHJtOiB0dG1fcG9vbDogUmV3b3Jr
IHR0bV9wb29sX2ZyZWVfcGFnZSB0byBhbGxvdyB1cyB0byB1c2UgaXQgYXMgYQo+ICAgICAgZnVu
Y3Rpb24gcG9pbnRlcgo+ICAgIGRybTogdHRtX3Bvb2w6IFJld29yayB0dG1fcG9vbCB0byB1c2Ug
ZHJtX3BhZ2VfcG9vbAo+ICAgIGRtYS1idWY6IGhlYXBzOiBBZGQgZGVmZXJyZWQtZnJlZS1oZWxw
ZXIgbGlicmFyeSBjb2RlCj4gICAgZG1hLWJ1Zjogc3lzdGVtX2hlYXA6IEFkZCBkcm0gcGFnZXBv
b2wgc3VwcG9ydCB0byBzeXN0ZW0gaGVhcAo+ICAgIGRtYS1idWY6IHN5c3RlbV9oZWFwOiBBZGQg
ZGVmZXJyZWQgZnJlZWluZyB0byB0aGUgc3lzdGVtIGhlYXAKPgo+ICAgZHJpdmVycy9kbWEtYnVm
L2hlYXBzL0tjb25maWcgICAgICAgICAgICAgICAgfCAgIDUgKwo+ICAgZHJpdmVycy9kbWEtYnVm
L2hlYXBzL01ha2VmaWxlICAgICAgICAgICAgICAgfCAgIDEgKwo+ICAgZHJpdmVycy9kbWEtYnVm
L2hlYXBzL2RlZmVycmVkLWZyZWUtaGVscGVyLmMgfCAxNDUgKysrKysrKysrKwo+ICAgZHJpdmVy
cy9kbWEtYnVmL2hlYXBzL2RlZmVycmVkLWZyZWUtaGVscGVyLmggfCAgNTUgKysrKwo+ICAgZHJp
dmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMgICAgICAgICAgfCAgNzcgKysrKy0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICsKPiAg
IGRyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiAg
IGRyaXZlcnMvZ3B1L2RybS9wYWdlX3Bvb2wuYyAgICAgICAgICAgICAgICAgIHwgMjIwICsrKysr
KysrKysrKysrKwo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jICAgICAgICAgICAg
ICAgfCAyNzggKysrKysrLS0tLS0tLS0tLS0tLQo+ICAgaW5jbHVkZS9kcm0vcGFnZV9wb29sLmgg
ICAgICAgICAgICAgICAgICAgICAgfCAgNTQgKysrKwo+ICAgaW5jbHVkZS9kcm0vdHRtL3R0bV9w
b29sLmggICAgICAgICAgICAgICAgICAgfCAgMjMgKy0KPiAgIDExIGZpbGVzIGNoYW5nZWQsIDYz
OSBpbnNlcnRpb25zKCspLCAyMjUgZGVsZXRpb25zKC0pCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9kbWEtYnVmL2hlYXBzL2RlZmVycmVkLWZyZWUtaGVscGVyLmMKPiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2RtYS1idWYvaGVhcHMvZGVmZXJyZWQtZnJlZS1oZWxwZXIuaAo+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9wYWdlX3Bvb2wuYwo+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHJtL3BhZ2VfcG9vbC5oCj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
