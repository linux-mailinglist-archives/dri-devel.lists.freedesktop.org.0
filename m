Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 464AB30B5E5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 04:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A20D6E8B9;
	Tue,  2 Feb 2021 03:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456FE6E879
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 03:38:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPBrQWnfoSHl4PNPMN47MPZ2QDTM3UHW13uMOk9/5J1VzUcFZX+qr8NgQEncEQqbx3heg/knD7pK/2z4IyW+uI1qjxGDJ+vQ87VjbBrsHfYrt6w51eJriTuOAqO7jUL/OwYgjtpzAC8RiKCroFmnJ92bZ1VqY7ohBjQU4NFQLh1eW4kZd1H22ismdbOyp/t1YjpAyWsxxQwR8+vFygT2/MsQLitv3m6wPmmvy75iMgWGKWaB8e+zbvHGi5iDP9d0xIlAwI3lWpL9wBV28OiLgE4Wn3EJ55I1yB+/DMhCJWEUzIzY7YqcQg+zWA4RVlQXdcUhDTqatX3ZziCjejpYMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhajBftN17fOD++ViE9K9RvKIXgEA57F57s9X2uEA6s=;
 b=ZIoKMo3g+tziIArkvedwOmpvjS+6uzgSKiFAquNqICsRDmdLO7OcomlA7pJojteAfwXEYPCUXr7kSitL4bbwrL8kAnnWQivbIaX6uzBmvg6FSm5wkRj7KTsZHoLD3CC4uMpuc758AjPi0nHv9ghHeWhB+iisqLskpjuo8x7XDIO6l1zK+KSmd6rJxGbbUI0O+Zo5GqXKVf4H4A1XCBG2mAazMtB03+yGQe7JFFKmAwufIO3sF2yQSnjMVS8S+Zky5olgg3/vnyavCievn85QL4cdVsya04Vqf45KzXHts9CKoELAm11Rhkc3XWnqN/ZCGPkHqkR/OvbECX/6rkgviA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhajBftN17fOD++ViE9K9RvKIXgEA57F57s9X2uEA6s=;
 b=YEhFs+8wdR6yrD+tI02C+y5VUeY7QFPc6jj1VF25edBctNmZCfUOfeliIjPI8Me44wQN2LIffYlamx1ZstmRFg2O4hXYMh/ixwgOZpLkVkRflFQtkYIfyl20IS52krYpSvO7jqBoU4Pc9lAQtDO47GWDFqlFXjhbhcConY5GwbE=
Received: from BN8PR12MB4770.namprd12.prod.outlook.com (2603:10b6:408:a1::30)
 by BN6PR12MB1938.namprd12.prod.outlook.com (2603:10b6:404:fe::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.23; Tue, 2 Feb
 2021 03:38:18 +0000
Received: from BN8PR12MB4770.namprd12.prod.outlook.com
 ([fe80::7426:d23d:284:bf8c]) by BN8PR12MB4770.namprd12.prod.outlook.com
 ([fe80::7426:d23d:284:bf8c%3]) with mapi id 15.20.3805.027; Tue, 2 Feb 2021
 03:38:18 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Imre Deak <imre.deak@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 2/4] drm/dp_mst: Don't cache EDIDs for physical ports
Thread-Topic: [PATCH 2/4] drm/dp_mst: Don't cache EDIDs for physical ports
Thread-Index: AQHW+JIM7RffgkuJZkqsvkVFYOgUoapENbCA
Date: Tue, 2 Feb 2021 03:38:16 +0000
Message-ID: <BN8PR12MB4770A088BA001258FCDE973AFCB59@BN8PR12MB4770.namprd12.prod.outlook.com>
References: <20210201120145.350258-1-imre.deak@intel.com>
 <20210201120145.350258-2-imre.deak@intel.com>
