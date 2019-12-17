Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DACB12415E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0EA6EA3F;
	Wed, 18 Dec 2019 08:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80088.outbound.protection.outlook.com [40.107.8.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E356E0E2;
 Tue, 17 Dec 2019 20:18:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9G57B5Qkn3h+12zDr62wXLH7c4ZPZzKVf4Wgg+9tAQqSJadpZArkOr6FJbrEyAmwfNyu4jNjzitwQbBw6gaTK4PepRnxwuCWBhLWYYXqvNAUprmbMODvaXKHx/plrXM0sm4vrAv7v6xq6cCgZSxpwELmbsu56yB12KsGACtAthUcpVcSch99ESum8M4eSNiCU47HzBf8CSm2xilJ3agKPkccvYI3LFVsjfEFi0KxkpsVRrFjd7U0rWfcJJEWA43UnxBC1+r7PRTcYxAHh6pvKXShyGOe+gAdI8DEKtZI05V/KflZrFwmoE4vYCJJsTrQddOP0Kmo3LxK0Fo0Vwf2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32pgSRpmrM8sZKb8c51223I7nQMqUg4s97VcfgDzCi0=;
 b=NQ8yCNM+PM1AxcLdW1/myJljk8N70KVX4xmELjGKCFCYvsLdfxUSDVl7nY8pmDvzE+CQUQc/E5riAjkbJFbiIZd2WeD7jTcFyXVUwohK+hRWEFQmAM0HHKJiSLzZImTahf3jwg+3topI7fw74zC7RmklVCHw62fMxyaz/RaapGyMF8B4uh3emJPgIgdhsoSrR9Wc2IpLEIg8a+kFauq9fPmBosm8663r9sKsOhjW8t5Eh92wxq5XvdzbcDqZxbtGKnswyffl0pYsbsv5CAXTMANlvbFiJ8qZHWjLpTZ1mfyfGy1W1JmuM71gYjhvWl54yPO0mNwLTh/GgfDcEvbsWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32pgSRpmrM8sZKb8c51223I7nQMqUg4s97VcfgDzCi0=;
 b=MOAL/RFPrsHca65lGDr3G5CupoRHbuWCsH9MD+AOjqSo9MYfgm7g4JRkehgYdi2vxorrYJ1OL8VGWeB1WkH1niT0uNTg/yU7sqQnCXQiYUNtBxVMwiJYGp6wwF9/Co8/DAsWr25A8Utn60O5AXkxfIRo9HZZL/6myzOW+A1RkXg=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4367.eurprd05.prod.outlook.com (52.133.13.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16; Tue, 17 Dec 2019 20:18:21 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18df:a0fe:18eb:a96b]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18df:a0fe:18eb:a96b%6]) with mapi id 15.20.2538.019; Tue, 17 Dec 2019
 20:18:21 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [RFC v2 02/12] drm/i915/svm: Runtime (RT) allocator support
Thread-Topic: [RFC v2 02/12] drm/i915/svm: Runtime (RT) allocator support
Thread-Index: AQHVsgG9iXV/uMilr0qLfmT3axyKUKe+yjaA
Date: Tue, 17 Dec 2019 20:18:21 +0000
Message-ID: <20191217201815.GF16762@mellanox.com>
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
 <20191213215614.24558-3-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20191213215614.24558-3-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DM5PR18CA0070.namprd18.prod.outlook.com
 (2603:10b6:3:22::32) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.68.57.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dc84a8cd-1c23-4213-82fe-08d7832e427e
x-ms-traffictypediagnostic: VI1PR05MB4367:
x-microsoft-antispam-prvs: <VI1PR05MB4367859936B698F1D2CAE23ACF500@VI1PR05MB4367.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 02543CD7CD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(189003)(199004)(2906002)(6916009)(478600001)(1076003)(33656002)(54906003)(6486002)(8936002)(8676002)(81156014)(81166006)(6506007)(5660300002)(26005)(186003)(4326008)(36756003)(7416002)(316002)(86362001)(52116002)(66946007)(2616005)(66446008)(64756008)(66556008)(66476007)(4744005)(6512007)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4367;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OSSO6hx51rXlhIMJbsHyxTFNZkqTNXe+gxnPMdykSR+RjaR2cGZ7PbKG23bjcQARHAj7LzXK7DimBppyKsScgE6fVErV1DtCT9hUqXNLVV4f3QqugqmCerR0Lw7RV1YZmrFtNBVjHC8K2/a9tmDehaRBu1WyqcO/NDclpBZrW4ZOoH7Dxz/jbQRgo4PN+x+arhx5doypeLBmD/rUYXCKALnJb4LwFHnvtx1GTGWK6UyBVHVXN6qWdP6xsw8u3qI+fbzH69t8Lwge8wBfs9khF26mwydP2NPQhyw0aEztTtIOY4zfbqK5QEv1uzaBvpSR5r/OuTe4XzKLmOzwheuJxyON+eo+ThGi65dqVEGGOKe1UkvQ24zxvqqXHwIL8q2cl4ucwWdGDl0ocrKLu458tbclqG8TqOFn++2log+6oFUBZWACPjdiqJR7e2g1DzEu
x-ms-exchange-transport-forked: True
Content-ID: <728C56C7E461EC498048B2839C289399@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc84a8cd-1c23-4213-82fe-08d7832e427e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2019 20:18:21.4349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DaTNlkBZa4b1CsA/7TRVtnsWdmIJgahUsVOIKq/l6HO30KYIXy58nsSFt56O+j3L49pZVjqOL7N0jNZJU94tjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4367
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:03 +0000
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
Cc: "kenneth.w.graunke@intel.com" <kenneth.w.graunke@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "sanjay.k.kumar@intel.com" <sanjay.k.kumar@intel.com>,
 "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jason.ekstrand@intel.com" <jason.ekstrand@intel.com>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "jon.bloomfield@intel.com" <jon.bloomfield@intel.com>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 01:56:04PM -0800, Niranjana Vishwanathapura wrote:
  
> +	ctx = i915_gem_context_lookup(file->driver_priv, args->rsvd1);
> +	if (!ctx || !rcu_access_pointer(ctx->vm))
> +		return -ENOENT;
> +
> +	rcu_read_lock();
> +	vm = i915_vm_get(ctx->vm);
> +	rcu_read_unlock();

This looks like wrong use of RCU to me.

Getting a rcu lock and not calling rcu_dereference under it is
basically guarenteed to be wrong..

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
