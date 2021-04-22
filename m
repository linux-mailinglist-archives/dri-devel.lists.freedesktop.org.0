Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 204E43682C9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 16:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259396EAA6;
	Thu, 22 Apr 2021 14:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770051.outbound.protection.outlook.com [40.107.77.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EE46EAA6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 14:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbFA3QEZcLGXhdoEozqX7YJKObOPCujGuHCUSqoXkUIsT/FlZtTzwqpCGEvSbj6F1z9TCYK6Am8jpGJbpc8NUmcKLu6fveCmZPBdW4mej2+9b9EjnEFdiQMUn1A8fP1qSjU1BYBeESmYnMD2sM5RRh7aT3RUjaqBePtA2FOOd5cnLfAg05tXU63T5ClUPIY5JNJyWa9AZgkcDPQhQn1jYXgxqXISd79U02Kd0JQghsqsb/4CIOZBpDWbcigYKOhAlpVIC9wiBl0Ki6oyKcm4IkESWozaA9hyOYwNr4nnvbX6aEi+5D2XjZgQzD15k55oTCeqigTccHn8yskq6/QEmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xg3oqbRXBCgEBVIQrzYzITr0BWlUkudGguU09kvrkd0=;
 b=gkXZuxfJfG0cLVF3HCfIrDmhcUXf7AsFEcCzbP6hcCUTV7JiKfT5aGSOdfK7gQPDqHSzgOPBgq9cl40+rNpmv6ZO3OlURMeKzmzDCP4Q3om05BuXKI3BLLVwvuIYZRpE+prgto8vxQbl61IVGQTnOwYkRcmYsr14qSPnkD0fEdwsqkwGZlrTKnfzLmZaWr76edw3xlOt/9OyjasORuS2yZESlO9vROTt7JIPgz6rkp+T3vztrkNo7B7HB4odrWTuLobLrd2i9NURyXwIXle5DqkJof/FZHmgZi9jIyadBjCETfIq7R/7cCzAEZbX9Tk0cDaVp7dTKKRHGqJ1fUlrfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xg3oqbRXBCgEBVIQrzYzITr0BWlUkudGguU09kvrkd0=;
 b=yzWTSw554mbX5LDg/gS/ZV8vAQTVZoHJs+nKpkbALTQEQjbpb/aHiJByV70v6cCVzH0WWwBN0pZJ3Jdinux7N6WWfWS6VC1DEw2aOh+F3FW1M+7ifeCz6+7KV3Xc5PiqJdVewLqt8WgD5xffnGY746y0CqGOCdscXpyK1+IAzd8=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=vmware.com;
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6702.namprd05.prod.outlook.com (2603:10b6:208:dd::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.7; Thu, 22 Apr
 2021 14:53:38 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02%7]) with mapi id 15.20.4065.023; Thu, 22 Apr 2021
 14:53:37 +0000
Subject: Re: [PATCH] drm/ttm: remove special handling for non GEM drivers
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org
References: <20210419092853.1605-1-christian.koenig@amd.com>
 <088bf716-e342-d5f2-c2f1-111533508f69@gmail.com>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <7c335ed4-8d6f-72f2-9065-0066763c0816@vmware.com>
