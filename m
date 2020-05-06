Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 145921C79CE
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 21:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029096E8C9;
	Wed,  6 May 2020 19:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0224.hostedemail.com
 [216.40.44.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF9B6E8C9;
 Wed,  6 May 2020 19:01:47 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 9A33D180A7340;
 Wed,  6 May 2020 19:01:45 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1535:1544:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2559:2562:2828:3138:3139:3140:3141:3142:3355:3622:3865:3866:3867:3868:3870:3871:3872:3874:4321:4605:5007:6119:7903:8603:10004:10848:11026:11232:11657:11658:11914:12043:12048:12296:12297:12438:12555:12679:12740:12760:12895:13019:13161:13229:13439:14096:14097:14659:14721:21080:21212:21433:21451:21627:21972:21990:30045:30054:30075:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: kiss33_6657176918f26
X-Filterd-Recvd-Size: 5441
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf11.hostedemail.com (Postfix) with ESMTPA;
 Wed,  6 May 2020 19:01:43 +0000 (UTC)
Message-ID: <006e29037a9314fb286a5d6d84905bce99cef6c7.camel@perches.com>
Subject: Re: [PATCH] drm/amdgpu: allocate large structures dynamically
From: Joe Perches <joe@perches.com>
To: Arnd Bergmann <arnd@arndb.de>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "David
 (ChunMing) Zhou" <David1.Zhou@amd.com>,  David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>, 
 John Clements <john.clements@amd.com>
Date: Wed, 06 May 2020 12:01:41 -0700
In-Reply-To: <20200505140208.284473-1-arnd@arndb.de>
References: <20200505140208.284473-1-arnd@arndb.de>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
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
Cc: Guchun Chen <guchun.chen@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Dennis Li <Dennis.Li@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-05-05 at 16:01 +0200, Arnd Bergmann wrote:
> After the structure was padded to 1024 bytes, it is no longer
> suitable for being a local variable, as the function surpasses
> the warning limit for 32-bit architectures:
> 
> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:587:5: error: stack frame size of 1072 bytes in function 'amdgpu_ras_feature_enable' [-Werror,-Wframe-larger-than=]
> int amdgpu_ras_feature_enable(struct amdgpu_device *adev,
>     ^
> 
> Use kzalloc() instead to get it from the heap.
[]
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
[]
> @@ -588,19 +588,23 @@ int amdgpu_ras_feature_enable(struct amdgpu_device *adev,
>  		struct ras_common_if *head, bool enable)
>  {
>  	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
> -	union ta_ras_cmd_input info;
> +	union ta_ras_cmd_input *info;
>  	int ret;
>  
>  	if (!con)
>  		return -EINVAL;
>  
> +        info = kzalloc(sizeof(union ta_ras_cmd_input), GFP_KERNEL);

Spaces were used for indentation here not a tab.
It might be useful to run your proposed patches through checkpatch

Is this an actual bug fix as the previous use didn't
zero unused info members?

> +	if (!info)
> +		return -ENOMEM;
> +
>  	if (!enable) {
> -		info.disable_features = (struct ta_ras_disable_features_input) {
> +		info->disable_features = (struct ta_ras_disable_features_input) {
>  			.block_id =  amdgpu_ras_block_to_ta(head->block),
>  			.error_type = amdgpu_ras_error_to_ta(head->type),
>  		};
>  	} else {
> -		info.enable_features = (struct ta_ras_enable_features_input) {
> +		info->enable_features = (struct ta_ras_enable_features_input) {
>  			.block_id =  amdgpu_ras_block_to_ta(head->block),
>  			.error_type = amdgpu_ras_error_to_ta(head->type),
>  		};
> @@ -609,26 +613,33 @@ int amdgpu_ras_feature_enable(struct amdgpu_device *adev,
>  	/* Do not enable if it is not allowed. */
>  	WARN_ON(enable && !amdgpu_ras_is_feature_allowed(adev, head));
>  	/* Are we alerady in that state we are going to set? */
> -	if (!(!!enable ^ !!amdgpu_ras_is_feature_enabled(adev, head)))
> -		return 0;
> +	if (!(!!enable ^ !!amdgpu_ras_is_feature_enabled(adev, head))) {

And trivia:

The !! uses with bool seem unnecessary and it's probably better
to make amdgpu_ras_is_feature_enabled to return bool.

Maybe something like:
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 538895cfd862..05c4eaf0ddfa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -526,16 +526,16 @@ void amdgpu_ras_parse_status_code(struct amdgpu_device* adev,
 }
 
 /* feature ctl begin */
-static int amdgpu_ras_is_feature_allowed(struct amdgpu_device *adev,
-		struct ras_common_if *head)
+static bool amdgpu_ras_is_feature_allowed(struct amdgpu_device *adev,
+					  struct ras_common_if *head)
 {
 	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
 
 	return con->hw_supported & BIT(head->block);
 }
 
-static int amdgpu_ras_is_feature_enabled(struct amdgpu_device *adev,
-		struct ras_common_if *head)
+static bool amdgpu_ras_is_feature_enabled(struct amdgpu_device *adev,
+					  struct ras_common_if *head)
 {
 	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
 
@@ -560,7 +560,7 @@ static int __amdgpu_ras_feature_enable(struct amdgpu_device *adev,
 	 */
 	if (!amdgpu_ras_is_feature_allowed(adev, head))
 		return 0;
-	if (!(!!enable ^ !!amdgpu_ras_is_feature_enabled(adev, head)))
+	if (!(enable ^ amdgpu_ras_is_feature_enabled(adev, head)))
 		return 0;
 
 	if (enable) {
@@ -609,7 +609,7 @@ int amdgpu_ras_feature_enable(struct amdgpu_device *adev,
 	/* Do not enable if it is not allowed. */
 	WARN_ON(enable && !amdgpu_ras_is_feature_allowed(adev, head));
 	/* Are we alerady in that state we are going to set? */
-	if (!(!!enable ^ !!amdgpu_ras_is_feature_enabled(adev, head)))
+	if (!(enable ^ amdgpu_ras_is_feature_enabled(adev, head)))
 		return 0;
 
 	if (!amdgpu_ras_intr_triggered()) {



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
