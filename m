Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F26B1E12E7
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 18:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B2F89B96;
	Mon, 25 May 2020 16:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 576 seconds by postgrey-1.36 at gabe;
 Mon, 25 May 2020 16:46:30 UTC
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6957889B96
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 16:46:30 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BF907C03C8;
 Mon, 25 May 2020 16:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1590424614; bh=2h/CZGk04ByZ1sDxT66kbOUs0NAZdsuH8hxSIqnpXYI=;
 h=From:To:CC:Subject:Date:From;
 b=PFGGbpdVMZ7HyV4h/23NbpR8Drxcqc7b3QYUCFb7u6ce3QLWa86Y3rk7yJl+DVQqD
 ynt3XOWuojRm3UlBTl2mTNGCTQiGm4eFukUaK84hW+YxAVF5WFgizQkmWL64UidzNM
 AXdPZvKc4SlI6UooQukn6M06zp2fQd7yrFsLuP7wOKdlSs61b3iIqAKm6e12y7+D6X
 ztbjlaRIQqIUJYFdG/b7y6aEO+a28UjZZS3+Cbz27yGK2e+Pm09+DFriy3mLA1rdam
 wlQEe3flx1tDjHu6ITPMMBsd6OeplEKGTn56NUwc9yBo8nReaOK8mqtpXm8MBZsSAr
 qcVaTVFf8EEwA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 72FD2A0067;
 Mon, 25 May 2020 16:36:51 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 25 May 2020 09:36:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Mon, 25 May 2020 09:36:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5hbXusYZdKv7iS6eDA/atv+t72gB5DdofmPqzBO7ObvnmUTnhmCxmaTZmJ6nJejN1UPvfEvJTDBPnBPPlcExyVbB9LiJNjIhR1mHup58ESg1LKeuQANxJkgnn8xkYsNu96UAo1rKCNUjkcb0uCkq+SIZ+R4+HWyogqPhM7gJ48+/f6qgSnhc6n2aZiPFOTZmkrvPlQmPYO83dnXA18fL/tzTBDC96Oxc7xBw+4+MvvTNxWtreO+9h07yV/LTK+Drc9s7fKpcGQTiV8HpK5BtYE7sIBRDG6pE/zlJzakK9ZiGlanmxbVOCqoK1uDa31O6j6tGoOWWe5MT0bdcyi9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2h/CZGk04ByZ1sDxT66kbOUs0NAZdsuH8hxSIqnpXYI=;
 b=A54dkQFIv+hEmBxsQ8qM4MKw0fGZjzik/RMu2KTydyQ8lIv00k8jsFPCNh7q0TtYWK6FFqkDZQ6MIBC9sJbehe8OLRNha0Y0aVhmBIVse9xM8EpQ0UowOL8SqtimVhSHB2AuH9rkvDdzarQW2QzXXVBj98w1/KSw/hlBNC6gVckF66SPsmjaPmaP0JV1CwSyKhwV99AvUUXLWGIVjYLoLhBo1I7QRN6hxCLUO/LwXtOFWZlVXz8ORYFJkfz/td7UwmVlqH6i6EkUdMKk7ocXFCzUgu57k4xZb4C0hYw1+YqyBBsZzFK+APWzEGRFSBNCyG8sG7c0HenreX1Iqes+HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2h/CZGk04ByZ1sDxT66kbOUs0NAZdsuH8hxSIqnpXYI=;
 b=vEa7+ByN36D+cTELCVlSIF5oeenCLjMdGgWq08m0WKtRTSl6RNNAkafR3kPieypq/+qUD+lp1rmIhuqd/At+ZLz4CQZYl/DbHPGT4Dny7BZyEMcdTod5JKZulG75+BwonUY6UnC6oSIL/Jdy0KyTNnZO195QNPNF4XHyeB8ak78=
