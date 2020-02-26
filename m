Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB2F1701CA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 16:01:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C573589B7D;
	Wed, 26 Feb 2020 15:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770087.outbound.protection.outlook.com [40.107.77.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70666892A5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 15:01:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBp8n1cGuOVaFY3DcWprX3eEZOh+5wYSdUs+w/cQ5YalYd2BD8D5//0DyJ91uk34wnf0GzeXHiNrIYsO5Z8b8ecZvsK6q14ddePISsRXFzt5jkw9j7yF1mkNfk8IcJKQznOWVb8yjBieujiyjd7nXcclf+aTYBVaCx+Y9o6oskaKDkkiNb9n6PfUMZKNXmuK3xWohWn4hIUl+3ZtWm7VC5GiPSTxEBM5gamNP7EY+4wwtPzyNgtqaaEF8482BzEKeZvUduFcjI2YQsFpndys3RJK8G5G8nH7hTQ4W2EhOYbLdpvUenQmM0SrU/IiuybLXz32mowvh4hUT4QnHUhjbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qC4iOhRLfGV7TLkyYT+KweWP6378eoLQcUqovdsUKR8=;
 b=ZagPNNCArGggvmKPPWTkhpw3BrgVSkZVztM+tCWETLk8ceAJINyglWnWBvTrupvTxvKptlJFIAM20o7HFgEunoOLrmNVzmpXRQ+GngJTlaWaTdzszfXLzwntUnoxs824hai6rQ2n5SrTkPokqMglmyoI8ub2mFQkQ9rHHun6l4crmYvD6ktR98jHINkTktj8kcWtqHH6U7Yj1EUcbIZixeJbi2292wxz+KOhKFMnrCM1cPi+fRa5SwVwuxbVtbK9WHm90ugZ36jxs0aK/Rg9WWOLFkcyhV6CXrmLlpLeNbEWWOxjwPZc5X9wtcd2cSP77ykwYOqbu1a606xZcYjy/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qC4iOhRLfGV7TLkyYT+KweWP6378eoLQcUqovdsUKR8=;
 b=a+ACZ+PitlEXswGcSGnJxVH5nVQi2swTMXZfEKvi4eda7Si4K3Myi/NXV2qqto1Ax2j9/FnkZAUlO4YmDKJaQTNF/+POkruJ27GQAXqr19DlrpPD8sCjYFZmofOuTr7ooS1tzuSXYX+fEwSXJLprkIbk/N/DDo7zw+YGYcUJmhs=
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (2603:10b6:208:c7::25)
 by MN2PR05MB6510.namprd05.prod.outlook.com (2603:10b6:208:d6::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.10; Wed, 26 Feb
 2020 15:01:15 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::b4a2:5c46:955a:2850]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::b4a2:5c46:955a:2850%7]) with mapi id 15.20.2772.012; Wed, 26 Feb 2020
 15:01:15 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "bigeasy@linutronix.de" <bigeasy@linutronix.de>
Subject: Re: [PATCH 1/2] drm/vmwgfx: Drop preempt_disable() in
 vmw_fifo_ping_host()
Thread-Topic: [PATCH 1/2] drm/vmwgfx: Drop preempt_disable() in
 vmw_fifo_ping_host()
Thread-Index: AQHV6xvSiL0W0Bl8DEylZsszVZrMk6gtlPSA
Date: Wed, 26 Feb 2020 15:01:15 +0000
Message-ID: <b2580fd686c9fea6afdb25f94adeab544a5c1d66.camel@vmware.com>
References: <20200224140726.1550689-1-bigeasy@linutronix.de>
In-Reply-To: <20200224140726.1550689-1-bigeasy@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5 (3.30.5-1.fc29) 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 313179e8-5d6e-44e1-2710-08d7baccb9ec
x-ms-traffictypediagnostic: MN2PR05MB6510:|MN2PR05MB6510:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB65107A2EB3F5A9E13B2FB05EA1EA0@MN2PR05MB6510.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0325F6C77B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(199004)(189003)(36756003)(5660300002)(91956017)(66946007)(76116006)(6486002)(186003)(66446008)(54906003)(64756008)(66556008)(316002)(66476007)(110136005)(86362001)(26005)(6512007)(478600001)(6506007)(2616005)(4326008)(71200400001)(8676002)(81166006)(2906002)(8936002)(4744005)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6510;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3K29dS+kQ6zaJaHcciEhaJybYLuDmM9wHLYQy9JaoJs9uK9MSTMHf/fGeSYogINmv79bS3sU3RFWfWQPqrSUxipk6t1H5E+u/2OpxDA5x7nkTLNBSmN+ZDLH2066xf4QgmAYFjPk9LYfv9/chajWGO2sZYzb/VV/0nTh+DedJDfAHq0qk1mbGK//VGw8Zts16fxtZWhwJKIMzgqD/rr14lowQifc56y9T7QcZVmIWr2lLy3WH52jkYeE8+zIpr5CkRMnZ9YdwGQ7Y30iGTnJwPUbp2dzRtV0lb8Q1LcbmTgXMPeN61Dz1ssiHAZlA317CaNg8iqWHf3kxc38BsXj9oLd/oD5QN/t4DB87L2p2j9KZH+eQa3mUP7Q1rMfnuxJIRa5gypYJFXRIZUpEZQYLY0XfoLHqU0ASDFWSS+0SQXE4k04kfL/dE3skXMyoUCD
x-ms-exchange-antispam-messagedata: 9Kt/BJTybUNJUoYYCP5ihlDmkZIwnYNJC2OjIS0xfSxB7eWNqlVHOE/teeqANSY2zDwGHXiXWlIoMXYkIK56Bcq/3x0e4+cVuaFvKCNVvOgOPdhENyKYdo04HeQ5C8rD82hOy+cbyw7N4wG2yTUGHg==
Content-ID: <6004531437E50742912F6CB284E9BCA8@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 313179e8-5d6e-44e1-2710-08d7baccb9ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2020 15:01:15.0831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vRy78cGBro878CGXuIzxObDULQatScjnl4yS2PLC+/0e6t1tkXTXl5WrjQ7Fr51pj1JgfVF4yFJ+mH36xbs9Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6510
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
Cc: "tglx@linutronix.de" <tglx@linutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-02-24 at 15:07 +0100, Sebastian Andrzej Siewior wrote:
> vmw_fifo_ping_host() disables preemption around a test and a register
> write via vmw_write(). The write function acquires a spinlock_t typed
> lock which is not allowed in a preempt_disable()ed section on
> PREEMPT_RT. This has been reported in the bugzilla.
> 
> It has been explained by Thomas Hellstrom that this
> preempt_disable()ed
> section is not required for correctness.
> 
> Remove the preempt_disable() section.
> 

Hi, Sebastian,

I suppose there isn't something like a preempt_disable_unless_RT()
macro?

If not,
Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>

I'll include in the next vmwgfx-next pull request

Thanks,
Thomas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