Date: Thu, 22 Apr 2021 10:53:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <088bf716-e342-d5f2-c2f1-111533508f69@gmail.com>
Content-Language: en-US
X-Originating-IP: [108.36.85.85]
X-ClientProxiedBy: MN2PR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:208:239::31) To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (108.36.85.85) by
 MN2PR08CA0026.namprd08.prod.outlook.com (2603:10b6:208:239::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend
 Transport; Thu, 22 Apr 2021 14:53:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29e58289-d0f9-4634-8de2-08d9059e68d2
X-MS-TrafficTypeDiagnostic: MN2PR05MB6702:
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR05MB67025B2693AC73D03A41AF65CE469@MN2PR05MB6702.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kRktqy8hD7Co6cBJnhYJ4GPGacRdvktT2msrP303V1thK3KSh6qMVIXRTQy8bsgo67iGpOub78hSfwm3tWRggmSa9pLeWGZtR3ADB22L/vCV38aQ+4EyziWKncOlpR06FfFvNlYWqm4U28CV8aOcmLgdm0VrQ7GvEGUn400lb7KlJ6p9Fsgdy+R5xww8iQQCHeEVsyCjD8RFxMKHpOHDA+J9vBafAQeu7zimpThxke4y61xdrexmENbTuAcpMTxLJtHioc35EQCIlN2zR7zV6kdIw+KSzR3+RXzAaayjX3XP9iPMedsk7cx7A6V0uXwsZ1RrzAvLSQv520kSsP2DT9D+IWtizGdoJdbBlPURXZf4iRkWfq+t6Bh8CUopi5BWlJ5uIUk4oCkmkZJ5jxqoMdokseSvQOxH0TDBjVli5KoLm3xgQlCf3+tsT5bD6vznRWGd4pONnFuxs3iu2iqlCSed1QkRC2yQ04ptwJvoODNw/kdYrmju8Qdiep8dOHp4HVw3tiNYGwQMl5u598FC4sn+QFSIoB7ZvpTtwU7XbDC0GHtyHS/zeYdqprk1blQSqW5Bqtsvpaccq76nzQu8d1nwPBkWMz/w0NTFpd52i3HtHL6UTCHikjG3EOU5VnE3m3Ox6dNUfMsFSGmtEJnlVoaEFjWd58qOkgNUjfVU7G7DJ8Vup0eks2PO7zNVdqjC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(8936002)(316002)(16576012)(107886003)(2906002)(5660300002)(8676002)(4326008)(53546011)(6486002)(86362001)(36756003)(31686004)(66556008)(4744005)(38100700002)(31696002)(66946007)(16526019)(956004)(2616005)(26005)(66476007)(186003)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cnIvVVZVTWxvMitaUklyb3ZnSUZwWVA4bDhCTTkwTHVtcUdScndnZHlWcjZh?=
 =?utf-8?B?N0crNENZbFRNOXNXNmR4Vy84OG9PK1MyaVF1QlVneHZaZlRVcVVKay8vbFVM?=
 =?utf-8?B?UDcyc3M4TWR1eGtoOUN5NGVxcUNhQnlDTEw4V3VYU29nQkFoU0cvZlUxVE5S?=
 =?utf-8?B?dXp0UklaeHBTclJzMjJ6TC9SUnhIb29CeWdwU2dQZ25xQTNrWnh1SEpZdTlW?=
 =?utf-8?B?eWtCRy8yaTl5QVJTQzM5QWdsR1U0MmowVmswWG5KdWFrRDFxcFFzTXJVSzdr?=
 =?utf-8?B?UVJrckc2VlN5SUxtbVJuNXkzMzZ2eTZTL3gyTlNkNDdKY2lDSFdxK2E0V1Q1?=
 =?utf-8?B?NGE5WHg3NFY4Ny9rQzljNTlpTzdTWTZrMTIyRGdsVVUzN1hTZ1ZiR1VrT3c3?=
 =?utf-8?B?SVFJdzV4N0NCWEtxWnJYYW1QbWJnRzU2eHBnRWRCaWI1RUMrOC9STFdxQ0ZD?=
 =?utf-8?B?UUVzS1ZHb3oxRlhsakI1MzlSdVl0NzQ0bzVZb3EvU0R1ZEhmQjJFaFRETWFu?=
 =?utf-8?B?d2p4ZEpMbjFaS3BuRFc3QUxnRVNrem9DV0ZCZzVBem9FTkQ1WENodXcrTFpB?=
 =?utf-8?B?L0wrWDE2T2piT0ZPRFpZWWtoYks4YlpaMzFMbm90VlFWelRxWTNneDJraVVC?=
 =?utf-8?B?U3FHdGwzNlpCOXZKbEIzT2lKd2RSdXM4MENROTMvakFjaVZtQisvQnQ0Uk5k?=
 =?utf-8?B?dlR1S0hUWFBLWU40Q3JrMXlrNlNiYTE4RzAyZlFFSEtrUERxUENleTg4ZEh2?=
 =?utf-8?B?YnhKNS9zTDdJV0RtaDJzaW15N04wSWMxVTZoQkJsVlJHellyZHNVVWtkaTNj?=
 =?utf-8?B?cUVuck03cnljV1lkUHBqeWlCb0c3ajc1VnZGTUV0a3dtUlBIT3Z0R0FqMTJZ?=
 =?utf-8?B?RzRRVEdMclUrcGlYTUM5ZTRWTWJyc2V3ZHN5SHBqTEtPRWNXQ0VTNTV5QWEz?=
 =?utf-8?B?d0MyTXNqb0JLOXdVN0lML1NVOVZFNFZNbkJ1QkVQRDdzMENFTDI5NFhnbGxh?=
 =?utf-8?B?MXNiQ1JjNG1jbWd2TTFpcGUzN1Q1dzZvTE1qYUxneWJ0dng4T1o4bXl2bTE3?=
 =?utf-8?B?dnJKa1BjdGhtMnErLzZwbzFjNjEya21sYU1IY2RmV3pKU3JJWStFSE16SE5k?=
 =?utf-8?B?NmxiQTUxaFlHRlFxRWdza2R4Nng3N2RuN2NNTGxCR25qZ1QyRFdwUHVBZkVn?=
 =?utf-8?B?Y2VBLzFKNUt1Sk5aSjJYN2tGR2FrUDRWR2FzQkF2T1lpWkhKc2UydG93RWF1?=
 =?utf-8?B?VDBLZWU2bVR6UVFDNEpRTWo2L1R4RnhkZW1IcytmY0pMUlNTV2QraTZYUW1S?=
 =?utf-8?B?UDBPYSs2WXB1VVZmUUVIMGZuNTR6OGZ1Wm9rSGpvYkwrZWhXb1hPQzRaaXRx?=
 =?utf-8?B?RERlQ3hVcnd4d1Iva05xcFZLbmVvN3YxZE5IUWVyZkpaS2lPN2xoT1lIcUI0?=
 =?utf-8?B?THBRVXM1WnFyZGlSeVNFbzBwdEp0QlpKK2VlcHpySVgrYnB1TG5WTUhkQndi?=
 =?utf-8?B?U24yaUI0STBISXJ0ZDFmYkhJSzJnSlIvVnJoUHJ2QmhNZ1NjMjBwZ2dieUJs?=
 =?utf-8?B?a3lOOWtJZGkyMEk3N0d5azQxV1A3bzBLeDM1SitQcy93MGRSajlOQmdhQkVF?=
 =?utf-8?B?MFlaejBxTGxYa0Q3ZlFvMkdqNEZacVdoRE1IYm1aRU9Dc3lGTTVSUmliYU5k?=
 =?utf-8?B?T2dDZzdNVUtrM3kvY3dQWkV4bEZiRmZQQWxpWGRINjVYVHJDcWlGcHRHZmo3?=
 =?utf-8?Q?dQwUafpXOlheD744FoesvHbyYxIWw4VFVvH+pEF?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e58289-d0f9-4634-8de2-08d9059e68d2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 14:53:37.8722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jr8FS+rYTHcZv81bbsTcYxiif3rCegaylsghrUFjuzXggHcNrsxe1y2LLRPpJwZ3/xiijLqRwOmng1gaLzIlzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6702
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
Cc: ray.huang@amd.com, Roland Scheidegger <sroland@vmware.com>,
 tzimmermann@suse.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNC8yMi8yMSA3OjU5IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IFphY2sgb3IgUm9s
YW5kIGFueSBvYmplY3Rpb25zIHRvIHRoaXM/Cj4gCj4gVGhlcmUgc2hvdWxkbid0IGJlIGFueSBm
dW5jdGlvbmFsIGNoYW5nZS4KPiAKClNvcnJ5LCB0aGF0IGxvb2tzIGdvb2QuIEkgd2FudGVkIHVz
IHRvIGFkZCBnZW0gc3VwcG9ydCBmb3IgYSB3aGlsZSBub3csIHRoaXMganVzdCBhZGRzIG1vcmUg
cmVhc29ucyB0byBkbyBpdCBmb3IgbmV4dCBtZXJnZSB3aW5kb3cuCgpSZXZpZXdlZC1ieTogWmFj
ayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