In-Reply-To: <20210201120145.350258-2-imre.deak@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=616056df-641c-4d88-886b-97ede3ca90ab;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-02-02T03:28:20Z;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [218.166.240.186]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0c07aa48-3dfc-406c-ece2-08d8c72bfb6a
x-ms-traffictypediagnostic: BN6PR12MB1938:
x-microsoft-antispam-prvs: <BN6PR12MB19387319841C050C053AA3B1FCB59@BN6PR12MB1938.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XXe1ZTwE+WGIxt0kTOd8GiE3JU67antJIlfPm0M4Y3spn/ELbTs2dAhKX/LHROUeZEwhI20ptwkgQxDBmObzYQvEsPzWdroRROzCeYy5vEbCWhOuePVSkieAoyr7p+v4miCZHyfraaflqkRx9u5/h76+MPa8owkDjmg7cz7xWZ21apyDswZk4lj6OEJVoJBBFyUlELA6rRdpdTrqF3cVxfERlFvIKaSFuQXFMYzVM2XfDAA+4GnF3XF32byhpsno502CMrrTvrijzN6OGFLX1/n6KVMhdHjoVRe9PRI66HOBUYo/MaYrzfREe9KGWTN3NL525UDhu51Ph/oM5xHq/mkgqtfDP4U7A54ld4UdIw3S3JhDDY7oj69bPQcUU9fyO30/YUYTFHXexW4bEUETeOYVt40Ah5ygHafdxoQzYrCyZ5kxPU611rh+n6R2zVhmpFe25x0pyec2y+6yxe9h+4t2a77vK0tr5pFy+sVjZACaY1w8SB1Ww7CzEz5pp4VZ31CP1Pr+zzs82DBGKM3I5g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB4770.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(55016002)(7696005)(76116006)(66946007)(2906002)(110136005)(5660300002)(52536014)(316002)(9686003)(478600001)(66556008)(66476007)(8676002)(71200400001)(66446008)(64756008)(83380400001)(186003)(86362001)(33656002)(53546011)(26005)(4326008)(6506007)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?HRQ07gqZjO026Y3JE8EFypaGd4MEHWb045ju+0BBe61VpY1drWymexuhRxUD?=
 =?us-ascii?Q?tm/MZCZ0kM95KMU6VrgsdB+DG6seGC0zpqHOCa88eRUcSEnh3753IRSNez27?=
 =?us-ascii?Q?xpGobvXQEiv3N12hYsagEDwdtIT6zMd4qZJuxGqn1vHMeWRXtJXknRbZZY70?=
 =?us-ascii?Q?cD0lmi57sisUf9kEcKkVIoCuS22w7pXFsKDln/r1+JPuf15tAaT5ztXntz+h?=
 =?us-ascii?Q?0gC3bGbIf/np32L7h1c1QnUOse5MfSF3dXAi0YVReF7Fi1vdabyS9rdmm2TH?=
 =?us-ascii?Q?vdnoYoc2Ok6PAXTfjt7DtnmzHtCzejdV8isoqhW5IyzSG/iyFj2zwbBgRxOI?=
 =?us-ascii?Q?E+bXvfH2Zyg/mAF8clAVtYhDi3sZULfn2gK/iiXlqSc37/HRNZCcf9BHG/1t?=
 =?us-ascii?Q?DnLbNdoP601ArjortZ2YHHNVWer5oDgcll5Oi/k4umO0LY89oV3yuYadTEUE?=
 =?us-ascii?Q?A7U1YZqZ8ul0c2MYb6Ur7EHS2XmwATPuC1eiiUqlWjvC6Ix94PQtXNWDbgik?=
 =?us-ascii?Q?49vAG23TPG5hzjFLwnUE8tD56uiLPkIz4XWtZrTfD7s8KtvzSAyzHQ2mAsOA?=
 =?us-ascii?Q?q6Hf1GBU4vN6a3Iao5WVrQEezTb0DsQycJW4+DvR2ZmjwJxqwOQUN+0OqJuc?=
 =?us-ascii?Q?qIJOZSzN/YOhFGmjN7nio55pxo4uBe44YwvZJV4EqnnG2JXwnn2L3YvS6Gve?=
 =?us-ascii?Q?NAITzxKJQflrPTAJLHa6tOJ2/jqzla8LjDvDp04hSWGYzQomu5aUSE7w1vfl?=
 =?us-ascii?Q?UIM9eTErS/r/DZiDfsWV+ZQuzVgxyf/PlRkwcGYQ3Cr4mDl4x4OKCJSZSsqu?=
 =?us-ascii?Q?4THhFB/UR8XboqlqOu4XJK5O3+PHhHfjmpmpY0oj4xWMtwphS06Pe/Gx85BS?=
 =?us-ascii?Q?QMqdYgno4nqEqTEBaw0zoHh7FTlHVRmyEwnV5u7a9GPqy29D128O7SyD0a5m?=
 =?us-ascii?Q?Eri1dJ6G/7GVmU4j9zfle7baw0dRFGr5PjgmAiQkSr/p+Nz7V1MplaJESJHf?=
 =?us-ascii?Q?xdFLMIKYNdH6f8+S2+bCfM9dlvO8IKjuc2rY23NP1zeXFBJgwd1o7C3HUvGK?=
 =?us-ascii?Q?IPCOr/ng?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB4770.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c07aa48-3dfc-406c-ece2-08d8c72bfb6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 03:38:18.2998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2+6B+vPAMNecpk5KnZyYW6brhGO9op4727Qnp4nND6P7iRDTJ40/5H4mG/rtQwakvpzmf1igGzA2HWmmg13LqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1938
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]

> -----Original Message-----
> From: Imre Deak <imre.deak@intel.com>
> Sent: Monday, February 1, 2021 8:02 PM
> To: dri-devel@lists.freedesktop.org
> Cc: Lin, Wayne <Wayne.Lin@amd.com>; Lyude Paul <lyude@redhat.com>
> Subject: [PATCH 2/4] drm/dp_mst: Don't cache EDIDs for physical ports
>
> Caching EDIDs for physical ports prevents updating the EDID if a port gets reconnected via a Connection Status Notification message,
> fix this.
>
> Fixes: db1a07956968 ("drm/dp_mst: Handle SST-only branch device case")
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index deb7995f42fa..309afe61afdd 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -2302,7 +2302,8 @@ drm_dp_mst_port_add_connector(struct drm_dp_mst_branch *mstb,
>  }
>
>  if (port->pdt != DP_PEER_DEVICE_NONE &&
> -    drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
> +    drm_dp_mst_is_end_device(port->pdt, port->mcs) &&
> +    port->port_num >= DP_MST_LOGICAL_PORT_0) {
Hi Imre Deak,

Thanks for the patch!
Just curious that you mean we don't want to fetch the EDID of the sst monitor like below case?
    Src->MST device ->SST monitor
I thought we still need to get the EDID even the monitor is connected to the physical output port of mst device.
Maybe what we should fix here is why the EDID is not get updated once reconnected via CSN message?

Thanks!
>  port->cached_edid = drm_get_edid(port->connector,
>   &port->aux.ddc);
>  drm_connector_set_tile_property(port->connector);
> --
> 2.25.1
Regards,
Wayne Lin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