Received: from CY4PR1201MB0136.namprd12.prod.outlook.com
 (2603:10b6:910:1a::19) by CY4PR1201MB0072.namprd12.prod.outlook.com
 (2603:10b6:910:1b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Mon, 25 May
 2020 16:36:49 +0000
Received: from CY4PR1201MB0136.namprd12.prod.outlook.com
 ([fe80::8d22:7d25:8892:a09]) by CY4PR1201MB0136.namprd12.prod.outlook.com
 ([fe80::8d22:7d25:8892:a09%8]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 16:36:48 +0000
X-SNPS-Relay: synopsys.com
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny
Thread-Topic: [PATCH 53/59] drm/arc: Move to drm/tiny
Thread-Index: AQHWMrJhv3+nTVmvX0mWiibsTolZFA==
Date: Mon, 25 May 2020 16:36:48 +0000
Message-ID: <CY4PR1201MB013664B33FE72449DB0A6F65DEB30@CY4PR1201MB0136.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [198.182.37.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 470405fc-5272-46db-f882-08d800c9d242
x-ms-traffictypediagnostic: CY4PR1201MB0072:
x-microsoft-antispam-prvs: <CY4PR1201MB007274021B74C4F9242D343FDEB30@CY4PR1201MB0072.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VlDLN7SA9+Se8OXS6OjdnCW8MG7u0TZPjDk2l4b3NcpeHJUAIizGHAVybUw8DvdcbruftDb71hUxD+rFG8K7lS3sd++qZsvGySWPahxKY4k9MyfyVCYD7rQJmIEFNHg0iiv6aKyxxVGcr3QdJlu51/J4rnt5mTVp6CGw1B3QM5CZ2HQY8yHqIPVzE2rMePKAFyfL9y83PnnHxoeTGs1jqSFkbn1jSSvzNnsPJ8qNjqroii8h5ZvDEWQJ4+spGe0G2FoNaeQZH+LAsP7Y35fvaZ1UEl1whhSjMs6/Ljo57E8nnB8E94IVFeMjfGwkObfFQl/1lVcPzr0vPEG0QzY7xQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB0136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(396003)(39860400002)(366004)(376002)(346002)(6916009)(558084003)(316002)(33656002)(478600001)(9686003)(8676002)(8936002)(52536014)(5660300002)(4326008)(2906002)(71200400001)(86362001)(55016002)(66476007)(66946007)(66556008)(64756008)(6506007)(186003)(76116006)(66446008)(7696005)(91956017)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: KwDwKIXTn77QD+KsrZiemU/6miDs/pBjdGnlZEYn6b1rWjsGp1j6JAhm83JY3wY9PvBjS1GZQ0jQCNLFwkUc4RZNzMV5D9tfLux4fNzhz/v16rnH/rQbdVQQBq90WEbTXTyYicEvBch3efhqDkA9zAbuyVwIsyvgkQVCzbD/XT1OQ1CYYkRI0Dwz6jnz2lnj5JXx9d1/zF6iRil2JiEfUHUJELqoEHzRP+UpZEFpV3VVouJiUYVBrkX92r3nVRGUwbIVy8K/bXlUaDkocY+zCuMXlyEO1tGNxoqkMgapbP+HuIaJSSlHvlvWGQeydd3IpuMjJ5xj0n1vBB0DAnGdaDSQeEW9kVRXhTT88uPoKc2PGK4JyLLi0N4+MK4eqCdIoT8GD44wQ/Zy9ixRoYdfq9pFzvYMoEiAcVKVK+TCjBKCskh5R976A2tlzBC5vaEXELrUfTDC75KE5fE8c/GmMEY2WQ9ADO08/a2/WuyB10Y=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 470405fc-5272-46db-f882-08d800c9d242
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 16:36:48.7966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F36PK3tQw0boz1qKZS/8gHiBPrCup+vmLU14tAHQfWun5jqbvePvE8/6FnxfvBpVpeIIAZPo+QDsffA97GzG8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0072
X-OriginatorOrg: synopsys.com
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

looks like I'll finally have some time for review of "drm/arc: Move to drm/tiny".
So, is it possible to find all these changes in any public git repo?

Thanks.
---
 Eugeniy Paltsev
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
