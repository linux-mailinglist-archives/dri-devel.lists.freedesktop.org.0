Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44230286D3D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 05:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436A56EA1B;
	Thu,  8 Oct 2020 03:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649F66EA1B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 03:41:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qdr9mp37Ogb5aWzllc69MPunBHHxIpWcPHNUMusB/g93cL3rA56y7FYxxFEk1224kYGfU+AeiH6EnUJmYVgTfqWA6lZXayuC9Huu0K0D5uAIPcZRcyffLL8/01Cewvs9x6XzBqeyYhREzBuygTXTIEV26vh1NZG/0K7w5xmWvf4tvZyCvvTnLAFhYRjd6jaWl5CWtPqaqYoe3e2rvV9+Bdc6vIY5YDd3Xi6aUopZSapxux47oQXQX2/IZR3CtwhDkPV/0kbdMyu05Y37DBaol4iC3yc/NNNn1FaXtFBxecMvZLzRxBkGapx7pzARCGW0VUL1FW869AhQcgEabk2eKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmooVer/igSenpFSf14OnrCY+sK2NgX2mtXN7Q+8x3I=;
 b=E+QvVpfYfbILUTm3UgKl+56676bM4TvoJgBtqES96YJb4sS08c+n0OcfBQ3nKYfD0vPVYYO4yNSdVJSGWBORoMZoHkshgnoDOgI2PCKdSKaNSqw4gZAKPiKQhy92sUKwNXfAC0SMkd849sPOnYNVAZVFOtvNhoe8jPFtwyH/gD+cPvf5qszcSm0uvDE8Su4iAiK8M5Tnup6CaocM00/+O5TZREKCrs7KUc/mk/JgQkWgeLPXZ/WDLnVkLmJd1MFROxrzuHG3UgK3ZEHzgQDdSSfUH6QtinipRYU/jlfx9hEFIOBJem6g33uPKdxIDMDnh6r8IhGjmuVAeKs/zRWFQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmooVer/igSenpFSf14OnrCY+sK2NgX2mtXN7Q+8x3I=;
 b=TJIpGp6NNh2QeFPD926T+gcG+/o6MBN7lY7+5snxGqHY0sKuP3qOqbG0U01Mb4a7dHF6+wy4gFp33/oYWqwS0kysDRddyoYPCvBpLrlVGj231TiuhDjNcy5jpZl2KpS7pQ8iDUh6REhuC/aILtdGg72DEDDM/Oxiy6b8Ie1fIX8=
Received: from BL0PR05MB5186.namprd05.prod.outlook.com (2603:10b6:208:8f::18)
 by MN2PR05MB6765.namprd05.prod.outlook.com (2603:10b6:208:182::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.11; Thu, 8 Oct
 2020 03:41:42 +0000
Received: from BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::6499:fc85:5382:1f06]) by BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::6499:fc85:5382:1f06%3]) with mapi id 15.20.3477.011; Thu, 8 Oct 2020
 03:41:42 +0000
From: Zack Rusin <zackr@vmware.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 3/5] drm/vmwgfx: add a move callback.
Thread-Topic: [PATCH 3/5] drm/vmwgfx: add a move callback.
Thread-Index: AQHWm3Sl+dW0s1h7d0OMVr8ffdW0kKmNEvSA
Date: Thu, 8 Oct 2020 03:41:42 +0000
Message-ID: <66BA33DA-2CAD-4528-9FD1-6A4242049F68@vmware.com>
References: <20201006000644.1005758-1-airlied@gmail.com>
 <20201006000644.1005758-4-airlied@gmail.com>
In-Reply-To: <20201006000644.1005758-4-airlied@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33781998-0cbe-4355-448a-08d86b3c1256
x-ms-traffictypediagnostic: MN2PR05MB6765:
x-microsoft-antispam-prvs: <MN2PR05MB6765C69CBA0D1F35BA383DC4CE0B0@MN2PR05MB6765.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yrc5+ccXCnqoErZSlmlIdBlkVNo1zEYA5+la+lSvCG15XOK6yQFD3zYfECnblUan1K/xzA128ONIVddAvNGpfM6TVo13UVFcG+/9JlfazrJVS1WQ+U5gMwDqMlb9rhDNtpi2ibEAQchJngKnOaCWCzjcGjJZdYOXCnoxtUBFkQNiUzmoIZG7Te74lPwecHuQ8bMclTLSddSqQ5+lcfq62u/XMAq/DrYW5CpDE/w2zVVEz5LleBnYjYgCvis/BGuORnyITsX8Boy1bpZyOJxKLtaZw2PDEFLfTVK/uUSpRckq+p4wZuFEZnZS8aneQSPKydRgoCn4oBOnx9kQWk2viQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR05MB5186.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(8676002)(6512007)(478600001)(26005)(5660300002)(6916009)(186003)(86362001)(71200400001)(6506007)(6486002)(54906003)(53546011)(8936002)(2906002)(64756008)(76116006)(2616005)(4326008)(316002)(66556008)(4744005)(66946007)(66476007)(66446008)(33656002)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: iOka6CYgpoZzcBQq7vkTefiH0CU2WzoU4UsxLdvkLkk2v9ZzYMjimZrH7UyK5yoFdfLc7cXaKC78FW13mF+YMM+u1EP7uQqireRyD3Q3HZIxzoMlbO6V8aMC72CvIx90n4XEhG7QuP7hEOm1Y2u6YVtIUh6n7XnZXjbN/0Y5/P2kEHFPMH1tVHpTZjKrIKpTF3Rkm5zaRs6q89O85lmuFjzAWCbDChwqfr97Cl5cf1hjd8gyyCX+1SaH2vdx7bvvM9QIWRcnyjP/6V+YPWJthdwRBN2lLJziyS9PLcP7WmaM6HN2K7eyo3/q2VKwjgM/Pejr05tn9K5IaO0Synh4CQsZUq+HHM3+xcBo12VaVwotHsM+tEQWLF/ysbA92gciUYhHHIBUsELDJz4mRajEGmSFXWnagJ+mMk1CL037PAYDR/N94haZK2Kqe89drOl6BOQOHqKy4+o82OzM+KXkeGJfiOsEyHvRgUHazW2TX6FUcHzgfHoTm+5Cf2L7S/IDGwFSMlp62mAJB9cV6CeJoE1pP2F7gdLL6ceH1rJM4JaJsFl6DPiYD0lYEaXg2gD0wKfobVIxCZQ8SJ8uCmbaqeRqq79UTS9DLpyXcyhOoIo8yLBeDPMRRZf8TbYc6b4YqIBM5Tl1UHaRr/iwM+4RiQ==
x-ms-exchange-transport-forked: True
Content-ID: <ED42881FB5C1EB458C592E98EBB12F74@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR05MB5186.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33781998-0cbe-4355-448a-08d86b3c1256
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2020 03:41:42.1449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1dge3jCOEEs1cnZAk3pSKLSz72BZvk+QdgBHqqfbc3MUXx/aJfArcnj8fUfCt2iOKkiTfx7FhPqehJRx+254jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6765
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
Cc: "rscheidegger.oss@gmail.com" <rscheidegger.oss@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> On Oct 5, 2020, at 20:06, Dave Airlie <airlied@gmail.com> wrote:
> 
> From: Dave Airlie <airlied@redhat.com>
> 
> This just copies the fallback to vmwgfx, I'm going to iterate on this
> a bit until it's not the same as the fallback path.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>

What are your plans for it? i.e. how is it going to be different?

Reviewed-by: Zack Rusin <zackr@vmware.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
